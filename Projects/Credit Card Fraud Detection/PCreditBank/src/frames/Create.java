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
import java.sql.Statement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class Create extends JFrame implements ActionListener, WindowListener, KeyListener, ItemListener {

    Connection con;
    Statement stmt;
    ResultSet res, res1;
    MyFrame ref;
    JLabel l, l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, l11, l12, l13, l14;
    JButton b1, b2, b3;
    JTextField t1, t2, t3, t4, t5, t6, t10, t13, t14;
    Choice t7, t8, t9, t11, t12, t19, t20;
    static int cnt, card;

    public Create(String s, MyFrame Myf) {
        super(s);
        ref = Myf;
        String s1[] = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
        JPanel p = new JPanel();
        Font f = new Font(Font.SERIF, Font.BOLD, 28);
        Font f1 = new Font(Font.SERIF, Font.BOLD, 18);
        l = new JLabel("Create Account");
        l1 = new JLabel("Account No");
        l2 = new JLabel("Date");
        l3 = new JLabel("Name");
        l4 = new JLabel("Email");
        l5 = new JLabel("Mobile No");
        l6 = new JLabel("Occupation");
        l7 = new JLabel("Maritial");
        l8 = new JLabel("Gender");
        l9 = new JLabel("Date of Birth");
        l10 = new JLabel("Nationality");
        l11 = new JLabel("Citizen");
        l12 = new JLabel("Account Type");
        l13 = new JLabel("Mini Balance");
        l14 = new JLabel("Balance");

        t1 = new JTextField(15);
        t2 = new JTextField(15);
        t3 = new JTextField(15);
        t4 = new JTextField(15);
        t5 = new JTextField(15);
        t6 = new JTextField(15);
        t7 = new Choice();
        t7.add("Single");
        t7.add("Married");
        t7.add("Divorced");
        t8 = new Choice();
        t8.add("Male");
        t8.add("Female");
        t9 = new Choice();
        for (int i = 1; i < 32; i++) {
            t9.add(i + "");
        }
        t10 = new JTextField(15);
        t11 = new Choice();
        t11.add("Senior");
        t11.add("Major");
        t11.add("Minor");
        t12 = new Choice();
        t12.add("Saving");
        t12.add("Current");
        t12.add("Joint");
        t13 = new JTextField(15);
        t13.setText("500");
        t14 = new JTextField(15);
        t19 = new Choice();
        for (int i = 0; i < 12; i++) {
            t19.add(s1[i]);
        }
        t20 = new Choice();
        for (int i = 1980; i < 2003; i++) {
            t20.add(i + "");
        }

        b1 = new JButton("Insert");
        b2 = new JButton("Save");
        b3 = new JButton("Back");

        setSize(1100, 700);
        setLocation(100, 20);
        setResizable(false);
        setLayout(new FlowLayout(FlowLayout.CENTER, getWidth(), 40));
        l.setForeground(Color.RED);
        l.setFont(f);
        l1.setFont(f1);
        l2.setFont(f1);
        l3.setFont(f1);
        l4.setFont(f1);
        l5.setFont(f1);
        l6.setFont(f1);
        l7.setFont(f1);
        l8.setFont(f1);
        l9.setFont(f1);
        l10.setFont(f1);
        l11.setFont(f1);
        l12.setFont(f1);
        l13.setFont(f1);
        l14.setFont(f1);
        t1.setBackground(Color.WHITE);
        t2.setBackground(Color.WHITE);
        t3.setBackground(Color.WHITE);
        t4.setBackground(Color.WHITE);
        t5.setBackground(Color.WHITE);
        t6.setBackground(Color.WHITE);
        t10.setBackground(Color.WHITE);
        t13.setBackground(Color.WHITE);
        t14.setBackground(Color.WHITE);
        b1.setFont(f1);
        b2.setFont(f1);
        b3.setFont(f1);
        p.setBackground(getBackground());
        p.setLayout(new FlowLayout(FlowLayout.CENTER, getWidth(), 10));
        p.add(l);
        add(p);
        p = new JPanel();
        p.setLayout(new GridLayout(1, 4, 5, 5));
        p.setBackground(getBackground());
        p.add(l1);
        p.add(t1);
        p.add(l2);
        p.add(t2);
        add(p);
        p = new JPanel();
        p.setLayout(new GridLayout(1, 6, 5, 5));
        p.setBackground(getBackground());
        p.add(l3);
        p.add(t3);
        p.add(l4);
        p.add(t4);
        p.add(l5);
        p.add(t5);
        add(p);
        p = new JPanel();
        p.setLayout(new GridLayout(1, 6, 5, 5));
        p.setBackground(getBackground());
        p.add(l6);
        p.add(t6);
        p.add(l7);
        p.add(t7);
        p.add(l8);
        p.add(t8);
        add(p);
        JPanel p1 = new JPanel();
        p1.setLayout(new GridLayout(1, 3));
        p1.setBackground(getBackground());
        p1.add(t9);
        p1.add(t19);
        p1.add(t20);
        p = new JPanel();
        p.setLayout(new GridLayout(1, 6, 5, 5));
        p.setBackground(getBackground());
        p.add(l9);
        p.add(p1);
        p.add(l10);
        p.add(t10);
        p.add(l11);
        p.add(t11);
        add(p);
        p = new JPanel();
        p.setLayout(new GridLayout(1, 6, 5, 5));
        p.setBackground(getBackground());
        p.add(l12);
        p.add(t12);
        p.add(l13);
        p.add(t13);
        p.add(l14);
        p.add(t14);
        add(p);
        p = new JPanel();
        p.setLayout(new GridLayout(1, 3, 50, 10));
        p.setBackground(getBackground());
        p.add(b1);
        p.add(b2);
        p.add(b3);
        add(p);
        addWindowListener(this);
        t3.addKeyListener(this);
        t4.addKeyListener(this);
        t5.addKeyListener(this);
        t6.addKeyListener(this);
        t10.addKeyListener(this);
        t12.addItemListener(this);
        t14.addKeyListener(this);
        b1.addActionListener(this);
        b2.addActionListener(this);
        b3.addActionListener(this);
        b2.setEnabled(false);
        disableall();
        t13.setEditable(false);
        cnt = 100;
        res = res1 = null;
        stmt = null;
    }

    public void insert() {
        con = DriverManag.getConnection();
        try {
            clear();
            stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            res1 = stmt.executeQuery("select * from seq");
            if (res1.next()) {
                cnt = res1.getInt(1);
                card = res1.getInt(2);
                cnt = cnt + 1;
                card=card + 1;
            }
        } catch (SQLException e) {
            //TODO Auto-generated catch block
            e.printStackTrace();
            cnt = 100;
        }
        Calendar currentDate = Calendar.getInstance();
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        String s = formatter.format(currentDate.getTime());
        t1.setText("00605010102" + cnt);
        t2.setText(s);
    }

    public void save() {
        try {
            int flag=check();
            if(flag==1){
            con = DriverManag.getConnection();
            String s = t3.getText();
            String s1[] = s.split(" ");
            s=null;
            s = s1[0].substring(0, 1);
            s = s + s1[1].substring(0, 1);
            s = s+t12.getSelectedItem().substring(0, 1);
            stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String querry="insert into cust_det values('"+s+cnt+"','"+t3.getText()+"','"+t9.getSelectedItem()+"-"+t19.getSelectedItem()+"-"+t20.getSelectedItem()+"',";
            querry = querry + "'"+t5.getText()+"','"+t4.getText()+"','"+t1.getText()+"','"+t12.getSelectedItem()+"')";
            stmt.executeQuery(querry);
            stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            stmt.executeQuery("delete from seq");
            stmt.executeQuery("commit");
            res1 = stmt.executeQuery("insert into seq values("+cnt+","+card+")");
            stmt.executeQuery("commit");
            JOptionPane.showMessageDialog(this, "Account Created", "Inserting", 1);
            }
            else
                JOptionPane.showMessageDialog(this, "One of the Information is Blank", "Inserting", 0);
        } catch (SQLException e) {
            //TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public void clear() {
        t1.setText("");
        t2.setText("");
        t3.setText("");
        t4.setText("");
        t5.setText("");
        t6.setText("");
        t7.select(0);
        t8.select(0);
        t9.select(0);
        t10.setText("");
        t11.select(0);
        t12.select(0);
        t13.setText("");
        t14.setText("");
        t19.select(0);
        t20.select(0);
    }

    public void enableall() {
        t3.setEditable(true);
        t4.setEditable(true);
        t5.setEditable(true);
        t6.setEditable(true);
        t7.setEnabled(true);
        t8.setEnabled(true);
        t9.setEnabled(true);
        t10.setEditable(true);
        t11.setEnabled(true);
        t12.setEnabled(true);
        t14.setEditable(true);
        t19.setEnabled(true);
        t20.setEnabled(true);
    }

    public void disableall() {
        t1.setEditable(false);
        t2.setEditable(false);
        t3.setEditable(false);
        t4.setEditable(false);
        t5.setEditable(false);
        t6.setEditable(false);
        t7.setEnabled(false);
        t8.setEnabled(false);
        t9.setEnabled(false);
        t10.setEditable(false);
        t11.setEnabled(false);
        t12.setEnabled(false);
        t14.setEditable(false);
        t19.setEnabled(false);
        t20.setEnabled(false);
    }

    @Override
    public void windowActivated(WindowEvent e) {
        // TODO Auto-generated method stub
    }

    @Override
    public void windowClosed(WindowEvent e) {
        // TODO Auto-generated method stub
        try {
            if (res != null && res.isClosed() == true) {
                res.close();
            }
            if (res1 != null && res1.isClosed() == true) {
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
    }

    @Override
    public void windowClosing(WindowEvent e) {
        // TODO Auto-generated method stub
        try {
            if (res != null && res.isClosed() == true) {
                res.close();
            }
            if (res1 != null && res1.isClosed() == true) {
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
            enableall();
            clear();
            b2.setEnabled(true);
            insert();
            b1.setEnabled(false);
        } else if (e.getSource() == b2) {
            save();
            b2.setEnabled(false);
            b1.setEnabled(true);
            disableall();
        } else if (e.getSource() == b3) {
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
    }

    @Override
    public void keyPressed(KeyEvent e) {
        // TODO Auto-generated method stub
        if (e.getSource() == t3) {
            if ((e.getKeyChar() >= 'A' && e.getKeyChar() <= 'Z') || (e.getKeyChar() >= 'a' && e.getKeyChar() <= 'z') || e.getKeyCode() == 8 || e.getKeyCode() == ' ') {
                t3.setEditable(true);
            } else {
                t3.setEditable(false);
            }
        } else if (e.getSource() == t6) {
            if ((e.getKeyChar() >= 'A' && e.getKeyChar() <= 'Z') || (e.getKeyChar() >= 'a' && e.getKeyChar() <= 'z') || e.getKeyCode() == 8) {
                t6.setEditable(true);
            } else {
                t6.setEditable(false);
            }
        } else if (e.getSource() == t10) {
            if ((e.getKeyChar() >= 'A' && e.getKeyChar() <= 'Z') || (e.getKeyChar() >= 'a' && e.getKeyChar() <= 'z') || e.getKeyCode() == 8) {
                t10.setEditable(true);
            } else {
                t10.setEditable(false);
            }
        } else if (e.getSource() == t5) {
            String s = t5.getText();
            if (s.length() < 10 || e.getKeyCode() == 8) {
                if ((e.getKeyChar() >= '0' && e.getKeyChar() <= '9') || e.getKeyCode() == 8) {
                    t5.setEditable(true);
                } else {
                    t5.setEditable(false);
                }
            } else {
                t5.setEditable(false);
            }
        } else if (e.getSource() == t14) {
            String s = t14.getText();
            if (s.length() < 6 || e.getKeyCode() == 8) {
                if ((e.getKeyChar() >= '0' && e.getKeyChar() <= '9') || e.getKeyCode() == 8) {
                    t14.setEditable(true);
                } else {
                    t14.setEditable(false);
                }
            } else {
                t14.setEditable(false);
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

    @Override
    public void itemStateChanged(ItemEvent e) {
        // TODO Auto-generated method stub
        if (e.getSource() == t12) {
            if (t12.getSelectedIndex() == 0) {
                t13.setText("500");
            } else if (t12.getSelectedIndex() == 1) {
                t13.setText("5000");
            } else if (t12.getSelectedIndex() == 2) {
                t13.setText("1000");
            }
        }
    }

    private int check() {
        if(t1.getText().equals("")){
            return 0;
        }
        else if(t1.getText().equals("")){
            return 0;
        }
        else if(t2.getText().equals("")){
            return 0;
        }
        else if(t3.getText().equals("")){
            return 0;
        }
        else if(t4.getText().equals("")){
            return 0;
        }
        else if(t5.getText().equals("")){
            return 0;
        }
        else if(t6.getText().equals("")){
            return 0;
        }
        else if(t10.getText().equals("")){
            return 0;
        }
        else if(t13.getText().equals("")){
            return 0;
        }
        else if(t14.getText().equals("")){
            return 0;
        }
        return 1;
        
    }
}
