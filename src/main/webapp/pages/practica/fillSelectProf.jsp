<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<select> 
<s:iterator value="profesionales" >
	<option value='<s:property value="id" />'><s:property value="apellido" />, <s:property value="nombre" /></option> 
</s:iterator>
</select>