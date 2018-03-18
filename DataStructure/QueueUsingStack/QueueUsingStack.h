#pragma once
#include "Stack.h"

class CQueueUsingStack
{
public:
	CQueueUsingStack();
	~CQueueUsingStack();
	void EnQueue(short fnData);
	short DeQueue();
	bool IsEmpty()
	{
		return (m_cFrontStck.IsEmpty() && m_cRearStck.IsEmpty());
	}

	long GetCount()
	{
		return m_cFrontStck.GetCount() + m_cRearStck.GetCount();
	}
private:
	CStack m_cFrontStck, m_cRearStck;
};

