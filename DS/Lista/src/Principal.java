import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class Principal extends JFrame {
    JLabel rotulo1,rotulo2, rotulo3,exibir;
    JTextField text1,text2, text3;
    JButton listar;
    JTextArea info;
    public Principal() {
        super("Lista de Pessoas");
        Container tela = getContentPane();
        setLayout(null);
        rotulo1 = new JLabel("Nome Completo ");
        rotulo2 = new JLabel("Idade ");
        rotulo3 = new JLabel("Chegada");

        text1 = new JTextField(5);
        text2 = new JTextField(5);
        text3 = new JTextField(5);
        listar = new JButton("Listar");
        exibir = new JLabel("");
        info = new JTextArea("");

        rotulo1.setBounds(10, 10, 150, 20);
        rotulo2.setBounds(10, 60, 100, 20);
        rotulo3.setBounds(10, 110, 100, 20);
        text1.setBounds(15, 30, 200, 20);
        text2.setBounds(15, 80, 200, 20);
        text3.setBounds(15, 130, 200, 20);
        exibir.setBounds(50, 120, 200, 20);
        listar.setBounds(40, 170, 80, 20);
        info.setBounds(250, 10, 300, 150);

        listar.addActionListener((ActionEvent e) -> {
            if ((text1.getText().isEmpty() || text2.getText().isEmpty() || text3.getText().isEmpty())) {
                info.setText("Insira todos os campos!!");
                info.setForeground(Color.red);
            }
            int idade, horario;
            String nome = (text1.getText());
            String pegatudo;
            idade = Integer.parseInt(text2.getText());
            horario = Integer.parseInt(text3.getText());
            listar.setVisible(true);
            pegatudo = ("Nome Completo: " + nome + "\nIdade: " + idade + "\nChegada: " + horario);
            info.setText(pegatudo);
        });


        tela.add(rotulo1);
        tela.add(rotulo2);
        tela.add(rotulo3);

        tela.add(text1);
        tela.add(text2);
        tela.add(text3);

        tela.add(exibir);
        tela.add(listar);
        tela.add(info);

        setSize(600, 250);
        setVisible(true);
        info.setEnabled(false);
    }


    public static void main(String[] args) {
        Principal app = new Principal();
        app.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        app.setLocationRelativeTo(null);
    }
}