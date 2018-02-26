package com.ds.sorting;

public class BubbleSort {
	public void sort(int []fnarrData, int fnCount) {
		int lnTempData = 0;
		for (int lnPos = 0; lnPos < fnCount; lnPos++) {
			for (int lnSubPos = 0; lnSubPos < (fnCount - lnPos) - 1; lnSubPos++) {
				if (fnarrData[lnSubPos] > fnarrData[lnSubPos + 1]) {
					lnTempData = fnarrData[lnSubPos];
					fnarrData[lnSubPos] = fnarrData[lnSubPos + 1];
					fnarrData[lnSubPos + 1] = lnTempData;
				}
			}
		}
	}
}