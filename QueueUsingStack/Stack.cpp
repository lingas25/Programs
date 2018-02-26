#include "stdafx.h"
#include "Stack.h"


CStack::CStack() : m_nCount(NULL)
{
	m_pstHead = NULL;
}


CStack::~CStack()
{
	short lnData = 0;
	while (!IsEmpty())
	{

		lnData = Pop();
	}
}

void CStack::Push(short fnData)
{
	PNODE lpstNode = NULL;
	lpstNode = new NODE;
	if (NULL != m_pstHead)
	{
		lpstNode->pstNext = m_pstHead;
	}
	lpstNode->nData = fnData;
	m_pstHead = lpstNode;
	m_nCount++;
}

short CStack::Pop()
{
	short lnData = -1;
	PNODE lpstNode = NULL;
	if (NULL != m_pstHead)
	{
		lpstNode = m_pstHead;
		lnData = m_pstHead->nData;
		m_nCount--;
		m_pstHead = m_pstHead->pstNext;
		delete lpstNode;
		lpstNode = NULL;
	}
	if (0 == m_nCount)
	{
		m_pstHead = NULL;
	}
	return lnData;
}