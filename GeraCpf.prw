#include 'protheus.ch' 
#include 'parmtype.ch' 

User Function GeraCPF()

	Local cCpf 		:= ''
	Local aCpf 		:= {}
	Local nX 		:= 0
	Local n1Digito	:= 0
	Local n2Digito	:= 0
	Local nResto	:= 0
	Local nInteiro	:= 0

	/*  Gera sequencia dos 9 primeiros digitos  */
	For nX := 1 to 9 
		aAdd (aCpf, RANDOMIZE( 1, 10 ) )
	Next nX

	For nY := 10 to 2 STEP -1
		n1Digito += aCpf[nY - (10 - nY + 1)] * nY
		n2Digito += aCpf[nY - (10 - nY + 1)] * (nY + 1)
	Next nY
	
	/*  Calculo do primeiro digito  */
	nInteriro 	:= Int( n1Digito / 11 )
	nResto  	:= Mod( n1Digito , 11 )
	n1Digito := IIF (nResto > 2, nInteiro - nRest, 0 )

	/*  Calculo do seguno digito  */
	nInteriro 	:= Int( n2Digito / 11 )
	nResto  	:= Mod( n2Digito , 11 )
	n2Digito := IIF (nResto > 2, nInteiro - nRest, 0 )

	/*  Monta Cpf */
	cCpf := ArrToStr(aCpf) + n1Digito + n2Digito

Return cCpf

10 - 9 = 1
9  - 7 = 2
8  - 5