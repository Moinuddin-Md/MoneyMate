package com.cetpa;

import java.time.LocalDate;
import java.time.LocalTime;

public class DateTimeFinder 
{
	public static String getCurrentTime()
	{
		LocalTime lt=LocalTime.now();
		int h=lt.getHour();
		String x="AM";
		if(h>12)
		{
			h-=12;
			x="PM";
		}
		String time=h+":"+lt.getMinute()+":"+lt.getSecond()+" "+x;
		return time;
	}
	public static String getCurrentDate()
	{
		LocalDate dt=LocalDate.now();
		String date=dt.getDayOfMonth()+"-"+dt.getMonthValue()+"-"+dt.getYear();
		return date;
	}
}
