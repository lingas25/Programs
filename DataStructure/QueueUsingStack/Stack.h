#pragma once

typedef struct _NODE
{
	short			nData;
	struct _NODE	*pstNext;
}NODE, *PNODE;

class CStack
{
public:
	CStack();
	~CStack();
	void Push(short fnData);
	short Pop();
	bool IsEmpty()
	{
		return (NULL == m_pstHead);
	}

	long GetCount() const
	{
		return m_nCount;
	}

private:
	PNODE	m_pstHead;
	long	m_nCount;
};