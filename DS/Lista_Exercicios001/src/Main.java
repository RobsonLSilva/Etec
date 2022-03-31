import java.util.Scanner;

public class Main {
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);

        Exercicio001 ex01 = new Exercicio001();
        Exercicio002 ex02 = new Exercicio002();
        Exercicio001 ex03 = new Exercicio001();
        Exercicio004 ex04 = new Exercicio004();

        // ex01.tabuada(1, 10);
        // System.out.println(ex02.somatoria(2, 5));
        // ex03.tabuada(1, 10);
        System.out.println("Digite um numero: ");
        System.out.println(ex04.sucessorAntecessor(sc.nextInt()));
        sc.close();
    }
}
