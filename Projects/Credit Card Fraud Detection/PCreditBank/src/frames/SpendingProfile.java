package frames;

import driver.DriverManag;
import java.awt.Color;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JInternalFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

public class SpendingProfile extends JFrame implements ActionListener, WindowListener {

    Connection con;
    Statement stmt, stmt1;
    ResultSet res, res1;
    MyFrame ref;
    JLabel l;
    JButton b1, b2, b3, b4;
    JTable tab;
    JInternalFrame fra, fra1, fra2;

    public SpendingProfile(String s, MyFrame Myf) {
        super(s);
        ref = Myf;
        JPanel p = new JPanel();
        Font f = new Font(Font.SERIF, Font.BOLD, 28);
        Font f1 = new Font(Font.SERIF, Font.BOLD, 18);
        l = new JLabel("Spending Profile");
        b1 = new JButton("High Profile");
        b2 = new JButton("Mid Profile");
        b3 = new JButton("Low Profile");
        b4 = new JButton("Back");
        fra = new JInternalFrame("Details");
        fra1 = new JInternalFrame("Details");
        fra2 = new JInternalFrame("Details");
        setSize(700, 500);
        setLocation(300, 100);
        setResizable(false);
        setLayout(new FlowLayout(FlowLayout.CENTER, getWidth(), 40));
        l.setForeground(Color.RED);
        l.setFont(f);
        b1.setFont(f1);
        b2.setFont(f1);
        b3.setFont(f1);
        b4.setFont(f1);
        p.setBackground(getBackground());
        p.setLayout(new FlowLayout(FlowLayout.CENTER, getWidth(), 20));
        p.add(l);
        add(p);
        p = new JPanel();
        p.setLayout(new GridLayout(1, 4, 20, 10));
        p.setBackground(getBackground());
        p.add(b1);
        p.add(b2);
        p.add(b3);
        p.add(b4);
        add(p);
        add(fra);
        add(fra1);
        add(fra2);
        addWindowListener(this);
        b1.addActionListener(this);
        b2.addActionListener(this);
        b3.addActionListener(this);
        b4.addActionListener(this);
    }

    public void calculate(double limit, double max) {
        String s[] = {"Name on Card", "Credit Card Number", "Money Spent"};
        String s1[][] = new String[10][3];
        double sum = 0;
        int i = 0, flag = 0;
        DateFormat dateFormat = new SimpleDateFormat("dd-MMM-YY");
        Calendar cal = Calendar.getInstance();
        try {
            con = DriverManag.getConnection();
            stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            res = stmt.executeQuery("select * from card_det");
            res.first();
            do {
                stmt1 = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
                res1 = stmt1.executeQuery("select * from trans_det where card_pk='" + res.getString(1) + "' and transaction_date between '1-Jan-2010' and '" + dateFormat.format(cal.getTime()) + "'");
                while (res1.next()) {
                    sum = sum + res1.getDouble(5);
                }
                if (sum > limit && sum <= max) {
                    flag = 1;
                    s1[i][0] = res.getString(2);
                    s1[i][1] = res.getString(3);
                    s1[i][2] = sum + "";
                    i++;
                }
                sum = 0;
            } while (res.next());
            if (flag == 1) {
                tab = new JTable(s1, s);
                tab.setAutoscrolls(true);
                tab.setVisible(true);
                tab.setFont(new Font(Font.SERIF, Font.BOLD, 18));
                tab.getColumnModel().getColumn(0).setPreferredWidth(160);
                tab.getColumnModel().getColumn(1).setPreferredWidth(160);
                tab.getColumnModel().getColumn(2).setPreferredWidth(160);
                tab.setSize(600, 400);
                if (limit == 0) {
                    fra.add(tab);
                    fra.setVisible(true);
                    fra1.setVisible(false);
                    fra2.setVisible(false);
                } else if (limit == 2000) {
                    fra1.add(tab);
                    fra1.setVisible(true);
                    fra.setVisible(false);
                    fra2.setVisible(false);
                } else if (limit == 5000) {
                    fra2.add(tab);
                    fra2.setVisible(true);
                    fra.setVisible(false);
                    fra1.setVisible(false);
                }
            } else {
                fra.setVisible(false);
                fra1.setVisible(false);
                fra2.setVisible(false);
            }
        } catch (SQLException e1) {
            // TODO Auto-generated catch block
            JOptionPane.showMessageDialog(this, "Not Found", "Searching", 0);
            e1.printStackTrace();
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
            calculate(5000, 25000);
        } else if (e.getSource() == b2) {
            calculate(2000, 5000);
        } else if (e.getSource() == b3) {
            calculate(0, 2000);
        } else if (e.getSource() == b4) {
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
}
