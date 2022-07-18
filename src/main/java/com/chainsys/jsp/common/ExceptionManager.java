package com.chainsys.jsp.common;

import com.chainsys.jsp.common.HTMLHelper;
import com.chainsys.jsp.common.LogManager;

public class ExceptionManager {
	   public static String handleException(Exception e,String source,String message) {
		   LogManager.logException(e,source);
		 message += "Message: "+e.getMessage();
		   String errorPage=HTMLHelper.getHtmlTemplate("Error", message);
	        return errorPage;
	   }
	}
