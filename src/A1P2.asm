;mmm
.model small

.data
encabezado1         db      "Universidad de San Carlos de Guatemala             ",13,10,"$"
encabezado2         db      "Facultad de Ingenieria                             ",13,10,"$"
encabezado3         db      "Escuela de ciencias y sistemas                     ",13,10,"$"
encabezado4         db      "Arquitectura de Computadores y Ensambladores 1     ",13,10,"$"
encabezado5         db      "Seccion B                                          ",13,10,"$"
encabezado6         db      "Segundo semestre 2018                              ",13,10,"$"
encabezado7         db      "Gonzalo Antonio Garcia Solares                     ",13,10,"$"
encabezado8         db      "201318652                                          ",13,10,"$"
encabezado9         db      "Segunda practica                                   ",13,10,"$"
encabezado10    	db		"___________________________________________________",13,10,"$"
menu1               db      "1. Cargar archivo                                  ",13,10,"$"
menu2               db      "2. Crear reporte                                   ",13,10,"$"
menu3               db      "3. Salir                                           ",13,10,"$"

.code 

mostrarMenu:

    mov ax,@data

    mov ds,ax

    mov ah,09
    mov dx,offset encabezado1
    int 21h
    mov dx,offset encabezado2
    int 21h
    mov dx,offset encabezado3
    int 21h
    mov dx,offset encabezado4
    int 21h
    mov dx,offset encabezado5
    int 21h
    mov dx,offset encabezado6
    int 21h
    mov dx,offset encabezado7
    int 21h
    mov dx,offset encabezado8
    int 21h
    mov dx,offset encabezado9
    int 21h
    mov dx,offset encabezado10
    int 21h
    mov dx,offset menu1
    int 21h
    mov dx,offset menu2
    int 21h
    mov dx,offset menu3
    int 21h

    mov ax,4c00h
    int 21h

end mostrarMenu
code ends