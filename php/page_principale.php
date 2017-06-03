<!DOCTYPE html>
<html>
<head>
	<title>Page d'accueil</title>
	<meta charset="UTF-8">
	<link href="../css/accueil.css" rel="stylesheet" type="text/css">
	<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="../font-awesome/css/font-awesome.min.css">
	<script src="../js/global.js"></script>

		
</head>

<body class="body">
	<?php
		include "../php/header.php";
	?>
	<div id="fleche">
		<i class="fa fa-5x fa-arrow-circle-o-left flecheC" id="flecheCL" onClick="switchImg(-1)"></i>
		<i class="fa fa-5x fa-arrow-circle-o-right flecheC" id="flecheCR" onClick="switchImg(1)"></i>	
		<img id="carrousel" src="../img/Accueil/1.jpg" alt="images_qui_defilent">
	</div>
	
	<hr>
	<h3 class="h2Categorie hSection">Nos Selections :</h3>
	<div class=" hSection">
		<h3 class="h3Categorie">Les Nouveautes :</h3>
		<hr class="hrO">
		<div class="trio">
			<?php
				$tableNouveaute = GenerateNouveaute(4);
				while($row = $tableNouveaute->fetch_assoc()) {
					$minVolume = GetListeMinVolumePrixFor($row['NOM_PRODUIT'])->fetch_assoc();
					echo "<div class='divTrio'><label>".$row['NOM_PRODUIT'].", &agrave; partir de ".$minVolume['PRIX_PRODUIT']." €</label><br><img class='imgTrio' src=" . GeneratePathImg($row['ID_PRODUIT']) . " alt='". $row['NOM_PRODUIT'] . "' onClick=\"window.open('ficheproduit.php?idP=" . GetMinVolumeFor($row['NOM_PRODUIT']) . "&V=" . $minVolume['VOLUME'] . "','_parent');\"/></div>";
				}
			?>
		</div>
	</div>
	
	<div class="hSection">
		<h3 class="h3Categorie">Les Plus Vendus :</h3>
		<hr class="hrO">
		<div class="trio">
			<?php
				$tablePlusVendue = GeneratePlusVendue(4);
				while($row = $tablePlusVendue->fetch_assoc()) {
					$minVolume = GetListeMinVolumePrixFor($row['NOM_PRODUIT'])->fetch_assoc();
					echo "<div class='divTrio'><label>".$row['NOM_PRODUIT'].", &agrave; partir de ".$minVolume['PRIX_PRODUIT']." €</label><br><img class='imgTrio' src=" . GeneratePathImg($row['ID_PRODUIT']) . " alt='". $row['NOM_PRODUIT'] . "' onClick=\"window.open('ficheproduit.php?idP=" . GetMinVolumeFor($row['NOM_PRODUIT']) . "&V=" . $minVolume['VOLUME'] . "','_parent');\"/></div>";
				}
			?>
		</div>
	</div>

	<div class="hSection">
		<h3 class="h3Categorie">Notre Sélection Du Jour:</h3>
		<hr class="hrO">
		<div class="trio">
			<?php
				for($i = 0; $i<4; $i++){
					$row = GetElement(rand(1, GetNbProduit()), 'PRODUIT');
					$minVolume = GetListeMinVolumePrixFor($row['NOM_PRODUIT'])->fetch_assoc();
					echo "<div class='divTrio'><label>".$row['NOM_PRODUIT'].", &agrave; partir de ".$minVolume['PRIX_PRODUIT']." €</label><br><img class='imgTrio' src=" . GeneratePathImg($row['ID_PRODUIT']) . " alt='". $row['NOM_PRODUIT'] . "' onClick=\"window.open('ficheproduit.php?idP=" . GetMinVolumeFor($row['NOM_PRODUIT']) . "&V=" . $minVolume['VOLUME'] . "','_parent');\"/></div>";
				}
			?>
		</div>
	</div>
	<?php
		include "../html/footer.html";
		$conn->close();
	?>
</body>
</html>
