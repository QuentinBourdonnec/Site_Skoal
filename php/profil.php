<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Page profil</title>
<link rel="stylesheet" type="text/css" href="../css/profil.css">
</head>
<?php
	if(!isset($_POST['loginB']) && $_POST['logB'] != 1){
		include "login.php";

	}
	else{
		if(isset($_POST['loginB']) && $_POST['loginB'] == false){
			include "login.php";
		}
		else{
			include "header.php";
			
			if(isset($_POST['creationCompte'])){
				var_dump($_POST);
				InsertClient($_POST['nom'], $_POST['prenom'], $_POST['rue'], $_POST['naissance'], 0, $_POST['password'], $_POST['login'], $_POST['civ'], $_POST['ville'], $_POST['cp']);
			}
			
			if(isset($_POST['updateProfil'])){
				UpdateNewsLetter($_SESSION['loginB']['ID_CLIENT'], $_POST['updateProfil']);
			}
			//$prefere = UpdateFavoris($_SESSION['loginB']['ID_CLIENT']);
			//UpdateFavoris($_SESSION['loginB']['ID_CLIENT']);
			$client = GetClient($_SESSION['loginB']['ID_CLIENT']);
			$theme = GetListeTheme();
		?>
		<body id="bodyProfil">
			<div>
				<div id="section0">
					<div id="photo">
						<img src="../img/ajout de photo.png" width="80%" title="ajouter une photo"/>
					</div>
					<div id="presentation">
					   <p id="taille">Bonjour <?php echo $client['PRENOM'];?></p>
					</div>
				</div>
				<div id="section1">
					<div id="section2">
						<div id="section4">
							<form action="login.php" method="post" target="_parent">
								<div id="abon">
									 <h2>Mes Favoris :</h2>
											<div id="interets">
											<?php
												foreach($theme as $themeButton){
													?>
													<input type='checkbox' name='<?php echo $themeButton['NOM_THEME'];?>' <?php echo RechercheFavoris($_SESSION['loginB']['ID_CLIENT'], $themeButton['NOM_THEME']);?>>
													<label><?php echo $themeButton['NOM_THEME'];?></label>
													<?php
												}
											?>
											</div>
								</div>
								<div id="news">
										<h2>NewsLetter</h2>
										<input name="updateProfil" type="checkbox" <?php if($client['NEWSLETTER']){echo 'checked="checked"';}?>>
										<label>Je souhaite m'abonner &agrave; la NewsLetter.</label>
								</div>
								<input type="submit" id="submitProfil">
								<input type="hidden" name="logB" value="<?php if(isset($_SESSION['loginB']) && false != $_SESSION['loginB']){echo 1;}else{echo 0;}?>">
							</form>
						</div>
						<div id="fav">
							<h2>Suggestions :</h2>
							<?php
								for($i = 0; $i<3; $i++){
									$row = GetElement(rand(1, GetNbProduit()), 'PRODUIT');
									$minVolume = GetListeMinVolumePrixFor($row['NOM_PRODUIT'])->fetch_assoc();
									echo "<div class='divTrio'><label>".$row['NOM_PRODUIT']."</label><br><img class='imgTrio' src=" . GeneratePathImg($row['ID_PRODUIT']) . " alt='". $row['NOM_PRODUIT'] . "' onClick=\"window.open('ficheproduit.php?idP=" . GetMinVolumeFor($row['NOM_PRODUIT']) . "&V=" . $minVolume['VOLUME'] . "','_parent');\"/></div>";
								}
							?>
						</div>

					</div>
					<div id="section3">
                    <h2>Historique d'achat :</h2>
							<?php 
								$commande = GetListeCommande($client['ID_CLIENT']);
								if($commande->num_rows > 0){
									foreach($commande as $com){
										AffichageSmallCommande($client['ID_CLIENT'], $com['ID_COMMANDE']);
									}
								}
								else{
									echo "<h2>aucun element a afficher</h2>";
								}
							?>
                    </div>
                    </div>
                    </div>
                     <?php
				include "../html/footer.html";
				$conn->close();
			}
		}
?>       
		</body>
		</html>
       
			