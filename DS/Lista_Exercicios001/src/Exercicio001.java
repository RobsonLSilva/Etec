public class Exercicio001 {
    
    public void tabuada(int inicio, int termino){
        for (int i = inicio; i <= termino; i++) {
            for (int j = inicio; j <= termino; j++) {
                System.out.println(i + " x " + j + " = " + i * j);
            }
            System.out.println("\n");
        }
    }
}
