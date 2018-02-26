package com.ds.sorting;

public class InsertionSorting {
	public void sort(int []fnarrData, int fnCount) {
		int lnTempData = 0;
		for (int lnPos = 1; lnPos < fnCount; lnPos++) {
			for (int lnSubPos = 0; lnSubPos < lnPos; lnSubPos++) {
				if (fnarrData[lnSubPos] > fnarrData[lnPos]) {
					lnTempData = fnarrData[lnSubPos];
					fnarrData[lnSubPos] = fnarrData[lnPos];
					fnarrData[lnPos] = lnTempData;
				}
			}
		}
	}
}
