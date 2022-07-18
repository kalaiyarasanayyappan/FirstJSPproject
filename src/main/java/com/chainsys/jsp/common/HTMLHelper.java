package com.chainsys.jsp.common;

public class HTMLHelper {
	   public static String getHtmlTemplate(String title,String body) {
		   String htmlOutput ="<html><head><title>"+title+"</title></head><body>";
		    htmlOutput += "<div>"+body+"</div></body></html>";
		   return htmlOutput;
	   }
	}
