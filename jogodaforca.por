
programa
{
    inclua biblioteca Util --> u
    inclua biblioteca Texto--> tx
    cadeia palavras[3][3]={{"linda","carro", "dados"},{"janela", "agenda","caneca"},{"desenho", "alegria", "vasilha"}} //guarda as palavras do jogo
    inteiro nivel, valor 
    cadeia palavra_selecionada
    caracter letra
    
 
   funcao inicio(){

     escreva("digite o nível- nivel 1 = facil\n")
     escreva("digite o nivel- nivel 2 = medio\n")
     escreva("digite o nivel- nivel 3 = dificil\n")
     
     leia(nivel)
     nivel = nivel -1
     valor = u.sorteia(0, 2)//sorteia a palavra
     palavra_selecionada = palavras[nivel][valor]



	desenhar()
     escreva("adivinhe a palavra oculta" )
     
    
     escreva("\n------ \n")
     escreva("digite uma letra\n")
     leia(letra)
     
     
     }

  funcao desenhar(){
     escreva("--------|\n")
     escreva("|\n")
     escreva("|\n")
     escreva("|\n")
     escreva("|\n")
     escreva("|\n")
     escreva("-\n")
  }


}



     
  
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 309; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {palavras, 6, 11, 8}-{palavra_selecionada, 8, 11, 19};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */