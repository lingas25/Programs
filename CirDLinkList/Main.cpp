// CirDLinkList.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "CirDLinkList.h"

int main()
{
	CCirDLinkList lcLinkList;

	lcLinkList.AddAtFirst(1);
	lcLinkList.AddAtLast(2);
	lcLinkList.AddAtFirst(3);
	lcLinkList.AddAtLast(4);
	lcLinkList.AddAtLast(5);
	lcLinkList.AddAtFirst(6);
	lcLinkList.AddAtFirst(7);
	printf("\nNormal\n");
	lcLinkList.Display();
	printf("\nReverese Disp\n");
	lcLinkList.ReverseDisplay();
	printf("\nReverese\n");
	lcLinkList.Reverse();
	lcLinkList.Display();
	lcLinkList.Reverse();
	printf("\nNormal\n");
	lcLinkList.Display();
	printf("\nRemove\n");
	while (!lcLinkList.IsEmpty())
	{
		printf("%d->", lcLinkList.RemoveFromLast());
	}
	_gettchar();
    return 0;
}

