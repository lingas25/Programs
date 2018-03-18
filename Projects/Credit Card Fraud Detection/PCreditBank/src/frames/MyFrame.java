package frames;

import java.awt.Color;
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
import javax.swing.JPanel;


public class MyFrame extends JFrame implements ActionListener, WindowListener{
	JButton b1,b2,b3,b4,b5,b6;
	JLabel l;
	Create c;
	Details d;
	CreditCard cc;
	SpendingProfile sp;
	CardUnblock cu;
	public MyFrame(String s) {
		// TODO Auto-generated constructor stub
		super(s);
		Font f=new Font(Font.SERIF, Font.BOLD, 32);
		Font f1=new Font(Font.SERIF, Font.BOLD, 22);
		JPanel p=new JPanel(); 
		l=new JLabel("Bank Account Details");
		l.setForeground(Color.RED);
		b1=new JButton("Create");
		b2=new JButton("Details");
		b3=new JButton("Credit Card");
		b4=new JButton("Spending Profile");
		b5=new JButton("Unblock Card");
		b6=new JButton("Exit");
		b1.setFont(f1);
		b2.setFont(f1);
		b3.setFont(f1);
		b4.setFont(f1);
		b5.setFont(f1);
		b6.setFont(f1);
		b1.setToolTipText("New Account");
		b2.setToolTipText("Information");
		b3.setToolTipText("New Credit Card");
		b4.setToolTipText("Profile Details");
		b5.setToolTipText("Card");
		b6.setToolTipText("Close");
		setSize(800, 400);
		setLocation(300, 150);
		setResizable(false);
		setLayout(new FlowLayout(FlowLayout.CENTER, getWidth(), 40));
		l.setFont(f);
		p.setBackground(getBackground());
		p.setLayout(new FlowLayout(FlowLayout.CENTER, getWidth(), 20));
		p.add(l);
		add(p);
		p=new JPanel();
		p.setLayout(new GridLayout(1, 3, 50, 10));
		p.setBackground(getBackground());
		p.add(b1);
		p.add(b2);
		p.add(b3);
		add(p);
		p=new JPanel();
		p.setLayout(new GridLayout(1, 3, 60, 10));
		p.setBackground(getBackground());
		p.add(b4);
		p.add(b5);
		p.add(b6);
		add(p);
		addWindowListener(this);
		b1.addActionListener(this);
		b2.addActionListener(this);
		b3.addActionListener(this);
		b4.addActionListener(this);
		b5.addActionListener(this);
		b6.addActionListener(this);
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
		e.getWindow().dispose();
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
			setVisible(false);
			c=new Create("Create Account", this);
			c.setVisible(true);
		}
		else if(e.getSource()==b2)
		{
			setVisible(false);
			d=new Details("Account Details", this);
			d.setVisible(true);
		}
		else if(e.getSource()==b3)
		{
			setVisible(false);
			cc=new CreditCard("Activating Card", this);			
		}
		else if(e.getSource()==b4)
		{
			setVisible(false);
			sp=new SpendingProfile("Spending Profile", this);
			sp.setVisible(true);
		}
		else if(e.getSource()==b5)
		{
			setVisible(false);
			cu=new CardUnblock("Ublocking Card", this);
			cu.setVisible(true);
		}
		else if(e.getSource()==b6)
			System.exit(0);
	}
}
