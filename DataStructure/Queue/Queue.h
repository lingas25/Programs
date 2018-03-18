#pragma once

typedef struct _NODE
{
	long			nData;
	struct _NODE	*pstNext;
}NODE, *PNODE;

class CQueue
{
public:
	CQueue();
	~CQueue();
	void AddAtFront(long fnData);
	void AddAtLast(long fnData);
	long RemoveFromFront();
	long RemoveFromLast();
	void Display();
	bool IsEmpty()
	{
		return (NULL == m_pstRear);
	}

private:
	long	m_nCount;
	PNODE	m_pstFront, m_pstRear;
};