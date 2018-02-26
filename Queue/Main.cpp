// Queue.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "Queue.h"

int main()
{
	CQueue lcQueue;
	long lnData = 0;
	lcQueue.AddAtFront(1);
	lcQueue.AddAtFront(2);
	lcQueue.AddAtLast(3);
	lcQueue.AddAtFront(4);
	lcQueue.AddAtLast(5);
	lcQueue.Display();
	lnData = lcQueue.RemoveFromFront();
	lnData = lcQueue.RemoveFromLast();
	printf("\nAfter Delete");
	lcQueue.Display();
	lcQueue.AddAtLast(6);
	lcQueue.AddAtFront(7);
	printf("\nAfter Delete");
	lcQueue.Display();


	_gettchar();
    return 0;
}

