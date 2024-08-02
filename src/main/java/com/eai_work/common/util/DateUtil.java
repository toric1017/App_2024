package com.eai_work.common.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {

	public static String getDate(String format, int day)throws Exception{
		
		if("null".equals( String.valueOf( format ) )) {
			format = "yyyyMMddhhmmss";
		}
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(format);
		Date date = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DATE, day);
		
		return simpleDateFormat.format(cal.getTime());
	}

	public static String getCurrDate(String format)throws Exception{
		
		if("null".equals( String.valueOf( format ) )) {
			format = "yyyyMMddhhmmss";
		}
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(format);
		return simpleDateFormat.format(new Date());
	}
	
	public static String getDayOfWeekDate(int dayOfWeek, String format, int day)throws Exception{
		if(day != 0) {
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat(format);
			
			Date date = new Date();
			Calendar cal = Calendar.getInstance();
			cal.setTime(date);
			cal.add(Calendar.DATE, day);
			cal.set(Calendar.DAY_OF_WEEK, dayOfWeek);
			
			return simpleDateFormat.format(cal.getTime());
		}else{
			return getCurrDayOfWeekDate(dayOfWeek, format);
		}
	}
	
	public static String getCurrDayOfWeekDate(int dayOfWeek, String format)throws Exception{
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(format);
		
		Date date = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.set(Calendar.DAY_OF_WEEK, dayOfWeek);
		
		return simpleDateFormat.format(cal.getTime());
	}
	
	public static void main(String[] args) throws Exception {
		System.out.println( getDayOfWeekDate(Calendar.SUNDAY, "yyyy-MM-dd", -365) );
		System.out.println( getCurrDayOfWeekDate(Calendar.SATURDAY, "yyyy-MM-dd") );
	}
	
}
