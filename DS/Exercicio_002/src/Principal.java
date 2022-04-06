public class Principal {
    public static void main(String[] args) {
        Bicicleta bike1 = new Bicicleta(2, 4);
        Bicicleta bike2 = new Bicicleta(1, 8);

        if ((bike1.getVelocidade() >= 3) && (bike1.getMarcha() < 2)) {
            bike1.aumentarVelocidade(1);
        } else {
            bike1.aplicarFreios();
        }

        while (bike2.getVelocidade() > 3) {
            if ((bike2.getVelocidade() >= 3) && (bike2.getMarcha() < 2)) {
                bike2.diminuirVelocidade(1);
            } else {
                bike1.aplicarFreios();
            }
        }

        System.out.println("Bike 01:\nMarcha: " + bike1.getMarcha() + "\n" + "Velocidade: " + bike1.getVelocidade());
        System.out.println("Bike 02:\nMarcha: " + bike2.getMarcha() + "\n" + "Velocidade: " + bike2.getVelocidade());

    }
}
