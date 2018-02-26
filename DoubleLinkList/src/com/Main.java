package com;

import com.ds.DoubleLinkList;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		DoubleLinkList lcDLinkList = new DoubleLinkList();
		
		lcDLinkList.AddAtFront(1);
		/*lcDLinkList.AddAtLast(2);
		lcDLinkList.AddAtLast(3);
		lcDLinkList.AddAtLast(4);
		lcDLinkList.AddAtFront(5);*/
		
		lcDLinkList.Display();
		System.out.println("\nReverse");
		lcDLinkList.ReverseDisplay();
		
		//System.out.println("\n" + lcDLinkList.RemoveFromFront());
		//System.out.println(lcDLinkList.RemoveFromLast());
		lcDLinkList.Display();
		lcDLinkList.Reverse();
		System.out.println("\nReverse");
		lcDLinkList.Display();
		System.out.print("\n");
		while (!lcDLinkList.isEmpty()) {
			//System.out.println(lcDLinkList.RemoveFromLast());
			System.out.println(lcDLinkList.RemoveFromFront());
		}
	}

}
