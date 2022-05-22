<?php

function criptografarSenha($chave, $senha){

    $letras = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,0,1,2,3,4,5,6,7,8,9,*,@,$,#,!,+,="; //adicionei uma série de caracteres que servem parâmetro para usar a criptografia
    $array = explode(",", $letras); //explode transforma a variável $letras em vetor adicionando os campos dele a cada vírgula da variável $letras que é do tipo String
    shuffle($array); //embaralha os campos do array
    $aux3 = implode($array); //implode transforma de array para String

    $textoCifrado = []; //Variavel que guarda o texto cifrado 
    $tamanhoTexto = strlen($senha); //Variavel com tamanho do texto a ser cifrado 
    
    //Criptografa um caracter de cada vez
    for($i=0; $i < $tamanhoTexto; $i++){     
       $letraCifradaASCII[$i] = ord($senha[$i]) + $chave; //Transforma o caracter em codigo ASCII e faz a criptografia
            
       while($letraCifradaASCII[$i] > 126) //Verifica se o codigo ASCII esta no limite maximo dos caracteres que podem ser impressos
          $letraCifradaASCII[$i] -= 94;
  
        while($letraCifradaASCII[$i] < 32) //Verifica se o codigo ASCII esta no limite inferior dos caracteres que podem ser impressos
          $letraCifradaASCII[$i] += 94;
   
       $textoCifrado[$i] = chr($letraCifradaASCII[$i]); //Transforma codigo ASCII cifrado em caracter no novo texto
    }
    $aux = implode($textoCifrado);//implode transforma de array para String
    $arr2 = str_split(substr($aux3, 0, strlen($senha)*8), 24); //Divide a string de 48 caracteres gerada aleatoriamente em duas partes.
    
    return $arr2[0] . substr($aux, 0, $tamanhoTexto) . $arr2[1]; //Retorna a mensagem completa criptografada concatenando as 3 partes para dificultar a quebra.
 }