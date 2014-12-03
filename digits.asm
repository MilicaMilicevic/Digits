;Iterate through array located on SOURCE and find all digits.Every found digit move to array DIGITS. 

;Proci kroz niz na lokaciji SOURCE i pronaci sve numericke cifre. Svaku pronadjenu cifru je potrebno 
;prebaciti u niz DIGITS.

SECTION .data
source TIMES 2 db 'a'
       db	'3','4'
       db	'T'
source_lenght equ $-source

SECTION .bss
digits resb source_lenght ;source_lenght is a max number of found digits

SECTION .text
global _start
_start:

MOV ESI,source
MOV EDI,digits
MOV ECX,source_lenght

iterate:
      CMP BYTE[ESI],48
      JB non_digit
      CMP BYTE[ESI],57
      JA non_digit
      MOV AL,BYTE[ESI] ;storage to digits
      MOV BYTE[EDI],AL
      INC EDI

non_digit:
      INC ESI
      LOOP iterate

MOV EAX,1
MOV EBX,0
INT 80h