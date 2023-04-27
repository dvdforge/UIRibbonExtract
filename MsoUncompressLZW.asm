.686p
.XMM
.model flat

_TEXT	SEGMENT

__chkstk        proc near               ; CODE XREF: __alloca_probe_16+11¡üj
                                        ; OfficeSpace::SaxContentHandler::ParseAttributes(ISAXAttributes *)+A¡ýp ...

; FUNCTION CHUNK AT .text:2F16A875 SIZE 0000000C BYTES

                push    ecx
                lea     ecx, [esp+4]
                sub     ecx, eax
                sbb     eax, eax
                not     eax
                and     ecx, eax
                mov     eax, esp
                and     eax, 0FFFFF000h

loc_2F15765F:                           ; CODE XREF: __chkstk+13231¡ýj
                cmp     ecx, eax
                jb      loc_2F16A875
                mov     eax, ecx
                pop     ecx
                xchg    eax, esp
                mov     eax, [eax]
                mov     [esp+0], eax
                retn
loc_2F16A875:                           ; CODE XREF: __chkstk+16¡üj
                sub     eax, 1000h
                test    [eax], eax
                jmp     loc_2F15765F
__chkstk        endp

; __int16 __stdcall MsoUncompressLZW(_BYTE *srcBuffer, _BYTE *dstBuffer, signed int srcSize, int dstSize)
public _MsoUncompressLZW@16
_MsoUncompressLZW@16 proc near         ; CODE XREF: NetUI::GetBitmapFromCache(HBITMAP__ * * &,int,bool,NetUI::Element *,int)+43DDE¡ýp
                                        ; MsoLoadBitmapResourceEx(x,x,x,x)+10B058¡ýp ...

var_6014        = dword ptr -6014h
var_6010        = dword ptr -6010h
var_600C        = dword ptr -600Ch
var_6008        = dword ptr -6008h
var_6004        = dword ptr -6004h
var_6000        = word ptr -6000h
var_5FFE        = word ptr -5FFEh
var_5FFC        = word ptr -5FFCh
srcBuffer       = dword ptr  4
dstBuffer       = dword ptr  8
srcSize         = dword ptr  0Ch
dstSize         = dword ptr  10h

; FUNCTION CHUNK AT .text:2F198082 SIZE 00000063 BYTES
; FUNCTION CHUNK AT .text:2F1BB2AC SIZE 00000028 BYTES

                mov     eax, 6014h
                call    __chkstk
                mov     eax, [esp+6014h+dstSize]
                mov     [esp+6014h+var_6004], eax
                xor     ecx, ecx
                lea     eax, [esp+6014h+var_5FFE]

loc_2F198105:                           ; CODE XREF: MsoUncompressLZW(x,x,x,x)+37¡ýj
                mov     edx, 0FFFFh
                mov     [eax], dx
                xor     edx, edx
                mov     [eax-2], cx
                mov     [eax+2], dx
                inc     ecx
                add     eax, 6
                cmp     ecx, 100h
                jl      short loc_2F198105
                mov     edx, [esp+6014h+dstBuffer]
                dec     [esp+6014h+dstSize]
                push    ebx
                push    ebp
                push    esi
                mov     esi, [esp+6020h+srcBuffer]
                mov     al, [esi]
                mov     [edx], al
                movzx   ax, al
                push    edi
                mov     edi, [esp+6024h+srcSize]
                movzx   ecx, ax
                mov     ebx, 100h
                mov     ebp, 8
                inc     edx
                inc     esi
                cmp     edi, 1
                mov     [esp+6024h+var_600C], ebx
                mov     [esp+6024h+var_6010], ebp
                mov     [esp+6024h+var_6014], ecx
                jle     loc_2F1982A6
                lea     ebx, [ebx]

loc_2F198171:                           ; CODE XREF: MsoUncompressLZW(x,x,x,x)+1B6¡ýj
                cmp     [esp+6024h+dstSize], 0
                jle     loc_2F1982A6
                movzx   eax, word ptr [esp+6024h+var_6014]
                mov     [esp+6024h+var_6008], eax
                movzx   eax, bx
                lea     ecx, [eax-1]
                test    eax, ecx
                jz      loc_2F198082

loc_2F198196:                           ; CODE XREF: MsoUncompressLZW(x,x,x,x)-59¡üj
                movzx   ax, byte ptr [esi]
                mov     ecx, ebp
                sub     ecx, [esp+6024h+var_6010]
                dec     edi
                shl     ax, cl
                inc     esi
                mov     [esp+6024h+srcSize], edi
                movzx   eax, ax
                mov     [esp+6024h+var_6014], eax
                mov     eax, [esp+6024h+var_6010]
                add     eax, 8
                cmp     eax, ebp
                jle     loc_2F198096
                mov     ecx, [esp+6024h+var_6010]
                mov     eax, 8
                sub     eax, ebp
                add     ecx, eax
                mov     al, [esi]
                shr     al, cl
                mov     [esp+6024h+var_6010], ecx
                movzx   cx, al
                or      word ptr [esp+6024h+var_6014], cx

loc_2F1981E0:                           ; CODE XREF: MsoUncompressLZW(x,x,x,x)-A¡üj
                mov     eax, 1
                mov     ecx, ebp
                shl     eax, cl
                dec     eax
                and     [esp+6024h+var_6014], eax
                mov     di, word ptr [esp+6024h+var_6014]
                cmp     di, bx
                jz      loc_2F1982B3

loc_2F1981FC:                           ; CODE XREF: MsoUncompressLZW(x,x,x,x)+1F1¡ýj
                                        ; MsoUncompressLZW(x,x,x,x)+20A¡ýj
                movzx   eax, di
                lea     eax, [eax+eax*2]
                movzx   eax, [esp+eax*2+6024h+var_5FFC]
                or      edi, 0FFFFFFFFh
                sub     edi, eax
                add     [esp+6024h+dstSize], edi
                lea     ecx, [eax+edx]
                lea     edx, [ecx+1]
                js      loc_2F1982A6
                mov     edi, [esp+6024h+var_6004]
                sub     edi, [esp+6024h+dstSize]
                movzx   eax, word ptr [esp+6024h+var_6014]
                mov     edi, edi

loc_2F198231:                           ; CODE XREF: MsoUncompressLZW(x,x,x,x)+168¡ýj
                test    edi, edi
                jle     short loc_2F19824A
                movzx   eax, ax
                lea     eax, [eax+eax*2]
                add     eax, eax
                mov     bl, byte ptr [esp+eax+6024h+var_6000]
                movzx   eax, [esp+eax+6024h+var_5FFE]
                dec     edi
                mov     [ecx], bl
                dec     ecx

loc_2F19824A:                           ; CODE XREF: MsoUncompressLZW(x,x,x,x)+149¡üj
                mov     ebx, 0FFFFh
                cmp     ax, bx
                jnz     short loc_2F198231
                mov     ebx, [esp+6024h+var_600C]
                cmp     word ptr [esp+6024h+var_6014], bx
                jz      short loc_2F198291
                cmp     edi, [esp+6024h+var_6004]
                jg      short loc_2F198291
                movzx   ecx, byte ptr [ecx+1]
                mov     edi, [esp+6024h+var_6008]
                movzx   eax, bx
                lea     eax, [eax+eax*2]
                add     eax, eax
                mov     [esp+eax+6024h+var_6000], cx
                movzx   ecx, di
                lea     ecx, [ecx+ecx*2]
                movzx   ecx, [esp+ecx*2+6024h+var_5FFC]
                inc     cx
                mov     [esp+eax+6024h+var_5FFC], cx
                mov     [esp+eax+6024h+var_5FFE], di

loc_2F198291:                           ; CODE XREF: MsoUncompressLZW(x,x,x,x)+173¡üj
                                        ; MsoUncompressLZW(x,x,x,x)+179¡üj
                mov     edi, [esp+6024h+srcSize]
                inc     ebx

loc_2F198299:                           ; CODE XREF: MsoUncompressLZW(x,x,x,x)+231E5¡ýj
                cmp     edi, 1
                mov     [esp+6024h+var_600C], ebx
                jg      loc_2F198171

loc_2F1982A6:                           ; CODE XREF: MsoUncompressLZW(x,x,x,x)-49¡üj
                                        ; MsoUncompressLZW(x,x,x,x)+7F¡üj ...
                pop     edi
                pop     esi
                pop     ebp
                pop     ebx
                add     esp, 6014h
                retn    10h
; ---------------------------------------------------------------------------

loc_2F1982B3:                           ; CODE XREF: MsoUncompressLZW(x,x,x,x)+10C¡üj
                movzx   eax, word ptr [esp+6024h+var_6008]
                lea     ecx, [eax+eax*2]
                mov     cx, [esp+ecx*2+6024h+var_5FFC]
                movzx   eax, bx
                inc     cx
                lea     eax, [eax+eax*2]
                add     eax, eax
                mov     [esp+eax+6024h+var_5FFC], cx
                movzx   ecx, cx
                neg     ecx
                cmp     ecx, [esp+6024h+dstSize]
                jge     loc_2F1981FC
                movzx   ecx, byte ptr [ecx+edx]
                mov     [esp+eax+6024h+var_6000], cx
                movzx   ecx, word ptr [esp+6024h+var_6008]
                mov     [esp+eax+6024h+var_5FFE], cx
                jmp     loc_2F1981FC
                
loc_2F1BB2AC:                           ; CODE XREF: MsoUncompressLZW(x,x,x,x)-60¡üj
                mov     al, [esi]
                dec     [esp+6024h+dstSize]
                movzx   cx, al
                mov     [edx], al
                movzx   eax, cx
                inc     edx
                inc     esi
                mov     [esp+6024h+var_6014], eax
                mov     ebp, 8
                dec     edi
                mov     ebx, 100h
                jmp     loc_2F198299

loc_2F198082:                           ; CODE XREF: MsoUncompressLZW(x,x,x,x)+A6¡ýj
                mov     eax, 1000h
                cmp     bx, ax
                jnb     loc_2F1BB2AC
                inc     ebp
                jmp     loc_2F198196
; ---------------------------------------------------------------------------

loc_2F198096:                           ; CODE XREF: MsoUncompressLZW(x,x,x,x)+D2¡ýj
                dec     edi
                cmp     edi, 1
                mov     [esp+6024h+srcSize], edi
                jl      loc_2F1982A6
                movzx   di, byte ptr [esi]
                mov     ax, word ptr [esp+6024h+var_6014]
                mov     bl, [esi+1]
                add     ecx, 0FFFFFFF8h
                shl     di, cl
                mov     ecx, [esp+6024h+var_6010]
                inc     esi
                or      ax, di
                mov     edi, 10h
                sub     edi, ebp
                add     ecx, edi
                shr     bl, cl
                mov     [esp+6024h+var_6010], ecx
                movzx   cx, bl
                mov     ebx, [esp+6024h+var_600C]
                or      ax, cx
                mov     word ptr [esp+6024h+var_6014], ax
                jmp     loc_2F1981E0
_MsoUncompressLZW@16 endp
                
_TEXT	ENDS
end