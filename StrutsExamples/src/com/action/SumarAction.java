package com.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.*;

public class SumarAction extends Action {
	
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;

		if (this.isCancelled(request)){
			forward = mapping.findForward("cancel");	
		} else {	
			com.form.SumarForm operationForm = (com.form.SumarForm) form;
			
			int operando1 = Integer.parseInt(operationForm.getOperando1());
			int operando2 = Integer.parseInt(operationForm.getOperando2());
			
			operationForm.setResultado(String.valueOf(operando1 + operando2));
			
			forward = mapping.findForward("ok");
		}
		
		return forward;
	}
}
