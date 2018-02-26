package com.ds;

public class Node {
	public int 	nData;
	public Node	cNext, cPrev;
	
	public Node(int fnData) {
		nData = fnData;
		cNext = cPrev = null;
	}
}
