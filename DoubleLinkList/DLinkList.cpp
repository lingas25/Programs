#include "stdafx.h"
#include "DLinkList.h"


CDLinkList::CDLinkList() : m_nCount(0)
{
	m_pstHead = NULL;
	m_pstLast = NULL;
}


CDLinkList::~CDLinkList()
{
}

void CDLinkList::AddAtFirst(short fnData)
{
	PNODE lpstNewNode = NULL;
	lpstNewNode = new NODE;
	lpstNewNode->nData = fnData;
	lpstNewNode->pstNext = NULL;
	lpstNewNode->pstPrev = NULL;

	if (NULL == m_pstHead)
	{
		m_pstLast = m_pstHead = lpstNewNode;
	}
	else
	{
		lpstNewNode->pstNext = m_pstHead;
		m_pstHead->pstPrev = lpstNewNode;
		m_pstHead = lpstNewNode;
	}
}

void CDLinkList::AddAtLast(short fnData)
{
	PNODE lpstNewNode = NULL;
	lpstNewNode = new NODE;
	lpstNewNode->nData = fnData;
	lpstNewNode->pstNext = NULL;
	lpstNewNode->pstPrev = NULL;

	if (NULL == m_pstHead)
	{
		m_pstLast = m_pstHead = lpstNewNode;
	}
	else
	{
		m_pstLast->pstNext = lpstNewNode;
		lpstNewNode->pstPrev = m_pstLast;
		m_pstLast = lpstNewNode;
	}
}

void CDLinkList::Display()
{
	PNODE lpstNewNode = NULL;

	lpstNewNode = m_pstHead;
	while (NULL != lpstNewNode)
	{
		printf("%d->", lpstNewNode->nData);
		lpstNewNode = lpstNewNode->pstNext;
	}
}

void CDLinkList::Reverse()
{
	PNODE lpstPrevNode = NULL, lpstCurrNode = NULL, lpstNextNode = NULL;

	lpstCurrNode = m_pstHead;
	m_pstHead = m_pstLast;
	m_pstLast = lpstCurrNode;
	lpstPrevNode = lpstCurrNode;
	lpstCurrNode = lpstCurrNode->pstNext;

	while (NULL != lpstCurrNode)
	{
		lpstNextNode = lpstCurrNode->pstNext;

		lpstCurrNode->pstNext = lpstPrevNode;
		//lpstCurrNode->pstPrev = lpstNextNode;
		lpstPrevNode->pstPrev = lpstCurrNode;

		lpstPrevNode = lpstCurrNode;
		lpstCurrNode = lpstNextNode;
	}

	m_pstLast->pstNext = NULL;
	m_pstHead->pstPrev = NULL;
}

void CDLinkList::ReverseDisplay()
{
	PNODE lpstNewNode = NULL;

	lpstNewNode = m_pstLast;
	while (NULL != lpstNewNode)
	{
		printf("%d->", lpstNewNode->nData);
		lpstNewNode = lpstNewNode->pstPrev;
	}
}

short CDLinkList::RemoveFromFront()
{
	short lnData = 0;
	PNODE lpstNode = m_pstHead;
	m_pstHead = m_pstHead->pstNext;
	m_pstHead->pstPrev = NULL;

	lnData = lpstNode->nData;
	delete lpstNode;
	lpstNode = NULL;

	return lnData;
}

short CDLinkList::RemoveFromLast()
{
	short lnData = 0;
	PNODE lpstNode = m_pstLast;
	m_pstLast = m_pstLast->pstPrev;
	m_pstLast->pstNext = NULL;

	lnData = lpstNode->nData;
	delete lpstNode;
	lpstNode = NULL;

	return lnData;
}