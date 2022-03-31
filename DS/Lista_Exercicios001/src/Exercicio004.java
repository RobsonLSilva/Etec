public class Exercicio004 {
    public String  sucessorAntecessor(int num) {
        int numero = num;
        int antecessor = num -1;
        int sucessor = num + 1;

        return "O antecessor de " 
                + numero + " é " 
                + antecessor   
                + "\nO sucessor de " 
                + numero + " é " 
                + sucessor 
                + "\n";
    }
}
