#pragma once

typedef struct _NODE
{
	short			nData;
	struct _NODE	*pstNext;
	struct _NODE	*pstPrev;
}NODE, *PNODE;

class CDLinkList
{
public:
	CDLinkList();
	~CDLinkList();

	bool IsEmpty() const
	{
		return (NULL == m_pstHead);
	}

	long GetCount() const
	{
		return m_nCount;
	}

	void AddAtFirst(short fnData);
	void AddAtLast(short fnData);
	void Display();
	void Reverse();
	void ReverseDisplay();
	short RemoveFromFront();
	short RemoveFromLast();

private:
	PNODE	m_pstHead, m_pstLast;
	long	m_nCount;
};

