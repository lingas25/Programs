/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package frames;

import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;
import javax.swing.SwingConstants;

/**
 *
 * @author sony
 */
public class Login extends JFrame implements ActionListener, WindowListener {

    JLabel l1, l2, l3, l4, l5;
    JTextField t1;
    JPasswordField t2;
    JButton b1;

    public Login(String s) {
        super(s);

        setLayout(new FlowLayout(FlowLayout.CENTER, 5, 10));
        setSize(450, 350);
        setLocation(500, 150);

        l4 = new JLabel("ADLV Bank", SwingConstants.CENTER);
        l1 = new JLabel("Admin Login", SwingConstants.CENTER);
        l2 = new JLabel("Username");
        l3 = new JLabel("Password");
        l5 = new JLabel("", SwingConstants.CENTER);
        t1 = new JTextField(10);
        t2 = new JPasswordField(10);
        b1 = new JButton("Login");
        b1.setHorizontalAlignment(SwingConstants.CENTER);

        Font f = new Font(Font.SERIF, Font.BOLD, 32);
        Font f1 = new Font(Font.SERIF, Font.BOLD, 22);
        
        l4.setFont(f);
        l1.setFont(f1);
        l2.setFont(f1);
        l3.setFont(f1);
        l5.setFont(f1);
        t1.setFont(f1);
        t2.setFont(f1);
        b1.setFont(f1);

        JPanel p = new JPanel(new FlowLayout(2, 50, 5));
        p.setAlignmentX(CENTER_ALIGNMENT);
        p.add(l4);
        add(p);

        p = new JPanel(new FlowLayout(2, 50, 5));
        p.setAlignmentX(CENTER_ALIGNMENT);
        p.add(l1);
        add(p);

        p = new JPanel(new GridLayout(2, 2, 5, 10));
        p.setAlignmentX(CENTER_ALIGNMENT);
        p.add(l2);
        p.add(t1);
        p.add(l3);
        p.add(t2);
        add(p);

        p = new JPanel(new FlowLayout(2, 100, 10));
        p.setAlignmentX(CENTER_ALIGNMENT);
        p.add(b1);
        add(p);

        p = new JPanel(new FlowLayout(2, 100, 5));
        p.setAlignmentX(CENTER_ALIGNMENT);
        p.add(l5);
        add(p);

        b1.addActionListener(this);
    }

    public static void main(String args[]) {
        Login l = new Login("ADLV Bank Administrator");
        l.setVisible(true);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if (t1.getText().equals("ADLV") && t2.getText().equals("adlv5777")) {
            l5.setText("Login SuccessFull");
            
            setVisible(false);
            MyFrame f = new MyFrame("ADLV Bank Menu");
            f.setVisible(true);
        } else if(t1.getText().equals("") || t2.getText().equals("")){
            JOptionPane.showMessageDialog(this, "Enter Username or Password", "Login",0);
        } else {
            l5.setText("Login Failed");
        }
    }

    @Override
    public void windowOpened(WindowEvent e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void windowClosing(WindowEvent e) {
        e.getWindow().dispose();
    }

    @Override
    public void windowClosed(WindowEvent e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void windowIconified(WindowEvent e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void windowDeiconified(WindowEvent e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void windowActivated(WindowEvent e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void windowDeactivated(WindowEvent e) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
