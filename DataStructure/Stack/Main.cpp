// Stack.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "Stack.h"

int main()
{
	CStack lcStack;
	lcStack.Push(1);
	lcStack.Push(2);
	lcStack.Push(3);
	lcStack.Push(4);
	lcStack.Push(5);

	while (!lcStack.IsEmpty())
	{
		printf("\n%d", lcStack.Pop());
	}
	
	_gettchar();
    return 0;
}

