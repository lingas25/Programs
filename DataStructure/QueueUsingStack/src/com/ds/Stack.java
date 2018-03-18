package com.ds;

import com.ds.Node;

public class Stack {
	private Node 	m_cHead;
	private long 	m_nCount;
	
	public Stack() {
		m_cHead = null;
		m_nCount = 0;
	}
	
	@Override
	protected void finalize() throws Throwable {
		// TODO Auto-generated method stub
		int lnData = -1;
		
		super.finalize();
		
		while (!IsEmpty()) {
			lnData = Pop();
		}
	}
	
	public final boolean IsEmpty() {
		return (null == m_cHead);
	}
	
	public final long GetCount() {
		return m_nCount;
	}
	
	public void Push(int fnData) {
		Node lcNextNode = null;
		lcNextNode = new Node(fnData);
		if (null != m_cHead) {
			lcNextNode.cNext = m_cHead;
		}
		
		m_cHead =  lcNextNode;
		m_nCount++;
	}
	
	public int Pop() {
		int lnData = -1;
		Node lcNode = null;
		
		if (null != m_cHead) {
			lcNode = m_cHead;
			m_cHead = m_cHead.cNext;
			lnData = lcNode.nData;
			lcNode = null;
			m_nCount--;
			if (0 == m_nCount) {
				m_cHead = null;
			}
		}
		
		return lnData;
	}
}