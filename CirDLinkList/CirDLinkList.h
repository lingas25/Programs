#pragma once

typedef struct _NODE
{
	short	nData;
	struct _NODE	*pstNext;
	struct _NODE	*pstPrev;
}NODE, *PNODE;

class CCirDLinkList
{
public:
	CCirDLinkList();
	~CCirDLinkList();
	void AddAtFirst(short fnData);
	void AddAtLast(short fnData);
	void Display();
	void ReverseDisplay();
	void Reverse();
	short RemoveFromFront();
	short RemoveFromLast();
	bool IsEmpty() const
	{
		return (NULL == m_pstHead);
	}

	long GetCount() const
	{
		return m_nCount;
	}

private:
	PNODE AddNode(short fnData);

	PNODE	m_pstHead, m_pstLast;
	long	m_nCount;
};