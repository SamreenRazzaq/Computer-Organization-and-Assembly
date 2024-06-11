; Inverse Pyramid Pattern in Assembly using Irvine32 Library

INCLUDE Irvine32.inc    ; Include Irvine32 library

.DATA                   ; Data section
pyramidHeight DWORD 5    ; Height of the inverse pyramid

.CODE                   ; Code section
main PROC               ; Main procedure

    MOV EAX, pyramidHeight     ; Move pyramidHeight to EAX
    MOV ECX, 0                  ; Initialize loop counter to 0

    ; Loop to print the inverse pyramid pattern
    L1:
        ; Loop to print spaces before the asterisks
        MOV EBX, ECX               ; Move loop counter to EBX
        L2: 
            mov dx,' '
            CALL WriteChar    ; Print space character
            INC EBX                 ; Increment EBX
            CMP EBX, EAX            ; Compare EBX with pyramidHeight
            JL L2                   ; Jump to L2 if EBX < pyramidHeight

        ; Loop to print asterisks
        MOV ESI, EAX               ; Move pyramidHeight to ESI
        SUB ESI, ECX               ; Subtract loop counter from ESI
        ADD ESI, 1                 ; Add 1 to ESI for asterisk count
        L3:
            mov dx,'*'
            CALL WriteChar       ; Print asterisk character
            DEC ESI                 ; Decrement ESI
            CMP ESI, 0               ; Compare ESI with 0
            JG L3                   ; Jump to L3 if ESI > 0

        CALL Crlf                  ; Move to the next line
        INC ECX                    ; Increment loop counter
        CMP ECX, pyramidHeight     ; Compare loop counter with pyramidHeight
        JL L1                      ; Jump to L1 if ECX < pyramidHeight

    ; Exit the program
    MOV EAX, 0                   ; Set EAX to 0 to indicate successful termination
    CALL ReadInt                 ; Wait for user input
    EXIT

main ENDP               ; End of main procedure
END main                 ; End of program