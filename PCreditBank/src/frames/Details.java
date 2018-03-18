package frames;

import driver.DriverManag;
import java.awt.Choice;
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

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;


public class Details extends JFrame implements ActionListener,WindowListener{
	Connection con;
	Statement stmt;
	ResultSet res;
	MyFrame ref;
	JLabel l,l1,l2,l3,l4,l5,l6,l7,l8,l9,l10,l11,l12,l13,l14;
	JTextField t1,t2,t3,t4,t5,t6,t8,t9,t10,t12,t13,t14;
	JButton b1,b2,b3,b4,b5,b6,b7;
	Choice t7,t11;
	int flag,flag1;
	public Details(String s,MyFrame Myf)
	{
		super(s);
		ref=Myf;
		JPanel p=new JPanel(); 
		Font f=new Font(Font.SERIF, Font.BOLD, 28);
		Font f1=new Font(Font.SERIF, Font.BOLD, 18);
		l=new JLabel("Details of Account");
		l1=new JLabel("Account No");
		l2=new JLabel("Date");
		l3=new JLabel("Name");
		l4=new JLabel("Email");
		l5=new JLabel("Mobile No");
		l6=new JLabel("Occupation");
		l7=new JLabel("Maritial");
		l8=new JLabel("Gender");
		l9=new JLabel("Date of Birth");
		l10=new JLabel("Nationality");
		l11=new JLabel("Citizen");
		l12=new JLabel("Account Type");
		l13=new JLabel("Mini Balance");
		l14=new JLabel("Balance");

		t1=new JTextField(15);
		t2=new JTextField(15);
		t3=new JTextField(15);
		t4=new JTextField(15);
		t5=new JTextField(15);
		t6=new JTextField(15);
		t7=new Choice();
		t7.add("Single");
		t7.add("Married");
		t7.add("Divorced");
		t8=new JTextField(15);
		t9=new JTextField(15);
		t10=new JTextField(15);
		t11=new Choice();
		t11.add("Senior");
		t11.add("Major");
		t11.add("Minor");
		t12=new JTextField(15);
		t13=new JTextField(15);
		t14=new JTextField(15);

		b1=new JButton("Previous");
		b2=new JButton("Next");
		b3=new JButton("Search");
		b4=new JButton("Modify");
		b5=new JButton("Delete");
		b6=new JButton("Save");
		b7=new JButton("Back");
		setSize(1100, 700);
		setLocation(100,20);
		setResizable(false);
		setLayout(new FlowLayout(FlowLayout.CENTER, getWidth(), 50));
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
		b1.setFont(f1);
		b2.setFont(f1);
		b3.setFont(f1);
		b4.setFont(f1);
		b5.setFont(f1);
		b6.setFont(f1);
		b7.setFont(f1);
		p.setBackground(getBackground());
		p.setLayout(new FlowLayout(FlowLayout.CENTER, getWidth(), 20));
		p.add(l);
		add(p);
		p=new JPanel();
		p.setLayout(new GridLayout(1, 4, 5, 5));
		p.setBackground(getBackground());
		p.add(l1);
		p.add(t1);
		p.add(l2);
		p.add(t2);
		add(p);
		p=new JPanel();
		p.setLayout(new GridLayout(1, 6, 5, 5));
		p.setBackground(getBackground());
		p.add(l3);
		p.add(t3);
		p.add(l4);
		p.add(t4);
		p.add(l5);
		p.add(t5);
		add(p);
		p=new JPanel();
		p.setLayout(new GridLayout(1, 6, 5, 5));
		p.setBackground(getBackground());
		p.add(l6);
		p.add(t6);
		p.add(l7);
		p.add(t7);
		p.add(l8);
		p.add(t8);
		add(p);
		p=new JPanel();
		p.setLayout(new GridLayout(1, 6, 5, 5));
		p.setBackground(getBackground());
		p.add(l9);
		p.add(t9);
		p.add(l10);
		p.add(t10);
		p.add(l11);
		p.add(t11);
		add(p);
		p=new JPanel();
		p.setLayout(new GridLayout(1, 6, 5, 5));
		p.setBackground(getBackground());
		p.add(l12);
		p.add(t12);
		p.add(l13);
		p.add(t13);
		p.add(l14);
		p.add(t14);
		add(p);
		p=new JPanel();
		p.setLayout(new GridLayout(1, 7, 30, 10));
		p.setBackground(getBackground());
		p.add(b1);
		p.add(b2);
		p.add(b3);
		p.add(b4);
		p.add(b5);
		p.add(b6);
		p.add(b7);
		add(p);
		addWindowListener(this);
		b1.addActionListener(this);
		b2.addActionListener(this);
		b3.addActionListener(this);
		b4.addActionListener(this);
		b5.addActionListener(this);
		b6.addActionListener(this);
		b7.addActionListener(this);
		b6.setEnabled(false);
		disableall();
		flag1=flag=0;
	}	
	public void next()
	{
		try {
			if(flag==0)
			{
				con = DriverManag.getConnection();
				stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				res=stmt.executeQuery("select * from cust_det");
				res.first();
			}
			if(flag==1)
				res.next();
			if(res.isLast())
				b2.setEnabled(false);
			else
				b2.setEnabled(true);
			t1.setText(res.getString(6));			
			t3.setText(res.getString(2));
			t4.setText(res.getString(5));
			t5.setText(res.getString(4));			
			t9.setText(res.getString(3));
			t12.setText(res.getString(7));
			b1.setEnabled(true);
		} catch (SQLException e) {
			//TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void prev()
	{
		try {
			if(flag==0)
			{
				con = DriverManag.getConnection();
				stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				res=stmt.executeQuery("select * from cust_det");
				res.last();
			}
			if(flag==1)
				res.previous();
			if(res.isFirst())
				b1.setEnabled(false);
			else
				b1.setEnabled(true);
			t1.setText(res.getString(6));			
			t3.setText(res.getString(2));
			t4.setText(res.getString(5));
			t5.setText(res.getString(4));			
			t9.setText(res.getString(3));
			t12.setText(res.getString(7));
			b2.setEnabled(true);
		} catch (SQLException e) {
			//TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void search()
	{
		String s=JOptionPane.showInputDialog(this, "Enter the Account No: ", "Searching", 3);
		try {
			con = DriverManag.getConnection();
			stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			res=stmt.executeQuery("select * from cust_det where account_no='"+s+"'");
			res.first();
			t1.setText(res.getString(6));			
			t3.setText(res.getString(2));
			t4.setText(res.getString(5));
			t5.setText(res.getString(4));			
			t9.setText(res.getString(3));
			t12.setText(res.getString(7));
		} catch (SQLException e) {
			//TODO Auto-generated catch block
			JOptionPane.showMessageDialog(this, "Not Found", "Searching",0);
		}
	}
	public void modify()
	{
		t5.setEditable(true);
		t6.setEditable(true);
		t7.setEnabled(true);
		t10.setEditable(true);
		t11.setEnabled(true);
	}
	public void delete()
	{
		try {
			con = DriverManag.getConnection();
                                                                stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                                                res = stmt.executeQuery("select cust_pk from cust_det where account_no='"+(t1.getText())+"'");
                                                                res.first();
                                                                String s = res.getString(1);
                                                                res = stmt.executeQuery("select card_pk from card_det where account_no='"+(t1.getText())+"'");
                                                                res.first();
                                                                String s1 = res.getString(1);
			stmt.executeUpdate("delete from cust_det where account_no='"+(t1.getText())+"'");
			stmt.executeUpdate("delete from card_det where account_no='"+(t1.getText())+"'");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JOptionPane.showMessageDialog(this, "Deleted", "Deleting",1);
	}
	public void save()
	{
		try {
			con = DriverManag.getConnection();
			stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			res=stmt.executeQuery("select * from cust_det where account_no='"+(t1.getText())+"'");
			res.first();
			res.updateString(4, t5.getText());
                                                                res.updateString(5, t4.getText());
			res.updateRow();
		} catch (SQLException e) {
			//TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void disableall()
	{
		t1.setBackground(Color.WHITE);
		t2.setBackground(Color.WHITE);
		t3.setBackground(Color.WHITE);
		t4.setBackground(Color.WHITE);
		t5.setBackground(Color.WHITE);
		t6.setBackground(Color.WHITE);
		t7.setBackground(Color.WHITE);
		t8.setBackground(Color.WHITE);
		t9.setBackground(Color.WHITE);
		t10.setBackground(Color.WHITE);
		t11.setBackground(Color.WHITE);
		t12.setBackground(Color.WHITE);
		t13.setBackground(Color.WHITE);
		t14.setBackground(Color.WHITE);
		t1.setEditable(false);
		t2.setEditable(false);
		t3.setEditable(false);
		t4.setEditable(false);
		t5.setEditable(false);
		t6.setEditable(false);
		t7.setEnabled(false);
		t8.setEditable(false);
		t9.setEditable(false);
		t10.setEditable(false);
		t11.setEnabled(false);
		t12.setEditable(false);
		t13.setEditable(false);
		t14.setEditable(false);
	}
	@Override
	public void windowActivated(WindowEvent e) {
		// TODO Auto-generated method stub
		flag=0;
	}
	@Override
	public void windowClosed(WindowEvent e) {
		// TODO Auto-generated method stub

	}
	@Override
	public void windowClosing(WindowEvent e) {
		// TODO Auto-generated method stub
		try {
			if(res!=null && res.isClosed()==true)
				res.close();
			if(stmt!=null)
				stmt.close();
			if(con!=null)
				con.close();
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
		if(e.getSource()==b1)
		{
			prev();
			flag=1;
		}
		else if(e.getSource()==b2)
		{
			next();
			flag=1;
		}
		else if(e.getSource()==b3)
		{
			flag=0;
			search();
		}
		else if(e.getSource()==b4)
		{
			flag=0;
			modify();
			b6.setEnabled(true);
		}
		else if(e.getSource()==b5)
		{
			flag=0;
			delete();
		}
		else if(e.getSource()==b6)
		{
			flag=0;
			save();
			b6.setEnabled(false);
                                                                t4.setEditable(true);
			t5.setEditable(false);
			t6.setEditable(false);
			t7.setEnabled(false);
			t10.setEditable(false);
			t11.setEnabled(false);
		}
		else if(e.getSource()==b7)
		{
			flag=0;
			setVisible(false);
			ref.setVisible(true);
		}
	}
}
