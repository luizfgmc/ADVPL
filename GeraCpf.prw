#include 'protheus.ch' 
#include 'parmtype.ch' 

/*/{Protheus.doc} GeraCPF
//Função para gera CPF aleatório.
@author root
@since 19/06/2019
@version 1.0
@return ${return}, ${CPF}

@type function
/*/
User Function GeraCPF()

	Local cCpf 		:= ''
	Local aCpf 		:= {}
	Local nX 		:= 0
	Local nY 		:= 0
	Local n1Digito	:= 0
	Local n2Digito	:= 0
	Local nResto	:= 0
	Local nInteiro	:= 0

	/*  Gera sequencia dos 9 primeiros digitos  */
	For nX := 1 to 9 
		aAdd (aCpf, RANDOMIZE( 1, 10 ) )
		cCpf += cValToChar( aCpf[nX] )
	Next nX

	For nY := 10 to 2 STEP -1
		n1Digito += aCpf[(10 - nY + 1)] * nY
		n2Digito += aCpf[(10 - nY + 1)] * (nY + 1)
	Next nY
	
	/*  Calculo do primeiro digito  */
	nInteiro 	:= Int( n1Digito / 11 )
	nResto  	:= Mod( n1Digito , 11 )
	n1Digito 	:= IIF( nResto > 2, 11 - nResto, 0 )
	
	/*  Adicina 1 digito ao calculo do 2 digito  */
		n2Digito += n1Digito * 2
	
	/*  Calculo do seguno digito  */
	nInteiro 	:= Int( n2Digito / 11 )
	nResto  	:= Mod( n2Digito , 11 )
	n2Digito 	:= IIF( nResto > 2, 11 - nResto, 0 )

	/*  Monta Cpf */
	cCpf 		+= cValToChar(n1Digito) + cValToChar(n2Digito)

Return cCpf