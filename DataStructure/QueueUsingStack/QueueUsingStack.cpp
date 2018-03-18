#include "stdafx.h"
#include "QueueUsingStack.h"


CQueueUsingStack::CQueueUsingStack()
{
}


CQueueUsingStack::~CQueueUsingStack()
{
}

void CQueueUsingStack::EnQueue(short fnData)
{
	if (m_cFrontStck.IsEmpty())
	{
		while (!m_cRearStck.IsEmpty())
		{
			m_cFrontStck.Push(m_cRearStck.Pop());
		}
	}
	m_cFrontStck.Push(fnData);
}

short CQueueUsingStack::DeQueue()
{
	if (!m_cRearStck.IsEmpty())
	{
		return m_cRearStck.Pop();
	}
	while (1 < m_cFrontStck.GetCount())
	{
		m_cRearStck.Push(m_cFrontStck.Pop());
	}

	return m_cFrontStck.Pop();
}