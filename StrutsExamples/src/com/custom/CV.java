package com.custom;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.validator.Field;
import org.apache.commons.validator.Validator;
import org.apache.commons.validator.ValidatorAction;
import org.apache.commons.validator.util.ValidatorUtils;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.validator.Resources;
import org.apache.struts.validator.ValidatorForm;
 
public class CV extends ValidatorForm {
    public static boolean validateLog(Object bean, ValidatorAction va,
            Field field, ActionMessages errors, Validator validator,
            HttpServletRequest request) {
    	//String name = ValidatorUtils.getValueAsString(bean,field.getProperty());
        //System.out.println(name);
        return true;
        /*
        char[] chars = phone.toCharArray();
        int ct = 0;
        for (int i = 0; i < chars.length; i++) {
            char c = chars[i];
            if (Character.isDigit(c)) {
                ct++;
            } else if (Character.isWhitespace(c)) {
            } else {
                try {
                    errors.add(field.getKey(), Resources.getActionMessage(
                            validator, request, va, field));
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return false;
            }
        }
        if (ct != 10) {
            try {
                errors.add(field.getKey(), Resources.getActionMessage(
                        validator, request, va, field));
            } catch (Exception e) {
                e.printStackTrace();
            }
            return false;
        } else {
            System.out.println("phone ok");
            return true;
        }
    */
    }
}