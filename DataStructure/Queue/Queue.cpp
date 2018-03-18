#include "stdafx.h"
#include "Queue.h"


CQueue::CQueue() : m_nCount(0)
{
	m_pstFront = NULL;
	m_pstRear = NULL;
}


CQueue::~CQueue()
{
	long lnData = -1;
	while (!IsEmpty())
	{
		lnData = RemoveFromFront();
	}
}

void CQueue::AddAtFront(long fnData)
{
	PNODE lpstNewNode = NULL;
	lpstNewNode = new NODE;
	lpstNewNode->nData = fnData;
	lpstNewNode->pstNext = NULL;
	if (NULL == m_pstFront)
	{
		m_pstRear = m_pstFront = lpstNewNode;
	}
	else
	{
		m_pstFront->pstNext = lpstNewNode;
		m_pstFront = lpstNewNode;
	}
	m_nCount++;
}

void CQueue::AddAtLast(long fnData)
{
	PNODE lpstNewNode = NULL;
	lpstNewNode = new NODE;
	lpstNewNode->nData = fnData;
	lpstNewNode->pstNext = NULL;
	if (NULL == m_pstFront)
	{
		m_pstRear = m_pstFront = lpstNewNode;
	}
	else
	{
		lpstNewNode->pstNext = m_pstRear;
		m_pstRear = lpstNewNode;
	}
	m_nCount++;
}

long CQueue::RemoveFromFront()
{
	long lnData = -1;
	PNODE lpstNode = NULL;
	if (NULL == m_pstFront)
	{
		return lnData;
	}
	lpstNode = m_pstRear;
	
	while (NULL != lpstNode
			&& NULL != lpstNode->pstNext
			&& m_pstFront != lpstNode->pstNext)
	{
		lpstNode = lpstNode->pstNext;
	}
	lnData = m_pstFront->nData;
	delete m_pstFront;
	lpstNode->pstNext = m_pstFront = NULL;
	m_nCount--;
	if (0 == m_nCount)
	{
		m_pstFront = m_pstRear = NULL;
	}
	else
	{
		m_pstFront = lpstNode;
	}	

	return lnData;
}

long CQueue::RemoveFromLast()
{
	long lnData = -1;
	PNODE lpstNode = NULL;
	if (NULL == m_pstFront)
	{
		return lnData;
	}
	lpstNode = m_pstRear;
	lnData = lpstNode->nData;
	m_pstRear = m_pstRear->pstNext;
	if (NULL == m_pstRear)
	{
		m_pstFront = m_pstRear = NULL;
	}

	delete lpstNode;
	lpstNode = NULL;
	m_nCount--;
	return lnData;
}

void CQueue::Display()
{
	PNODE lpstNode = NULL;
	lpstNode = m_pstRear;
	while (NULL != lpstNode)
	{
		printf("\n%d", lpstNode->nData);
		lpstNode = lpstNode->pstNext;
	}
}