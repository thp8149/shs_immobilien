<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="immo.portal.bean.HaustypBean"%>
<%@page import="immo.portal.bean.ObjektBean"%>
<%@page import="immo.portal.servlets.KaufenServlet"%>
<%@page import="immo.portal.servlets.LogoutServlet"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../css/hauptbild.css">
	<link rel="stylesheet" href="../css/ansichtbietenkaufensuchen.css">
	<link rel="stylesheet" href="../css/dropdownNavBar.css">
	<link rel="stylesheet" href="../css/footer.css">

	<title>sps-immobilien.de/Kaufen</title>
</head>

<body>
	<header>
		<%@ include file="../jspf/navBarHauptbild.jspf"%>
	</header>
	
<c:if test="${haustypSelektiert == false}">
	<form action="../KaufenServlet" method=post>	
	
	<c:if test="${GebotZuNiedrig == true}">
		<div class="gebotfehlermeldung">
			<h1>Ihr Gebot konnte nicht akzeptiert werden, da es unter dem aktuellen Höchstpreis liegt!</h1>
		</div>
	</c:if>
	
	<c:if test="${GebotIstOk == true}">
		<div class="gebotakzeptiert">
			<h1>Ihr Gebot wurde Akzeptiert!!</h1>
		</div>
	<br>
	</c:if>
	
		<c:forEach items="${haustyplist}" var="haustyp">
			<button type="submit" class="button" name="${haustyp.typ}"><span>${haustyp.typ}</span></button><br>
		</c:forEach>
	</form>
</c:if>
	
	
<main>
	<c:if test="${haustypSelektiert == true}">
		<table class="tabelle">
		<tr>
		<td>
		<form action="../KaufenServlet" method=post>	
			<c:forEach items="${haustyplist}" var="haustyp">
				<button type="submit" class="button" name="${haustyp.typ}"><span>${haustyp.typ}</span></button><br>
			</c:forEach>
		</form>
		</td>
		
		<td>
		<form action="../BietenServlet" method=post>
			<c:forEach var="haus" items="${objekte}">
				<table class="objekttabelle">
				<tr><td class="titel" colspan="3">${haus.titel}</td></tr>
				<tr><td rowspan="7"><img src="../kaufen_bild_servlet?id=${haus.id}" alt=""/></td><td>Baujahr: </td><td>${haus.baujahr}</td></tr>
				<tr><td>Wohnfläche: </td><td>${haus.wohnflaeche} m²</td></tr>
				<tr><td>Grundstück: </td><td>${haus.grundstuecksflaeche} m²</td></tr>
				<tr><td>Standort: </td><td>${haus.standort}</td></tr>
				<tr><td>Angebotsende: </td><td>${haus.datum}</td></tr>
				<tr><td>Aktuelles Gebot: </td><td>${haus.startgebot} €</td></tr>
				<tr><td colspan="2" class="detailbutton"><Button type="submit" name="detailid" value="${haus.id}">Details ansehen</Button></td></tr>
				<tr><td></td>
				</table>
				<br>				
			</c:forEach>
		</form>
		</td>
		</tr>
		</table>
	</c:if>
</main>

<%
	if (session.getAttribute("GebotZuNiedrig") != null) {
		session.removeAttribute("GebotZuNiedrig");
	}
	if (session.getAttribute("GebotIstOk") != null) {
		session.removeAttribute("GebotIstOk");
	}
%>
	
<%@ include file="../jspf/footer.jspf"%>
</body>
</html>

