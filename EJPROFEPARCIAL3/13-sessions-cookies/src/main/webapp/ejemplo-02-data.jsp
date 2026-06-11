<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder,java.net.URLDecoder" %>     
<tr>
	<td>${URLDecoder.decode(param.attrName, "UTF-8")}</td>
	<td>${URLDecoder.decode(param.attrValue, "UTF-8")}</td>
	<td><button type="button" class="btn btn-primary" onclick="jSessions.del('${URLEncoder.encode(param.attrName)}', this)">Eliminar</button></td>
</tr>