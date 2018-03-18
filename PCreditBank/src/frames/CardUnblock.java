package frames;

import driver.DriverManag;
import java.awt.Color;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class CardUnblock extends JFrame implements ActionListener, WindowListener, KeyListener {

    Connection con;
    Statement stmt;
    ResultSet res;
    MyFrame ref;
    JLabel l, l1, l2;
    JTextField t1, t2;
    JButton b1, b2;

    public CardUnblock(String s, MyFrame Myf) {
        super(s);
        ref = Myf;
        JPanel p = new JPanel();
        Font f = new Font(Font.SERIF, Font.BOLD, 28);
        Font f1 = new Font(Font.SERIF, Font.BOLD, 18);
        l = new JLabel("Card Unblock");
        l1 = new JLabel("Card Number");
        l2 = new JLabel("Code");
        t1 = new JTextField(16);
        t2 = new JTextField(16);
        b1 = new JButton("Unlock");
        b2 = new JButton("Back");
        setSize(700, 500);
        setLocation(300, 100);
        setResizable(false);
        setLayout(new FlowLayout(FlowLayout.CENTER, getWidth(), 40));
        l.setForeground(Color.RED);
        l.setFont(f);
        l1.setFont(f1);
        l2.setFont(f1);
        b1.setFont(f1);
        b2.setFont(f1);
        p.setBackground(getBackground());
        p.setLayout(new FlowLayout(FlowLayout.CENTER, getWidth(), 20));
        p.add(l);
        add(p);
        p = new JPanel();
        p.setLayout(new GridLayout(1, 2, 20, 10));
        p.setBackground(getBackground());
        p.add(l1);
        p.add(t1);
        add(p);
        p = new JPanel();
        p.setLayout(new GridLayout(1, 2, 20, 10));
        p.setBackground(getBackground());
        p.add(l2);
        p.add(t2);
        add(p);
        p = new JPanel();
        p.setLayout(new GridLayout(1, 2, 20, 10));
        p.setBackground(getBackground());
        p.add(b1);
        p.add(b2);
        add(p);
        addWindowListener(this);
        b1.addActionListener(this);
        b2.addActionListener(this);
        t1.addKeyListener(this);
    }

    public void check() {
        try {
            int i = 0;
            con = DriverManag.getConnection();
            stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            res = stmt.executeQuery("select * from card_det where cust_card_no ='" + t1.getText() + "' and cust_pk='" + t2.getText() + "'");
            while (res.next()) {
                i++;
            }
            if (i > 0) {
                stmt.executeQuery("update card_det set status='u' where cust_card_no ='" + t1.getText() + "'");
                stmt.executeQuery("commit");
                JOptionPane.showMessageDialog(this, "Card Unblocked", "Unblock", 1);
                setVisible(false);
                ref.setVisible(true);
            } else {
                JOptionPane.showMessageDialog(this, "Wrong Code", "Unblock", 0);
            }
        } catch (SQLException e1) {
            // TODO Auto-generated catch block
            JOptionPane.showMessageDialog(this, "Not Found", "Unblock", 0);
            t1.setText("");
            t2.setText("");
        }
    }

    @Override
    public void windowActivated(WindowEvent e) {
        // TODO Auto-generated method stub
    }

    @Override
    public void windowClosed(WindowEvent e) {
        // TODO Auto-generated method stub
    }

    @Override
    public void windowClosing(WindowEvent e) {
        // TODO Auto-generated method stub
        try {
            if (res != null && res.isClosed() == true) {
                res.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
        setVisible(false);
        ref.setVisible(true);
    }

    @Override
    public void windowDeactivated(WindowEvent e) {
        // TODO Auto-generated method stub
    }

    @Override
    public void windowDeiconified(WindowEvent e) {
        // TODO Auto-generated method stub
    }

    @Override
    public void windowIconified(WindowEvent e) {
        // TODO Auto-generated method stub
    }

    @Override
    public void windowOpened(WindowEvent e) {
        // TODO Auto-generated method stub
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        // TODO Auto-generated method stub
        if (e.getSource() == b1) {
            check();
        } else if (e.getSource() == b2) {
            try {
                if (res != null) {
                    res.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e1) {
                // TODO Auto-generated catch block
                e1.printStackTrace();
            }
            setVisible(false);
            ref.setVisible(true);
        }
    }

    @Override
    public void keyPressed(KeyEvent e) {
        // TODO Auto-generated method stub
        if (e.getSource() == t1) {
            String s = t1.getText();
            if (s.length() < 17 || e.getKeyCode() == 8) {
                if ((e.getKeyChar() >= '0' && e.getKeyChar() <= '9') || e.getKeyCode() == 8) {
                    t1.setEditable(true);
                } else {
                    t1.setEditable(false);
                }
            } else {
                t1.setEditable(false);
            }
        }
    }

    @Override
    public void keyReleased(KeyEvent e) {
        // TODO Auto-generated method stub
    }

    @Override
    public void keyTyped(KeyEvent e) {
        // TODO Auto-generated method stub
    }
}
