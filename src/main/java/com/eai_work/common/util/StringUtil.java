package com.eai_work.common.util;

public class StringUtil {

	public static String truncate(String text, int maxlength) {
		return (text.length() > maxlength) ? text.substring(0, maxlength - 1) + "..." : text;
	}
	
	public static String sliceBetween(String text, String startStr, String endStr) {
		if(text.length() < 1) {
			return "";
		}
		
		int startStridx = text.indexOf(startStr);
		int endStridx = text.indexOf(endStr);
		
		if(startStridx < 0 || endStridx < 0) {
			return text;
		}
		
		return text.substring(startStridx, endStridx);
	}
	
}
