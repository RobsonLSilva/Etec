public class Exercicio002 {

    public int somatoria(int inicio, int termino) {
        int sum = 0;
        for (int i = inicio; i <= termino; i++) {
            sum += (i + Math.pow(i, 2));
        }
        return sum;
    }
    
}
