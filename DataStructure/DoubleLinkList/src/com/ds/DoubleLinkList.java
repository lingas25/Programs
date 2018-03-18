package com.ds;

import java.util.concurrent.SynchronousQueue;

public class DoubleLinkList {
	private Node 	m_cHead, m_cLast;
	private long	m_nCount;
	
	public DoubleLinkList() {
		// TODO Auto-generated constructor stub
		m_nCount = 0;
		m_cHead = m_cLast = null;
	}
	
	@Override
	protected void finalize() throws Throwable {
		// TODO Auto-generated method stub
		super.finalize();
	}
	
	public final boolean isEmpty() {
		return (null == m_cHead);
	}
	
	public final long getCount() {
		return m_nCount;
	}
	
	public void AddAtFront(int fnData) {
		Node lcNewNode = null;
		lcNewNode = new Node(fnData);
		
		if (null == m_cHead) {
			m_cHead = m_cLast = lcNewNode;
		}
		else {
			lcNewNode.cNext = m_cHead;
			m_cHead.cPrev = lcNewNode;
			m_cHead = lcNewNode;
		}
		m_nCount++;
	}
	
	public void AddAtLast(int fnData) {
		Node lcNewNode = null;
		lcNewNode = new Node(fnData);
		
		if (null == m_cHead) {
			m_cHead = m_cLast = lcNewNode;
		}
		else {
			m_cLast.cNext = lcNewNode;
			lcNewNode.cPrev = m_cLast;
			m_cLast = lcNewNode;
		}
		m_nCount++;
	}
	
	public int RemoveFromFront() {
		int lnData = -1;
		Node lcNode = null;
		
		if (isEmpty()) {
			return lnData;
		}
		lcNode = m_cHead;
		m_cHead = m_cHead.cNext;
		
		lnData = lcNode.nData;
		lcNode = null;
		m_nCount--;
		if (0 == m_nCount) {
			m_cHead = m_cLast = null;
		}
		else {
			m_cHead.cPrev = null;
		}
		
		return lnData;
	}
	
	public int RemoveFromLast() {
		int lnData = -1;
		Node lcNode = null;
		
		if (isEmpty()) {
			return lnData;
		}
		lcNode = m_cLast;
		m_cLast = m_cLast.cPrev;
		lnData = lcNode.nData;
		lcNode = null;
		m_nCount--;
		if (0 == m_nCount) {
			m_cHead = m_cLast = null;
		}
		else {
			m_cLast.cNext = null;
		}
		
		return lnData;
	}
	
	public void Display() {
		Node lcNextNode = null;
		lcNextNode = m_cHead;
		
		while (null != lcNextNode) {
			System.out.print(lcNextNode.nData + " ");
			lcNextNode = lcNextNode.cNext;
		}
	}
	
	public void ReverseDisplay() {
		Node lcPrevNode = null;
		lcPrevNode = m_cLast;
		
		while (null != lcPrevNode) {
			System.out.print(lcPrevNode.nData + " ");
			lcPrevNode = lcPrevNode.cPrev;
		}
	}
	
	public void Reverse() {
		Node lcNextNode = null, lcCurrNode = null, lcPrevNode = null;
		
		lcPrevNode = m_cHead;
		m_cHead = m_cLast;
		m_cLast = lcPrevNode;
		lcCurrNode = lcPrevNode.cNext;
		
		while (null != lcCurrNode) {
			lcNextNode = lcCurrNode.cNext;
			lcCurrNode.cNext = lcPrevNode;
			lcPrevNode.cPrev = lcCurrNode;
			lcPrevNode = lcCurrNode;
			lcCurrNode = lcNextNode;			
		}
		m_cLast.cNext = null;
		m_cHead.cPrev = null;
	}
}
