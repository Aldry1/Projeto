programa
{	
	inclua biblioteca Texto --> txt //permite a procura por trechos dentro de um texto/palavra
	inclua biblioteca Util --> u // utilizada para fazer o sorteio da palavra oculta
	
	funcao inicio()
	{
	inteiro  i, r, sorteio, numeroLetras, contagem, vidas = 6, acertos, posicao, letra_invalida = 0, n_invalido = 0, cont = -1, erros = 0
	cadeia  palavraSorteada, palavra[6] = {"abajur", "camisa", "livro", "cadeira", "caderno", "abacaxi"}
	caracter letra, formacao[20], palavraSeparada[20], invalidos[20], letraErros[20], elemento, resposta = 's'
	logico acertou = falso, letraRepetida = falso
		
	enquanto(resposta != 'n'){
	 vidas = 6
	 letra_invalida = 0
	 n_invalido = 0
	 cont = -1
	 erros = 0

	 escreva("                                       JOGO DA FORCA                                       ")
	 escreva("\n Regras:")
	 escreva("\n Só é permitido inserir letras minúsculas, sendo descontado 1 vida caso contrário;")
	 escreva("\n Não é permitido o uso de caracteres especiais no jogo, sendo descontado 1 vida caso seja utilizado.")
			
			
	 sorteio = u.sorteia(0, 5)
		
	  //verifica a posiçao da palavra no vetor e o numero de letras
	  palavraSorteada = palavra[sorteio]
	  numeroLetras = txt.numero_caracteres(palavraSorteada)
	
	 //Para iniciar o número de acertos com o mesmo número de letras, para depois tirar da palavra de 1 em 1 quando o usuário acertar 
	  acertos = numeroLetras
		
	 //verifica a posição da palavra sorteada no vetor e de letras na palavra para desenhar os traços
	 para(posicao = 0; posicao< numeroLetras; posicao++){
	 palavraSeparada[posicao] = txt.obter_caracter(palavraSorteada, posicao)
	 formacao[posicao] = '_'
	}
	
   //Letras repetidas dentro da palavra sorteada
	para(i = 0; i < numeroLetras; i++){
	elemento = palavraSeparada[i]
	contagem = 0
	para(r = 0; r < numeroLetras; r++){
	se(palavraSeparada[r] == elemento){
	contagem++
				}
			}
	se(contagem > 1){
	acertos = (numeroLetras + 1) - contagem 
		}
	  }
			
	enquanto(vidas > 0 e acertos > 0) {
				
    //desenhando a forca
	escolha(vidas){
		
    caso 6:
	escreva("\n______")
	escreva("\n│   ")
	para(i = 0; i <= 4; i++){
	escreva("\n│      ")
	  }
	escreva("\n\nVidas: ", vidas, " [++++++]\n")
	pare
		
	caso 5:
	escreva("\n______")
	escreva("\n│    │")
	escreva("\n│    O")
	para(i = 0; i <= 3; i++){
	escreva("\n│    ")
	}
	escreva("\n\nVidas: ", vidas," [+++++]\n")
	pare
		
	caso 4: 
	escreva("\n______")
	escreva("\n│    │")
	escreva("\n│    O  ")
	escreva("\n│    │  ")
	para(i = 0; i <= 2; i++){
	escreva("\n│     ")
	  }
	escreva("\n\nVidas:", vidas, "[++++]\n")
	pare
		
	caso 3: 
	escreva("\n______")
	escreva("\n│    │")
	escreva("\n│    O  ")
     escreva("\n│   /│  ")
	para(i = 0; i <= 2; i++){
	escreva("\n│      ")
	}
	escreva("\n\nVidas: ", vidas, " [+++]\n")
	pare
		
  caso 2: 
	escreva("\n______")
	escreva("\n│    │")
	escreva("\n│    O  ")
	escreva("\n│   /│\\ ")
	para(i = 0; i <= 2; i++){
	escreva("\n│      ")
	}
	escreva("\n\nVidas: ", vidas, "[++]\n")
	pare
		
 	caso 1: 
	 escreva("\n______")
	 escreva("\n│    │")
	 escreva("\n│    O    ")
	 escreva("\n│   /│\\  ")
	 escreva("\n│   /     ")
	 para(i = 0; i <= 2; i++){
	 escreva("\n│      ")
	  }
	 escreva("\n\nVidas: ", vidas, " [+]\n")
	pare
	}
	//traços
	para(posicao = 0; posicao < numeroLetras; posicao++){
	escreva(formacao[posicao], " ")
				}
				
	escreva("\nDigite uma letra: ")
	leia(letra)
			
	//validação para aceitar apenas letras minúsculas
	se(letra >= 'a' e letra <= 'z') {
	}senao se(letra >= 'A' e letra <= 'Z'){
      letra_invalida++
	escreva("\n ERRO! Você digitou uma letra maiúscula! Insira APENAS letras minúsculas!\n")
					
	 }senao{
	n_invalido++
	escreva("\n ERRO! Você digitou número ou caracter especial! Insira APENAS letras minúsculas!\n")
	 }
				
	//Verificar se a letra digitada é igual a da palavra ou se o usuário digitou uma letra repetida
	acertou = falso
     letraRepetida = falso
    para(posicao = 0; posicao < numeroLetras; posicao++)
			{
	se(letra == palavraSeparada[posicao])
		{
	se(formacao[posicao] == letra)
		{
    letraRepetida = verdadeiro
	 }
   senao se(letra != formacao[posicao])

	{ acertou = verdadeiro
	formacao[posicao] = letra
			}
		}
	}
	
  //Imprimindo se a letra está correta, errada ou repetida
    se(letraRepetida == verdadeiro){
   escreva("\n ATENÇÃO! Você repetiu uma letra!")
   }senao se(acertou == verdadeiro){
   escreva("Acertou\n")
   acertos--
   }senao{
   escreva("incorreto\n")
   erros++
   vidas--
   cont++
   letraErros[cont] = letra
	}
	
   se(erros > 0){

   //Imprimindo tudo que o usuário digitou errado
  escreva("\nErros: ")
  para(inteiro indice = 0; indice < cont + 1; indice++){
  escreva(letraErros[indice], " ")
		}
	}
				
  //Imprimindo as letras quando ganhar 
  se(acertos == 0){
  escreva("\n\nPalavra completa: " )
  para(posicao = 0; posicao < numeroLetras; posicao++){
  escreva( formacao[posicao], " ")
			}
  escreva("\n\nPARABÉNS!!! Você venceu! ")
	}
		}
  se(vidas == 0){
  escreva("\n")
  escreva("\n_________")
  escreva("\n│       │")
  escreva("\n│       O    ")
  escreva("\n│      /│\\  ")
  escreva("\n│      / \\    ")
  para(i = 0; i <= 2; i++){
  escreva("\n│     ")
	}
  escreva("\n   Você perdeu! ")
	
	
 //Quantidade dos números ou caracteres especiais caso sejam digitados
  se(n_invalido != 0) {
  escreva("\nDigitou ", n_invalido, " valor(es) inválido(s) como números ou caracteres especiais (ex. + - * / & , . % ] )")
	 	}
  //Quantidade de letras maiúsculas caso digite letras maisúsculas
  se(letra_invalida != 0) {
  escreva("\nDigitou ", letra_invalida, " letra(s) maiúscula(s).")
		}
  //Quantidade de letras corretas digitadas
  se(acertos < numeroLetras){
 escreva("\nInseriu ", numeroLetras - acertos, " letra(s) certa(s).")
 } senao {		    
 escreva("\nNão acertou nenhuma letra!")
  }
 
 }
 escreva("\nDeseja continuar jogando? [s/n]")
 leia(resposta)
 limpa()
    }
  }		
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 5; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
