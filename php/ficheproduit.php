<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Fiche produit</title>

<link href="../css/fiche_produit.css" rel="stylesheet" type="text/css">
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="../css/accueil.css" rel="stylesheet" type="text/css">
<script src="../js/global.js"></script>

</head>

<body>

<!-- On insère le header dans la page ficheproduit.php -->
<?php
	include "../php/header.php";
	if(!isset($_GET['idP'])){	
		$_GET['idP'] = 10;
		$_GET['V'] = 1;
	}
	$row = GetElement($_GET['idP'], "PRODUIT");
	
	if(isset($_POST['actionPanier'])){
		actionPanier();
	}
?>
<div id="fiche">
		<div class="col-md-7" id="fiche_titre">
			<!-- On récupère et on écrit le nom du produit sur lequel vient de cliquer l'utilisateur -->
			<h2><?php echo $row['NOM_PRODUIT']; ?></h2>
  		</div>
		<div id="fiche_des">
			<div class="col-md-7" id="des_texte">
			<!-- On récupère la description  et on écrit le nom du produit sur lequel vient de cliquer l'utilisateur -->
				<?php echo $row['DESCRIPTION']; ?>
			</div>
			<form method="post" target="_parent" id="formProduit" action=<?php echo "\"ficheproduit.php?idP=". $_GET['idP']."&V=".$_GET['V']."\""?>>
				<div class="col-md-7" id="des_quantite">
				
					<input type="button" value="-" onClick="Quantite(-1)">
					<label id="quantite">Quantite: 1</label>
					<input type="button" value="+" onClick="Quantite(1)">
					
					<label id="prix">Prix: <?php echo $row['PRIX_PRODUIT']; ?> €</label>
					
					<label>, Volume:</label>
					<select id="selectVolume" <?php echo "onChange='volumeChange()'";?>>
						<?php 
							$resultV = GetListeVolumeFor($row['NOM_PRODUIT']);
							while($volume = $resultV->fetch_assoc()){
								echo "<option ".ifGetSetSelect($volume['VOLUME'],"V").">".$volume['VOLUME']." L</option>";
							}
						?>
					</select><br>
					
					<span class="fa-stack fa-2x">
						<i id="fa_panier1" class="fa fa-circle fa-stack-2x fa_panier"></i>
						<i id="fa_panier2" class="fa fa-cart-plus fa-stack-1x fa_panier" onClick="document.getElementById('formProduit').submit();"></i>
					</span>
					
					<input type="hidden" name="actionPanier" value="1">
					<input type="hidden" id="prixH" name="prix" value= <?php echo '"'.$row['PRIX_PRODUIT'].'"'; ?>>
					<input type="hidden" id="quantiteH" name="quantite" value="1">
					<input type="hidden" name="id" value=<?php echo $row['ID_PRODUIT'];?>>
					<input type="hidden" id="stock" value=<?php echo $row['STOCK'];?>>
					<?php //creation de champs cachés où sont stockés les associations id produit, volume
						$resultIn = GetProduitWNom($row['NOM_PRODUIT']);
						while($rowIn = $resultIn->fetch_assoc()){	
							echo "<input type='hidden' value='".$rowIn['ID_PRODUIT']."' id='V".$rowIn['VOLUME']."'>";
						}
					?>
			  </div>
			</form>
		</div>
	<img src= <?php echo GeneratePathImg($row['ID_PRODUIT']); ?> id="fiche_img">
  </div>
  
	<div class="hSection">
		<h3 class="h3Categorie">Articles Similaire :</h3>
		<hr class="hrO">
		<div class="trio">
			<?php
				$tableSimilaire = GenerateSimilaire($row['ID_THEME'], $row['ID_PRODUIT'], 4);
				while($row = $tableSimilaire->fetch_assoc()) {
					$minVolume = GetListeMinVolumePrixFor($row['NOM_PRODUIT'])->fetch_assoc();
					echo "<div class='divTrio'><label>".$row['NOM_PRODUIT']. ", &agrave; partir de ".$minVolume['PRIX_PRODUIT']. " €</label><br><img class='imgTrio' src=" . GeneratePathImg($row['ID_PRODUIT']) . " alt='". $row['NOM_PRODUIT'] ."' onClick=\"window.open('ficheproduit.php?idP=" . GetMinVolumeFor($row['NOM_PRODUIT']) . "&V=" . $minVolume['VOLUME'] . "','_parent');\"/></div>";
				}
			?>
		</div>
	</div>
<!-- On insère le header dans la page ficheproduit.php -->
<?php
	include "../html/footer.html";
	$conn->close();
?>
</body>
</html>
