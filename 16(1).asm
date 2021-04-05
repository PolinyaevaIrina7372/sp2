format PE

section '.data' writeable

arr db 10000000b,01000000b,00100000b,00010000b,00001000b,00000100b,00000010b,00000001b
arrsize = 8

section '.text' executable
entry start
start:

        mov esi, arr ; загружаем адрес массива
        mov ecx, 0   ; загружаем счётчик элеменов
        mov eax, 0   ; сюда будем грузить каждый элемент
        mov ebx, 0   ; сюда будем складывать сумму элементов


        cycle:
                lodsb ; mov eax, [esi]
                test al, 01000000b ; ax & 01000000b
                jz zero ; jump zero - jump IF zero
                shr al, 1 ; ax >> 1  00001000 -> 00000100
                zero:
                add ebx, eax ; ebx += eax
        
        continue:
                add ecx, 1          ; увеличивам счетчик обработанных байт
                cmp ecx, arrsize    ; ecx != arrsize
                jne cycle            ; jump IF equal �� ���� �� ������� ���� ecx �� ����� ������� �������

ret ; выходим из программы

