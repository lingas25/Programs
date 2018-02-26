package com;

import java.util.Scanner;

import com.ds.sorting.BubbleSort;
import com.ds.sorting.InsertionSorting;
import com.ds.sorting.SelectionSort;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int []lnData = null;
		int lnCount = 0;
		Scanner lcScan = new Scanner(System.in);
		BubbleSort lcBubbleSort = new BubbleSort();
		InsertionSorting lcInsertSort = new InsertionSorting();
		SelectionSort lcSeleSort = new SelectionSort();
		
		System.out.println("Please enter the count of element: ");
		lnCount = lcScan.nextInt();
		lnData = new int[lnCount];
		System.out.println("Enter the element: ");
		for (int lnPos = 0; lnPos < lnCount; lnPos++) {
			lnData[lnPos] = lcScan.nextInt();
		}
		//lcBubbleSort.sort(lnData, lnCount);
		//System.out.println("Bubble Sort\n");
		
		//lcInsertSort.sort(lnData, lnCount);
		//System.out.println("Insertion Sort\n");
		lcSeleSort.sort(lnData, lnCount);
		System.out.println("Selection Sort\n");
		for (int lnPos = 0; lnPos < lnCount; lnPos++) {
			System.out.print(lnData[lnPos] + " ");
		}
		
		lcScan.close();
	}

}
