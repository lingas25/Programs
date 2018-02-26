// BubbleSort.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <malloc.h>

void BubbleSort(short fnarrValue[], long fnCount);
void InsertionSort(short fnarrValue[], long fnCount);
void SelectionSort(short fnarrValue[], long fnCount);

int main()
{
	long lnCount = 0, lnPos = 0;
	short *lpnarrValue = NULL;

	printf("\nEnter the count: ");
	scanf_s("%ld", &lnCount);

	lpnarrValue = (short *)malloc(sizeof(short) * lnCount);

	for (lnPos = 0; lnPos < lnCount; lnPos++)
	{
		scanf_s("%d", &lpnarrValue[lnPos]);
	}
	//BubbleSort(lpnarrValue, lnCount);
	//printf("\nBubble sort\n ");

	//InsertionSort(lpnarrValue, lnCount);
	//printf("\nInsertion sort\n ");

	SelectionSort(lpnarrValue, lnCount);
	printf("\nSelection sort\n ");
	
	for (lnPos = 0; lnPos < lnCount; lnPos++)
	{
		printf("%d ", lpnarrValue[lnPos]);
	}
	_getchar_nolock();
	_getchar_nolock();
    return 0;
}

void BubbleSort(short fnarrValue[], long fnCount)
{
	long lnPos = 0, lnSubPos = 0;
	short lnTemp = 0;

	for (lnPos = 0; lnPos < fnCount; lnPos++)
	{
		for (lnSubPos = 0; lnSubPos < fnCount - lnPos - 1; lnSubPos++)
		{
			if (fnarrValue[lnSubPos] > fnarrValue[lnSubPos + 1])
			{
				lnTemp = fnarrValue[lnSubPos];
				fnarrValue[lnSubPos] = fnarrValue[lnSubPos + 1];
				fnarrValue[lnSubPos + 1] = lnTemp;
			}
		}
	}
}

void InsertionSort(short fnarrValue[], long fnCount)
{
	long lnPos = 0, lnSubPos = 0;
	short lnTemp = 0;

	for (lnPos = 0; lnPos < fnCount - 1; lnPos++)
	{
		for (lnSubPos = lnPos + 1; lnSubPos < fnCount; lnSubPos++)
		{
			if (fnarrValue[lnPos] > fnarrValue[lnSubPos])
			{
				lnTemp = fnarrValue[lnPos];
				fnarrValue[lnPos] = fnarrValue[lnSubPos];
				fnarrValue[lnSubPos] = lnTemp;
			}
		}
	}
}

void SelectionSort(short fnarrValue[], long fnCount)
{
	long lnPos = 0, lnSubPos = 0;
	short lnTemp = 0;

	for (lnPos = 0; lnPos < fnCount; lnPos++)
	{
		for (lnSubPos = 0; lnSubPos < fnCount; lnSubPos++)
		{
			if (lnPos != lnSubPos && fnarrValue[lnPos] < fnarrValue[lnSubPos])
			{
				lnTemp = fnarrValue[lnPos];
				fnarrValue[lnPos] = fnarrValue[lnSubPos];
				fnarrValue[lnSubPos] = lnTemp;
			}
		}
	}
}

void MergeSort(short fnarrValue[], long fnStart, short fnEnd)
{
	if (0 == (fnEnd - fnStart))
	{
		return;
	}
	MergeSort(fnarrValue, fnStart, fnEnd / 2);
	MergeSort(fnarrValue, ((fnEnd / 2) + 1), fnEnd);
}