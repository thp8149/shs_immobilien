<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="html_hintergrund">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/verkaufen.css">
<title>Verkaufen</title>
</head>
<body>
	<header>
	<p class="willkommen"></p>
	</header>
	<main>
		<h2>Ihre Verkaufseingaben:</h2>
		<br>
		<b>Haustyp:</b>${vform.haustyp} <br>
		<b>Bautyp: </b>${vform.bautyp} <br>
		<b>Titel: </b>${vform.titel} <br>
		<b>Baujahr: </b>${vform.baujahr} <br>
		<b>Wohnfläche:</b>${vform.wohnflaeche} <br>
		<b>Grundstücksfläche: </b>${vform.grundstuecksflaeche} <br>
		<b>Standort: </b>${vform.standort} <br>
		<b>Startgebot: </b>${vform.startgebot} <br>
		<b>Beschreibung: </b>${vform.beschreibung} <br>
		<b>Dateiname: </b>${vform.dateiname} <br>

	</main>




</body>
</html>