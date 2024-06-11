Include Irvine32.inc
.DATA                   ; Data section
pyramidHeight DWORD 6   ; Height of the pyramid

.CODE                   ; Code section
main PROC               ; Main procedure

    MOV EAX, pyramidHeight     ; Move pyramidHeight to EAX
    MOV ECX, 0               ; Initialize loop counter to 0

    ; Loop to print the pyramid pattern
    L1:
        ; Loop to print spaces before the asterisks
        MOV EBX, EAX               ; Move pyramidHeight to EBX
        SUB EBX, ECX               ; Subtract loop counter from EBX
        DEC EBX                    ; Decrement EBX to account for zero-based indexing
        MOV ESI, EBX               ; Move EBX to ESI
        L2:
            mov dx, ' '
            CALL WriteChar   ; Print space character
            DEC ESI                 ; Decrement ESI
            CMP ESI, 0               ; Compare ESI with 0
            JG L2                   ; Jump to L2 if ESI > 0

        ; Loop to print asterisks
        MOV ESI, ECX             ; Move loop counter to ESI
        ADD ESI, ECX               ; Add loop counter to ESI
        ADD ESI, 1                 ; Add 1 to ESI for asterisk count
        L3:
            mov dx, '*'
            CALL WriteChar    ; Print asterisk character
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
END main        