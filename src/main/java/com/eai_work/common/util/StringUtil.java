package com.eai_work.common.util;

import org.springframework.lang.Nullable;

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
	
	public static String stringNvl(Object obj, String defaultStr){
		String result = defaultStr;
		if(obj != null && !"".equals(obj)){
			result = String.valueOf(obj);
		}
		return result;
	}
	
	public static boolean isEmpty(@Nullable Object str) {
		return (str == null || "".equals(str));
	}
	
	public static boolean hasText(@Nullable String str) {
		return (str != null && !str.isEmpty() && containsText(str));
	}
	
	private static boolean containsText(CharSequence str) {
		int strLen = str.length();
		for (int i = 0; i < strLen; i++) {
			if (!Character.isWhitespace(str.charAt(i))) {
				return true;
			}
		}
		return false;
	}
}
