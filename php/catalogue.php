<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Catalogue</title>


<script src="../js/global.js" language="javascript"></script>
<link href="../css/catalogue.css" rel="stylesheet" type="text/css">
</head>

<body>
	<!-- On insère le header dans la page catalogue.php -->
	<?php
		include "../php/header.php";
	?>
	<div id="espace ">
		<form method="post" action="catalogue.php" class="formFiltre">
			<label>Theme</label>
			<select name='SelectTheme' id="SelectTheme">
				<!-- Liste des différents thèmes présents (vodka, biere..) pour que le client puisse filtrer sa selection -->
				<?php
					if(!isset($_GET['IdT'])){
						echo "<option value=''></option>";
					}
					$result = GetListeTheme();
					$row = $result->fetch_assoc();
					do{
						echo "<option value='".$row['ID_THEME']."' ".ifPostSetSelect($row['ID_THEME'], 'SelectTheme')." >".$row['NOM_THEME']."</option>";
					}while($row = $result->fetch_assoc());
				?>
			</select>
			<label>Volume</label>
			<select name='SelectVolume' id="SelectVolume">
			<!-- Liste des différents thèmes volumes de bouteille (0.7l, 1l ou 1,5l) pour que le client puisse filtrer sa selection -->
			<?php
					if(!isset($_GET['Vl'])){
						echo "<option value=''></option>";
					}
					$result = GetListeVolume();
					$row = $result->fetch_assoc();
					do{
						echo "<option value='".$row['VOLUME']."' ".ifPostSetSelect($row['VOLUME'], SelectVolume)." >".$row['VOLUME']." L"."</option>";
					}while($row = $result->fetch_assoc());
				?>
			</select>
			<label>Degre : </label>
			<!-- Fitrage de recherche en fonction du nombre de degré d'alcool que souhaite le client, il peut y mettre un minimum, un maximum ou les deux -->
			<?php
				$row = GetMinMaxDegre();
				echo"<label class='minmax'>min</label>\n<input name='MinD' id='inputFiltre' type='number' size='2' step='1' min='".$row['MIN']."'max='".$row['MAX']."'".ifPostSetValue('MinD').">";
				echo"<label class='minmax'>max</label>\n<input name='MaxD' id='inputFiltre' type='number' size='2' step='1' min='".$row['MIN']."'max='".$row['MAX']."'".ifPostSetValue('MaxD').">";
			?>
			<label>Prix : </label>
			<!-- Fitrage de recherche en fonction du prix que souhaite mettre le client, il peut choisir un minimum, un maximum ou les deux -->
			<?php
				$row = GetMinMaxPrix();
				echo"<label class='minmax'>min</label>\n<input name='MinP' id='inputFiltre' type='number' size='3' step='1' min='".$row['MIN']."'max='".$row['MAX']."' ".ifPostSetValue('MinP').">";
				echo"<label class='minmax'>max</label>\n<input name='MaxP' id='inputFiltre' type='number' size='3' step='1' min='".$row['MIN']."' max='".$row['MAX']."'".ifPostSetValue('MaxP').">";
			?>
			
      		<input type="hidden" value="1" name="filtre">
	      	<input type="submit" name="submit" id="submit" value="Valider">
		</form>
		
		<div class="trio">
		<?php
			if(isset($_POST['filtre'])){
				checkPostFiltre();
				$result = GenerateFiltre();
				echo "<label>".$result->num_rows." resultat(s)</label><br>";
				if($result->num_rows == 0){
					echo "<h2>Désolé, nous n'avons aucun produit de ce type :/</h2>";
				}
				else{
					$row = $result->fetch_assoc();
					do{
						$minVolume = GetListeMinVolumePrixFor($row['NOM_PRODUIT'])->fetch_assoc();
						?>
						<div class='divTrio'>
							<label><?php echo $row['NOM_PRODUIT'];?>, &agrave; partir de <?php echo $minVolume['PRIX_PRODUIT'];?> €</label><br>
							<img class='imgTrio' src=<?php echo GeneratePathImg($row['ID_PRODUIT'])." alt='".$row['NOM_PRODUIT']."'";?> onClick="window.open('ficheproduit.php?idP=<?php echo GetMinVolumeFor($row['NOM_PRODUIT']) . '&V=' . $minVolume['VOLUME'];?>','_parent');"/>
						</div>
						<?php
					}while($row = $result->fetch_assoc());
				}
			}
		?>
		</div>
	</div>
		<!-- On insère le footer dans la page catalogue.php -->
	<?php
		include "../html/footer.html";
		$conn->close();
	?>
</body>
</html>

