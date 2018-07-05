TITLE Elementary Arithmetic     (arithmetic.asm)

; Author: Andrew Swaim
; Date: 1/21/2018
; Description: Displays my name and program title on the output screen;
;		displays instructions for the user; prompts the user to enter
;		two numbers; calculates the sum, difference, product, (integer)
;		quotient and remainder of the numbers; and displays a
;		terminating message.

INCLUDE Irvine32.inc

.data

num1		DWORD	?		;first number input by user
num2		DWORD	?		;second number input by user
sum			DWORD	?		;sum of the numbers
diff		DWORD	?		;difference of the numbers
prod		DWORD	?		;product of the numbers
quot		DWORD	?		;quotient of the numbers
remain		DWORD	?		;remainder of the quotient
program		BYTE	"	Elementary Arithmetic",0
author		BYTE	"	by Andrew Swaim",0
rules1		BYTE	"Enter 2 numbers, and I'll show you the sum, difference,",0
rules2		BYTE	"product, quotient, and remainder.",0
prompt1		BYTE	"First number: ",0
prompt2		BYTE	"Second number: ",0
valid1		BYTE	"The second number must be less than the first!",0
valid2		BYTE	"Don't worry, I switched them for you.",0
outEq		BYTE	" = ",0
outPlus		BYTE	" + ",0
outMinus	BYTE	" - ",0
outProd		BYTE	" x ",0
outQuot		BYTE	" ", 246, " ",0
outRem		BYTE	" remainder ",0
goodbye		BYTE	"Impressed? Bye!",0

.code
main PROC
;Display program name
	mov		edx,OFFSET program
	call	WriteString
;Display author name
	mov		edx,OFFSET author
	call	WriteString
	call	Crlf
	call	Crlf
;Display instructions line 1
	mov		edx,OFFSET rules1
	call	WriteString
	call	Crlf
;Display instructions line 2
	mov		edx,OFFSET rules2
	call	WriteString
	call	Crlf
	call	Crlf

;Get an integer for the first number
	mov		edx,OFFSET prompt1
	call	WriteString
	call	ReadInt
	mov		num1,eax
;Get an integer for the second number
	mov		edx,OFFSET prompt2
	call	WriteString
	call	ReadInt
	mov		num2,eax
;Validate the input and if OK jump to inputOK
	mov		ebx,num1
	cmp		ebx,eax
	ja		inputOK
;If a > b, swap a and b values
	mov		num1,eax
	mov		num2,ebx
;Indicate that the values were switched
	call	Crlf
	mov		edx,OFFSET valid1
	call	WriteString
	call	Crlf
	mov		edx,OFFSET valid2
	call	WriteString
	call	Crlf
	call	Crlf

inputOK:
;Add the numbers and store in sum
	mov		eax,num1
	add		eax,num2
	mov		sum,eax
;Subtract the numbers and store in diff
	mov		eax,num1
	sub		eax,num2
	mov		diff,eax
;Multiply the numbers and store in prod
	mov		eax,num1
	mul		num2
	mov		prod,eax
;Divide the numbers and store in quot and remain
	mov		eax,num1
	cdq
	div		num2
	mov		quot,eax
	mov		remain,edx

;Display the sum result
	mov		eax,num1
	call	WriteDec
	mov		edx,OFFSET outPlus
	call	WriteString
	mov		eax,num2
	call	WriteDec
	mov		edx,OFFSET outEq
	call	WriteString
	mov		eax,sum
	call	WriteDec
	call	Crlf
;Display the difference result
	mov		eax,num1
	call	WriteDec
	mov		edx,OFFSET outMinus
	call	WriteString
	mov		eax,num2
	call	WriteDec
	mov		edx,OFFSET outEq
	call	WriteString
	mov		eax,diff
	call	WriteDec
	call	Crlf
;Display the product result
	mov		eax,num1
	call	WriteDec
	mov		edx,OFFSET outProd
	call	WriteString
	mov		eax,num2
	call	WriteDec
	mov		edx,OFFSET outEq
	call	WriteString
	mov		eax,prod
	call	WriteDec
	call	Crlf
;Display the quotient and remainder result
	mov		eax,num1
	call	WriteDec
	mov		edx,OFFSET outQuot
	call	WriteString
	mov		eax,num2
	call	WriteDec
	mov		edx,OFFSET outEq
	call	WriteString
	mov		eax,quot
	call	WriteDec
	mov		edx,OFFSET outRem
	call	WriteString
	mov		eax,remain
	call	WriteDec
	call	Crlf
	call	Crlf

;Say goodbye
	mov		edx,OFFSET goodbye
	call	WriteString
	call	Crlf
	call	Crlf
	exit	; exit to operating system
main ENDP

END main
