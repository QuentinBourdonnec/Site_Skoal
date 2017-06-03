<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Panier</title>

<link href="../css/panier.css" rel="stylesheet" type="text/css">
</head>
<?php
	include "header.php";
?>
<body>
<br>
<div id="dep">
<?php
	if(isset($_POST['actionPanier']) && $_POST['actionPanier'] != 4){
?>
	
		<table class='tablePanier'>
			<tr>
				<th class='titreTable' colspan='2'>Produit</th>
				<th class='titreTable' >Volume</th>
				<th class='titreTable' >Quantite</th>
				<th class='titreTable'>Prix Unitaire</th>
				<th class='titreTable'>Prix Total</th>
				<th class='titreTable trashTable'></th>
			</tr>
		<?php
			actionPanier();
	}
	else{
		?>
		<h1>Merci pour cette achat !</h1>
	<?php
		actionPanier();
	}
	?>
	</div>
</body>
</html>
<?php
	include "../html/footer.html";
	$conn->close();
?>