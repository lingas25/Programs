package frames;

import driver.DriverManag;
import java.awt.Choice;
import java.awt.Color;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class CreditCard extends JFrame implements ActionListener, WindowListener, KeyListener, ItemListener {

    Connection con;
    Statement stmt;
    ResultSet res, res1;
    MyFrame ref;
    JLabel l, l1, l2, l3, l4, l5, l6, l7;
    JTextField t1, t2, t3, t4, t6, t7;
    Choice t5;
    JButton b1, b2;
    String s,cust_pk;

    public CreditCard(String s, MyFrame Myf) {
        super(s);
        ref = Myf;
        JPanel p = new JPanel();
        Font f = new Font(Font.SERIF, Font.BOLD, 28);
        Font f1 = new Font(Font.SERIF, Font.BOLD, 18);
        l = new JLabel("Credit Card Activation");
        l1 = new JLabel("Name on Card");
        l2 = new JLabel("Credit Card No");
        l3 = new JLabel("Expiry Date");
        l4 = new JLabel("CVV Number");
        l5 = new JLabel("Card Type");
        l6 = new JLabel("Trans Password");
        l7 = new JLabel("Card Limit");
        t1 = new JTextField(16);
        t2 = new JTextField(16);
        t3 = new JTextField(16);
        t4 = new JTextField(16);
        t5 = new Choice();
        t5.add("Silver");
        t5.add("Gold");
        t5.add("Platinum");
        t6 = new JTextField(16);
        t7 = new JTextField(16);
        t7.setEditable(false);
        t7.setBackground(Color.WHITE);
        t2.setEditable(false);
        t2.setBackground(Color.WHITE);
        t3.setText("1-Jun-2018");
        t3.setEditable(false);
        t3.setBackground(Color.WHITE);
        t4.setEditable(false);
        t4.setBackground(Color.WHITE);
        b1 = new JButton("Submit");
        b2 = new JButton("Back");
        setSize(700, 500);
        setLocation(350, 100);
        setResizable(false);
        setLayout(new FlowLayout(FlowLayout.CENTER, getWidth(), 15));
        l.setForeground(Color.RED);
        l.setFont(f);
        l1.setFont(f1);
        l2.setFont(f1);
        l3.setFont(f1);
        l4.setFont(f1);
        l5.setFont(f1);
        l6.setFont(f1);
        l7.setFont(f1);
        t1.setFont(f1);
        t2.setFont(f1);
        t3.setFont(f1);
        t4.setFont(f1);
        t5.setFont(f1);
        t6.setFont(f1);
        t7.setFont(f1);
        b1.setFont(f1);
        b2.setFont(f1);
        p.setBackground(getBackground());
        p.setLayout(new FlowLayout(FlowLayout.CENTER, getWidth(), 20));
        p.add(l);
        add(p);
        p = new JPanel();
        p.setLayout(new GridLayout(7, 2, 50, 10));
        p.setBackground(getBackground());
        p.add(l1);
        p.add(t1);
        p.add(l2);
        p.add(t2);
        p.add(l3);
        p.add(t3);
        p.add(l4);
        p.add(t4);
        p.add(l5);
        p.add(t5);
        p.add(l6);
        p.add(t6);
        p.add(l7);
        p.add(t7);
        add(p);
        p = new JPanel();
        p.setLayout(new GridLayout(1, 2, 50, 10));
        p.setBackground(getBackground());
        p.add(b1);
        p.add(b2);
        add(p);
        addWindowListener(this);
        b1.addActionListener(this);
        b2.addActionListener(this);
        t1.addKeyListener(this);
        t5.addItemListener(this);        
        while (true) {
            s = JOptionPane.showInputDialog(this, "Enter the Account No: ", "Searching", 3);
            con = DriverManag.getConnection();
            try {
                stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
                res = stmt.executeQuery("select cust_pk from cust_det where account_no ='" + s + "'");                    
                if(res.next()) {
                    res.first();
                    cust_pk = res.getString(1);
                    break;
                }                
                if(s==null) {
                    ref.setVisible(true);
                    setVisible(false);
                    break;                    
                }
            } catch (SQLException ex) {
                Logger.getLogger(CreditCard.class.getName()).log(Level.SEVERE, null, ex);
            }
        }        
        if(s!=null) {
            setVisible(true);
            insert();
        }
    }
    
    public void insert()
    {
        try {
            con = DriverManag.getConnection();
            stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            res1 = stmt.executeQuery("select * from seq");
            res1.first();
            t2.setText("535938051901"+res1.getString(2));
            t4.setText(res1.getString(1));
            t6.setText("$V"+res1.getString(2));
        } catch (SQLException ex) {
            Logger.getLogger(CreditCard.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    public void save() {
        try {
            int flag=check();
            if(flag==1) {
            con = DriverManag.getConnection();
            stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,  ResultSet.CONCUR_UPDATABLE);
            String s2 = t1.getText();
            String s1[] = s2.split(" ");
            s2 = s1[0].substring(0, 1);
            s2 = s2 + s1[1].substring(0, 1);
            String querry = "insert into card_det values('"+s2+res1.getString(2)+"','"+t1.getText()+"','"+t2.getText()+"',"; 
            querry = querry +"'"+t3.getText()+"',"+t4.getText() +",'"+t5.getSelectedItem()+"','"+t6.getText()+"','"+t7.getText()+"',";
            querry = querry +"'"+cust_pk+"','u')";
            stmt.executeQuery(querry);
            stmt.executeQuery("commit");
            JOptionPane.showMessageDialog(this, "Card Activated", "Activating", 1);
            setVisible(false);
            ref.setVisible(true);
            }
            else
                JOptionPane.showMessageDialog(this, "One of the Information is Blank", "Activating", 0);
        } catch (SQLException ex) {
            Logger.getLogger(CreditCard.class.getName()).log(Level.SEVERE, null, ex);
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
            if (res != null) {
                res.close();
            }
            if (res1 != null) {
                res1.close();
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
            save();
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
    public void keyTyped(KeyEvent e) {
        // TODO Auto-generated method stub
    }

    @Override
    public void keyPressed(KeyEvent e) {
        // TODO Auto-generated method stub
        if (e.getSource() == t1) {
            if ((e.getKeyChar() >= 'A' && e.getKeyChar() <= 'Z') || (e.getKeyChar() >= 'a' && e.getKeyChar() <= 'z') || e.getKeyCode() == 8 || e.getKeyCode() == ' ') {
                t3.setEditable(true);
            } else {
                t3.setEditable(false);
            }
        }
    }

    @Override
    public void keyReleased(KeyEvent e) {
        // TODO Auto-generated method stub
    }

    @Override
    public void itemStateChanged(ItemEvent e) {
        if (e.getSource() == t5) {
            if (t5.getSelectedIndex() == 0) {
                t7.setText("500");
            } else if (t5.getSelectedIndex() == 1) {
                t7.setText("1000");
            } else if (t5.getSelectedIndex() == 2) {
                t7.setText("2000");
            }
        }
    }

    private int check() {
        if(t1.getText().equals("")){
            return 0;
        }
        return 1;
    }
}
