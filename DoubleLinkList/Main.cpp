// DoubleLinkList.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "DLinkList.h"

int main()
{
	CDLinkList lcLinkList;

	lcLinkList.AddAtFirst(1);
	lcLinkList.AddAtLast(2);
	lcLinkList.AddAtLast(3);
	lcLinkList.AddAtLast(4);
	lcLinkList.AddAtFirst(5);
	lcLinkList.AddAtLast(6);
	lcLinkList.Display();
	printf("\nReverese\n");
	lcLinkList.ReverseDisplay();
	lcLinkList.Reverse();
	printf("\nReverese\n");
	lcLinkList.Display();
	printf("\nReverese\n");
	lcLinkList.ReverseDisplay();
	printf("\nNormal\n");
	lcLinkList.Display();
	lcLinkList.Reverse();
	printf("\nReverese\n");
	lcLinkList.Display();
	printf("\nReverese\n");
	lcLinkList.ReverseDisplay();

	lcLinkList.RemoveFromFront();
	lcLinkList.RemoveFromLast();
	printf("\nNormal\n");
	lcLinkList.Display();
	lcLinkList.Reverse();
	printf("\nReverese\n");
	lcLinkList.Display();
	lcLinkList.AddAtFirst(7);
	lcLinkList.AddAtLast(8);
	printf("\nNormal\n");
	lcLinkList.Display();

	_gettchar();
    return 0;
}

