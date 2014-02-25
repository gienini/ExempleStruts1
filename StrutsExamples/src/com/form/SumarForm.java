package com.form;

import org.apache.commons.validator.GenericValidator;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMessage;

public class SumarForm extends org.apache.struts.action.ActionForm {
	private String operando1;
	private String operando2;
	private String resultado;
	
	public String getOperando1() {
		return operando1;
	}

	public void setOperando1(String operando1) {
		this.operando1 = operando1;
	}

	public String getOperando2() {
		return operando2;
	}
	
	public void setOperando2(String operando2) {
		this.operando2 = operando2;
	}

	public String getResultado() {
		return resultado;
	}
	
	public void setResultado(String resultado) {
		this.resultado = resultado;
	}
	
	/* 
	 * Inicializamos los parámetros
	 */
	public void reset(org.apache.struts.action.ActionMapping mapping, javax.servlet.http.HttpServletRequest request) {
		this.operando1 = "";
		this.operando2 = "";
		this.resultado = "";
	}

	/* 
	 * Validamamos los datos introducidos por el usuario
	 */
	public ActionErrors validate(org.apache.struts.action.ActionMapping mapping, javax.servlet.http.HttpServletRequest request) {
		ActionErrors	errors		=  new ActionErrors();
		
		if (GenericValidator.isBlankOrNull(this.operando1) || (! GenericValidator.isInRange(Integer.parseInt(this.operando1), 0, Integer.MAX_VALUE))) {
			errors.add("operando1", new ActionMessage("error.operando.negativo"));
		}
		
		if (GenericValidator.isBlankOrNull(this.operando2) || (! GenericValidator.isInRange(Integer.parseInt(this.operando2), 0, Integer.MAX_VALUE))) {
			errors.add("operando2", new ActionMessage("error.operando.negativo"));
		}
		
		return errors;
	}
}
