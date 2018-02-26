#include "stdafx.h"
#include "CirDLinkList.h"


CCirDLinkList::CCirDLinkList()
{
}


CCirDLinkList::~CCirDLinkList()
{
	PNODE lpstNewNode = NULL, lpstDelNode = NULL;
	lpstNewNode = m_pstHead;

	if (NULL != m_pstHead)
	{
		do
		{
			lpstDelNode = lpstNewNode;
			lpstNewNode = lpstNewNode->pstNext;

			delete lpstDelNode;
			lpstDelNode = NULL;
		} while (m_pstHead != lpstNewNode
			&& NULL != lpstNewNode);
		m_pstHead = m_pstLast = NULL;
	}
}

PNODE CCirDLinkList::AddNode(short fnData)
{
	PNODE lpstNewNode = NULL;
	lpstNewNode = new NODE;
	lpstNewNode->nData = fnData;
	lpstNewNode->pstNext = NULL;
	lpstNewNode->pstPrev = NULL;

	if (NULL == m_pstHead)
	{
		m_pstHead = m_pstLast = lpstNewNode;
		m_pstLast->pstNext = m_pstHead;
		m_pstHead->pstPrev = m_pstLast;
	}
	else
	{
		m_pstLast->pstNext = lpstNewNode;
		lpstNewNode->pstPrev = m_pstLast;
		lpstNewNode->pstNext = m_pstHead;
		m_pstHead->pstPrev = lpstNewNode;
	}
	m_nCount++;
	return lpstNewNode;
}

void CCirDLinkList::AddAtFirst(short fnData)
{
	m_pstHead = AddNode(fnData);
}

void CCirDLinkList::AddAtLast(short fnData)
{
	m_pstLast = AddNode(fnData);
}

void CCirDLinkList::Display()
{
	PNODE lpstNewNode = NULL;
	lpstNewNode = m_pstHead;

	do
	{
		printf("%d->", lpstNewNode->nData);
		lpstNewNode = lpstNewNode->pstNext;
	} while (m_pstHead != lpstNewNode);
}

void CCirDLinkList::ReverseDisplay()
{
	PNODE lpstNewNode = NULL;
	lpstNewNode = m_pstLast;

	do
	{
		printf("%d->", lpstNewNode->nData);
		lpstNewNode = lpstNewNode->pstPrev;
	} while (m_pstLast != lpstNewNode);
}

void CCirDLinkList::Reverse()
{
	PNODE lpstCurrNode = NULL, lpstPrevNode = NULL, lpstNextNode = NULL;
	lpstCurrNode = m_pstHead;
	m_pstHead = m_pstLast;
	m_pstLast = lpstCurrNode;
	lpstPrevNode = lpstCurrNode;
	lpstCurrNode = lpstCurrNode->pstNext;
	
	do
	{
		lpstNextNode = lpstCurrNode->pstNext;

		lpstCurrNode->pstNext = lpstPrevNode;
		lpstPrevNode->pstPrev = lpstCurrNode;

		lpstPrevNode = lpstCurrNode;
		lpstCurrNode = lpstNextNode;

	} while (m_pstLast != lpstCurrNode);

	m_pstLast->pstNext = m_pstHead;
	m_pstHead->pstPrev = m_pstLast;
}

short CCirDLinkList::RemoveFromFront()
{
	short lnData = 0;
	PNODE lpstNode = NULL;

	if (0 == m_nCount)
	{
		return -1;
	}

	lpstNode = m_pstHead->pstNext;
	lnData = m_pstHead->nData;

	delete m_pstHead;
	m_pstHead = NULL;
	m_nCount--;

	if (0 == m_nCount)
	{
		m_pstHead = m_pstLast = NULL;
	}
	else
	{
		m_pstHead = lpstNode;
		m_pstHead->pstPrev = m_pstLast;
		m_pstLast->pstNext = m_pstHead;
	}

	return lnData;
}

short CCirDLinkList::RemoveFromLast()
{
	short lnData = 0;
	PNODE lpstNode = NULL;

	if (0 == m_nCount)
	{
		return -1;
	}

	lpstNode = m_pstLast->pstPrev;
	lnData = m_pstLast->nData;

	delete m_pstLast;
	m_pstLast = NULL;

	m_nCount--;

	if (0 == m_nCount)
	{
		m_pstHead = m_pstLast = NULL;
	}
	else
	{
		m_pstLast = lpstNode;
		m_pstHead->pstPrev = m_pstLast;
		m_pstLast->pstNext = m_pstHead;
	}

	return lnData;
}