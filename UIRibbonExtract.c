#include <windows.h>
#include <stdio.h>
#include <assert.h>

typedef __int16 (__stdcall* ProcMsoUncompressLZW)(UCHAR *srcBuffer, UCHAR *dstBuffer, int srcSize, int dstSize);
__int16 __stdcall MsoUncompressLZW(UCHAR *srcBuffer, UCHAR *dstBuffer, int srcSize, int dstSize);

UCHAR DstBuffer[1024 * 1024 * 1];
void DumpUIRibbon(VOID* pData, DWORD nSize, int FileId)
{
    char FileName[128];
    __int16 rs;
    FILE* hFile;
    
    short* v = (short*)pData;
    int Width = v[0];
    int Height = v[1];
    int BitCount = v[2];
    int SizeLineDst = ((Width * BitCount / 8 + 3) & 0xFFFFFFFC);
    int dstSize = SizeLineDst * Height;
    
    int PaletteCount = 0;
    BITMAPFILEHEADER FileHead = {0};
    BITMAPINFO Info = {0};
    
    printf("%d.bmp: width=%d height=%d bitdepth=%d", FileId, Width, Height, BitCount);
    rs = MsoUncompressLZW((UCHAR*)&v[3], DstBuffer, nSize - 6, dstSize);
    printf(" rs=%d\n", rs);
    
    sprintf(FileName, "UIRibbonBmp\\%d.bmp", FileId);
    hFile = fopen(FileName, "wb");
    assert(hFile != NULL);

    // Init BITMAPFILEHEADER
    FileHead.bfType = 0x4D42;
    FileHead.bfOffBits = sizeof(BITMAPFILEHEADER) + sizeof(BITMAPINFOHEADER) + PaletteCount*sizeof(RGBQUAD);
    FileHead.bfReserved1 = 0;
    FileHead.bfReserved2 = 0;

    Info.bmiHeader.biSize = sizeof(BITMAPINFOHEADER);
    Info.bmiHeader.biPlanes = 1;
    Info.bmiHeader.biBitCount = (WORD)BitCount;
    Info.bmiHeader.biCompression = BI_RGB;
    Info.bmiHeader.biXPelsPerMeter = 2834; // 72DPI
    Info.bmiHeader.biYPelsPerMeter = 2834; // 72DPI
    Info.bmiHeader.biClrUsed = PaletteCount;
    Info.bmiHeader.biClrImportant = 0;
    Info.bmiHeader.biWidth = Width;
    #ifdef BMP_TOPDOWN
    Info.bmiHeader.biHeight = -Height;
    #else
    Info.bmiHeader.biHeight = Height;
    #endif
    Info.bmiHeader.biSizeImage = SizeLineDst * Height;
    FileHead.bfSize = FileHead.bfOffBits + Info.bmiHeader.biSizeImage;

    // Write file
    fwrite(&FileHead, 1, sizeof(BITMAPFILEHEADER), hFile);
    fwrite(&Info.bmiHeader, 1, sizeof(BITMAPINFOHEADER), hFile);
    fwrite(DstBuffer, 1, dstSize*BitCount/8, hFile);
    fclose(hFile);
}

BOOL CALLBACK ProcEnumResName(HMODULE hModule, LPCTSTR Type, LPTSTR Name, LONG_PTR Param)
{
    HRSRC hRsrc = FindResource(hModule, Name, Type);
    if (hRsrc != NULL) {
        HGLOBAL hGlobal = LoadResource(hModule, hRsrc);
        VOID* pData = LockResource(hGlobal);
        DWORD nSize = SizeofResource(hModule, hRsrc);
        DumpUIRibbon(pData, nSize, (int)Name);

    } else {
        printf("Error: cannot find resource: %d\n", (int)Name);
    }
    return TRUE;
}

int main(int argc, char* argv[])
{
    HMODULE hModule = LoadLibrary("UIRibbonRes.dll");
    if (hModule != NULL) {
        CreateDirectory("UIRibbonBmp", NULL);
        EnumResourceNames(hModule, (LPTSTR)998, ProcEnumResName, 0);
    } else {
        printf("Error: cannot load UIRibbonRes.dll\n");
    }
    return 0;
}