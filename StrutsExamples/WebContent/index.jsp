<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html:html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Ejemplo de uso de TagLib de Struts</title>
	<style type="text/css">
		* 			{ margin:  1px; padding: 1px; }
		.borde		{ border-style:solid; border-color:#9999aa; border-width:1px; }
		div.errores { color: red; font-weight: bold; }
		p.nota		{ color: #229922; }
		.errorHeader { background-color:red; color:white;}
	</style>
</head>
<body>
	<%-- Validación usando un ActionForm --%>
	<table>
		<tr style="vertical-align:top">
			<td class="borde">
				<%-- Imprimimos un mensaje internacionalizado con parámetros--%>	
				<p class="nota">Imprimimos un mensaje internacionalizado con parámetros</p>
				<bean:message key="message.hello" arg0="Carlos García"  />
				
				<%-- Creamos un bean a nivel de session y luego creamos un variable de tipo String con los valores de un bean y lo imprimimos --%>
		    	<p class="nota">Creamos un bean a nivel de session y luego creamos<br/> un variable de tipo String con los valores de un bean</p>
		    	<jsp:useBean	 id="usuario2"		scope="session" class="com.entity.User" />
				<jsp:setProperty name="usuario2"	property="login" value="Pepito"/>
				<jsp:setProperty name="usuario2"	property="email" value="email@de_pepito.com"/>
				<jsp:setProperty name="usuario2"	property="age"	 value="24"/>
				
		    	<bean:define   id="login"		name="usuario2" property="login"/>
				<p><bean:write name="login" /></p>
			 
				 <%-- Guarda una Cookie en el Bean de nombre "sess". Imprimimos algunos valores --%>
			 	<p class="nota">Guarda una Cookie en el Bean de nombre "sess".</p>
			 	<bean:cookie id="sess" name="JSESSIONID" value="(Sin valor)"/>
			 	<bean:write name="sess" property="value" />
			 	<bean:write name="sess" property="secure" />
			
		 		<%-- Guarda la cabecera Accept-Language en una variable --%>
		 		<p class="nota">Guarda la cabecera Accept-Language en una variable</p>
				<bean:header id="var1" name="Accept-Language"/>
				<p><bean:write name="var1" /></p>
			
				<%-- Comparaciones entre valores --%>
				<p class="nota">Comparaciones entre valores</p>
				<p><logic:equal			name="sess" property="name"	  value="JSESSIONID">true</logic:equal></p>
				<p><logic:notEqual		name="sess" property="name"	  value="JSESSIONID">false</logic:notEqual></p>
		   		<p><logic:greaterThan	name="sess" property="maxAge" value="0">El tiempo de vida es mayor que 0</logic:greaterThan></p>
			
				<%-- Comprobamos si tiene valor una variable --%>
				<p class="nota">Comprobamos si tiene valor una variable</p>
		    	<p><logic:empty		name="usuario2" property="login">La propiedad login está vacia</logic:empty></p>
		    	<p><logic:notEmpty	name="usuario2" property="login">La propiedad login NO está vacia</logic:notEmpty></p>      
		    
			    <%-- Formateando la salida de información --%> 
				<p class="nota">Formateando la salida de información</p>
		     	<%
					pageContext.setAttribute("unDouble", new Double(124587.89));
		     		pageContext.setAttribute("ahora", 	 new java.util.Date(System.currentTimeMillis())); 
				%>
				<bean:write name="unDouble" format=",000.00" />&nbsp;&nbsp;<bean:write name="ahora" 	format="dd/MM/yyyy" />
		
				<%-- Consultamos si una cabecera tiene un determinado contenido (también vale para parámetros, cookies, etc) --%>
				<p class="nota">Consultamos si una cabecera tiene un determinado contenido:</p>
				<bean:header id="language" name="Accept-Language"/>
				<p><bean:write name="language"/></p>
				<logic:present header="Accept-Language" >
					<logic:match 	header="Accept-Language" value="es">Accept-Language Match en cualquier posicion</logic:match>
					<logic:notMatch header="Accept-Language" value="es">Accept-Language notMatch en cualquier posicion</logic:notMatch>
				</logic:present>
				<logic:notPresent header="Accept-Language">Accept-Language no existe</logic:notPresent>
		
		    	<%-- Iteramos sobre los elementos de una lista --%> 
				<p class="nota">Iteramos sobre los elementos de una lista</p>
		    <%
		        java.util.ArrayList list = new java.util.ArrayList();
		        list.add("++++++++ Uno ++++++++");
		        list.add("++++++++ Dos ++++++++");
		        pageContext.setAttribute("lista", list);
			%>	
		        <ol>
		   			<logic:iterate id="element" name="lista" scope="page">
		       			<li><bean:write name="element" /></li>
		   			</logic:iterate>
		   		</ol>
			</td>		
			<td class="borde">
				<%-- Nota: Los operandos deben ser números positivos. Validación usando un ActionForm) --%>
				<p class="nota">
					Validación usando un ActionForm.
					<br/>Nota: Los operandos deben ser números positivos.
				</p>
				<html:form action="sumar"  method="post" focus="operando1" >
					<br/>Operando 1:<html:text	property="operando1"/>&nbsp;<html:errors property="operando1" prefix="" suffix="" header="" footer=""/>
					<br/>Operando 2:<html:text   property="operando2"/>&nbsp;<html:errors property="operando2" prefix="" suffix="" header="" footer=""/>
					<table>
						<tr>
							<td><html:submit value="Sumar"/></td>
							<td><html:cancel value="Cancelar"/></td>
						</tr>
					</table>
						
					<logic:notEmpty name="operandosForm" property="resultado">
						<p> <strong>El resultado es</strong>: 
							<bean:write name="operandosForm" property="resultado"/>
						</p>			
					</logic:notEmpty>
				</html:form>
				
				<%-- Validación usando un DynaValidatorForm con validación tanto en el servidor como en el cliente (javascript) --%>			
				<p class="nota">Validación usando un DynaValidatorForm.
					<br/>Validación en servidor y cliente (javascript).
					<br/>Todos los campos son requeridos.
					<br/>El campo email debe tener un formáto válido.
					<br/>El campo edad debe ser un número entre 18 y 40
				</p>
				<html:javascript formName="registroForm" />
				<html:form action="registro"  method="post" focus="login" onsubmit="return validateRegistroForm(this);">
					<br/>Login: <html:text property="login"/>&nbsp;<html:errors property="login" prefix="" suffix="" header="" footer=""/>			
					<br/>Email: <html:text property="email"/>&nbsp;<html:errors property="email" prefix="" suffix="" header="" footer=""/>
					<br/>Edad:  <html:text property="age"/>&nbsp;<html:errors property="age"   prefix="" suffix="" header="" footer=""/>
					<p><html:submit value="Enviar"/></p>
				</html:form>	
			</td>	
		</tr>
	</table>
	
	<%-- En caso de que existan errores, los mostramos --%>
    <logic:messagesPresent>
    	<div class="errores">
			<html:errors/>
		</div>	        
    </logic:messagesPresent>
</body>
</html:html>