package com.ds.sorting;

public class SelectionSort {
	public void sort(int []fnarrData, int fnCount) {
		int lnTempData = 0;
		for (int lnPos = 0; lnPos < fnCount; lnPos++) {
			for (int lnSubPos = 0; lnSubPos < fnCount; lnSubPos++) {
				if (fnarrData[lnPos] < fnarrData[lnSubPos]) {
					lnTempData = fnarrData[lnPos];
					fnarrData[lnPos] = fnarrData[lnSubPos];
					fnarrData[lnSubPos] = lnTempData;
				}
			}
		}
	}
}
