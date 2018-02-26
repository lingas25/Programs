// QueueUsingStack.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "QueueUsingStack.h"

int main()
{
	CQueueUsingStack lcQueue;

	lcQueue.EnQueue(1);
	lcQueue.EnQueue(2);
	lcQueue.EnQueue(3);
	lcQueue.EnQueue(4);

	printf("%d\n", lcQueue.DeQueue());
	lcQueue.EnQueue(5);
	printf("%d\n", lcQueue.DeQueue());
	lcQueue.EnQueue(6);
	printf("%d\n", lcQueue.DeQueue());
	lcQueue.EnQueue(7);
	while (0 < lcQueue.GetCount())
	{
		printf("%d\n", lcQueue.DeQueue());
	}

	_getchar_nolock();
    return 0;
}

