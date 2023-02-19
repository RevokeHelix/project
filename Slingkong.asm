IDEAL
MODEL small
STACK 100h
DATASEG
; constants
VIDMEM      equ 0B800h
SCREENW     equ 80
SCREENH     equ 25
SNAKECOLOR  equ 0C82Ah

CODESEG
;description


;Activate graphics mode
PROC ActivateGraphics
    push bp
    mov bp,sp
    push ax
    
    MOV AH, 00h   ; set AH to 00h to indicate the video mode function
    MOV AL, 13h   ; set AL to 13h to indicate the graphics mode to activate
    INT 10h       ; call the BIOS interrupt to activate the graphics mode

    MOV AX, 0A000h ; set AX to the starting address of the video memory (0A000h for mode 13h)
    MOV ES, AX    ; set ES to the segment address of the video memory
    
    mov al, 0002
    MOV BL, 0Fh     ; set BL to the new color index value (0Fh = white)
    mov cx,1
    mov dx,1
    mov ah,0Ch
    int 10h

    pop ax
    pop bp

    ret
ENDP ActivateGraphics

start:

call ActivateGraphics

exit: ; exit the function
    mov ax, 4c00h
    int 21h
END start