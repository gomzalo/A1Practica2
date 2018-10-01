;mmm
.model small
.stack

.data
;                               ENCABEZADO
encabezado0    	    db		"|_________________________________________________|",13,10,"$"
encabezado1         db      "| Universidad de San Carlos de Guatemala          |",13,10,"$"
encabezado2         db      "| Facultad de Ingenieria                          |",13,10,"$"
encabezado3         db      "| Escuela de ciencias y sistemas                  |",13,10,"$"
encabezado4         db      "| Arquitectura de Computadores y Ensambladores 1  |",13,10,"$"
encabezado5         db      "| Seccion B                                       |",13,10,"$"
encabezado6         db      "| Segundo semestre 2018                           |",13,10,"$"
encabezado7         db      "| Gonzalo Antonio Garcia Solares                  |",13,10,"$"
encabezado8         db      "| 201318652                                       |",13,10,"$"
encabezado9         db      "| Segunda practica                                |",13,10,"$"
encabezado10    	db		"|_________________________________________________|",13,10,"$"
;                               MENU
encebazadoM0        db      "||===============================================||",13,10,"$"
encebazadoM1        db      "||-----------------------------------------------||",13,10,"$"
encebazadoM2        db      "||                 Menu principal                ||",13,10,"$"
encebazadoM3        db      "||-----------------------------------------------||",13,10,"$"
encebazadoM4        db      "||===============================================||",13,10,"$"
menuCargar          db      "1. Cargar archivo                                  ",13,10,"$"
menuReporte         db      "2. Crear reporte                                   ",13,10,"$"
menuResultados      db      "3. Mostrar menuResultados                          ",13,10,"$"
menuSalir           db      "4. Salir                                           ",13,10,"$"
menuFin             db      "___________________________________________________",13,10,"$"
menuElige           db      10,13,"Bienvenido, elige una opcion...              ","$"
menuOpcion          db      100 dup(0),"$"
;                               CARGAR ARCHIVO
opcion1             db      "Ingresa la ruta del archivo (con extensipon .arq). ",13,10,"$"
opcion11            db      "Ejemplo: %%archivo.arq%%                           ",13,10,"$"
errorCarga1         db      "El archivo no existe                               ",13,10,"$"
errorCarga2         db      ""
;                               CREAR REPORTE
opcion2             db      "Se generó el reporte.                              ",13,10,"$"
;                               MOSTRAR RESULTADOS
opcion3             db      "Los resultados, respecto a los datos son:          ",13,10,"$"
;                               SALIR
.code
;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::        
;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
main proc
    ; Inicializa DS
    mov ax, @data
    mov ds, ax
    
    call encabezadoMenu
    call menu
    call limpiarPantalla

    .exit
;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::        
;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

; ||------------------------------------------------------------------------------------||
; ||                                   Encabezado                                       ||
; ||------------------------------------------------------------------------------------||
    encabezadoMenu proc
        mov ah, 09h
        lea dx, encabezado0
        int 21h
        lea dx, encabezado1
        int 21h
        lea dx, encabezado2
        int 21h
        lea dx, encabezado3
        int 21h
        lea dx, encabezado4
        int 21h
        lea dx, encabezado5
        int 21h
        lea dx, encabezado6
        int 21h
        lea dx, encabezado7
        int 21h
        lea dx, encabezado8
        int 21h
        lea dx, encabezado9
        int 21h
        lea dx, encabezado10
        int 21h
    encabezadoMenu endp
; ||------------------------------------------------------------------------------------||
; ||                                   Menu principal                                   ||
; ||------------------------------------------------------------------------------------||
; __________________________________ Encabezados de menu __________________________________
    menu proc
        mov ah, 09h
        lea dx, encebazadoM0
        int 21h
        lea dx, encebazadoM1
        int 21h
        lea dx, encebazadoM2
        int 21h
        lea dx, encebazadoM3
        int 21h
        lea dx, encebazadoM4
        int 21h
; __________________________________ Opciones de menu __________________________________
        lea dx, menuCargar
        int 21h
        lea dx, menuReporte
        int 21h
        lea dx, menuSalir
        int 21h
        lea dx, menuFin
        int 21h
        lea dx, menuElige
        int 21h

        ; Leyendo opción elegida
        mov ah, 3fh
        mov bx, 00
        mov cx, 100
        mov dx, offset[menuOpcion]
        int 21h
        ; Mostrando opción elegida
        mov ah, 09h
        lea dx,menuOpcion
        int 21h
        ; Verificando opción elegida
        cmp dx,1
        je esIgual

        esIgual:
            mov ah, 09
            lea dx, opcion1
            int 21h
            lea dx, opcion11
            int 21h
    menu endp
; ||------------------------------------------------------------------------------------||
; ||                                   Limpia pantalla                                  ||
; ||------------------------------------------------------------------------------------||
    limpiarPantalla proc
        mov ah, 06h
        mov al, 3
        int 10h
        ret
    limpiarPantalla endp
; ||------------------------------------------------------------------------------------||
; ||                                   Salir                                            ||
; ||------------------------------------------------------------------------------------||
    salir proc
        mov ax, 4c00h	;Function (Quit with exit code (EXIT))
        int 21h			;Interruption DOS Functions
    salir endp
    
;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
main endp
end main