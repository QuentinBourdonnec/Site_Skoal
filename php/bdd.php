<?php 
error_reporting(E_ALL);
 ?>

<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "DB-ProjetPHP";

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
   die("Connection failed: " . $conn->connect_error);
   echo "Failed";
}

/**********************/
/*Fonction INSERT INTO*/
/**********************/

function InsertClient($Nom, $Prenom, $Adresse, $Date, $News, $Password, $Login, $Civ, $Ville, $CP){
	$sql = "INSERT INTO CLIENT(`NOM_CLIENT`, `PRENOM`, `DATE_DE_NAISSANCE`, `ADRESSE`, `NEWSLETTER`, `PASSWORD`, `LOGIN`, `CIVILITE`, `VILLE`, `CODE_POSTAL`) VALUES ('".$Nom."','".$Prenom."','".$Date."','".$Adresse."','".$News."','".$Password."','".$Login."',".$Civ.",'".$Ville."',".$CP.")";
	global $conn;
	$conn->query($sql);
	
 }

function InsertTheme($Nom){
  	$sql = "INSERT INTO THEME (NOM_THEME) VALUES('" . $Nom . "')";
  	global $conn;
	$conn->query($sql);
}

function InsertProduit($Theme, $Nom, $Prix, $Stock, $Degre, $Volume, $Description){
  	$sql = "INSERT INTO PRODUIT (ID_THEME, NOM_PRODUIT, PRIX_PRODUIT, STOCK, DEGRE, VOLUME, DESCRITION) VALUES('" . $Theme . "','" . $Nom . "','" . $Prix . "','" . $Stock . "','" . $Degre . "','" . $Volume . "','" . $Description . "')";
  	global $conn;
	$conn->query($sql);
}

function InsertQuoi($Commande, $Produit, $Quantite){
  	$sql = "INSERT INTO QUOI (ID_COMMANDE, ID_PRODUIT, QUANTITE) VALUES('" . $Commande . "','" . $Produit . "','" . $Quantite . "')";
  	global $conn;	
	$conn->query($sql);
}

function InsertPrefere($Theme, $Client){
  	$sql = "INSERT INTO PREFERE (ID_THEME, ID_CLIENT) VALUES('" . $Theme . "','" . $Client . "')";
 	global $conn;
	$conn->query($sql);
}

function InsertCommande($Client, $Date){
  	$sql = "INSERT INTO COMMANDE (ID_CLIENT, DATE) VALUES('" . $Client . "','" . $Date . "')";
	global $conn;
	$conn->query($sql);
}

/*****************/
/*Fonction DELETE*/
/*****************/

function DeleteClient($Id_client){
	DeletePrefere($Id_client);
	DeleteCommande($Id_client);
	$sql = "DELETE FROM CLIENT WHERE id='". $Id_client ."'" ;
	global $conn;
	$conn->query($sql);
}

function DeleteTheme($Id_theme){
	DeletePrefere($Id_theme);
	$sql = "DELETE FROM THEME WHERE id='". $Id_theme ."'" ;
	global $conn;
  	$conn->query($sql);
}

function DeleteProduit($Id){
  	DeleteQuoi($Id);
  	$sql = "DELETE FROM PRODUIT WHERE id='". $Id ."'" ;
	global $conn;
  	$conn->query($sql);
}

function DeleteQuoi($Id){
	$sql = "DELETE FROM QUOI WHERE id='". $Id ."'" ;
	global $conn;
  	$conn->query($sql);
}

function DeletePrefere($Id_client){
	$sql = "DELETE FROM PREFERE WHERE id='". $Id_client ."'" ;
	global $conn;
	$conn->query($sql);
}

function DeleteCommande($Id_commande){
	DeleteQuoi($Id_commande);
	$sql = "DELETE FROM COMMANDE WHERE id='". $Id_commande ."'" ;
	global $conn;
  	$conn->query($sql);
}


/*****************/
/*Update Table*/
/*****************/

function UpdateNewsLetter($IdC, $Abo){
	if($Abo == "on"){
		$Abo = 1;
	}
	else{
		$Abo = 0;
	}
	$sql = "UPDATE CLIENT SET NEWSLETTER = ".$Abo." WHERE ID_CLIENT =".$IdC;
	//echo $sql;
	global $conn;
  	$conn->query($sql);
	
}

function UpdateFavoris($IdC){
	$theme = GetListeTheme();
	foreach($theme as $tmp){
		if($_POST[$tmp['NOM_THEME']] = 'on' && RechercheFavoris($IdC, $tmp['NOM_THEME']) == ""){
			InsertPrefere($tmp['ID_THEME'], $IdC);
		}
	}
}

function RechercheFavoris($IdC, $NomT){
	$sql = "SELECT DISTINCT THEME.ID_THEME FROM THEME, PREFERE WHERE ID_CLIENT = ".$IdC." AND THEME.ID_THEME = PREFERE.ID_THEME AND THEME.NOM_THEME = '".$NomT."'";
	global $conn;
  	$result = $conn->query($sql);
	if($result->num_rows > 0){
		return 'checked="checked"';
	}
	else{
		return "";
	}
} 
/*****************/
/*Affichage Table*/
/*****************/

function AffichageClient(){
  $sql = "SELECT * FROM CLIENT";
  global $conn;
  $result = $conn->query($sql);
  echo"<h4>Table Client</h4>";
  if ($result->num_rows > 0) {
     // output data of each row
    echo "<table><tr><th>ID</th> <th>Nom</th> <th>Prenom</th> <th>Date de naissance</th> <th>Adresse</th> <th>Newsletter</th> </tr>";
    while($row = $result->fetch_assoc()) {
        echo "<tr>\n\t<th>".$row["ID_CLIENT"]."</th>";
        echo "\t<th>".$row["NOM_CLIENT"]."</th>";
        echo "\t<th>".$row["PRENOM"]."</th>";
        echo "\t<th>".$row["DATE_DE_NAISSANCE"]."</th>";
        echo "\t<th>".$row["NEWSLETTER"]."</th>";
        echo "\t<th>".$row["ADRESSE"]."</th>";
    }
     echo"</table>";
     
  } else {
     echo "0 results";
  }
}

function AffichageCommande(){
  $sql = "SELECT * FROM COMMANDE";
  global $conn;
  $result = $conn->query($sql);
  echo"<h4>Table Commande</h4>";
  if ($result->num_rows > 0) {
     // output data of each row
    echo "<table><tr><th>ID Commande</th> <th>ID Client</th> <th>Date de commande</th> <th>Prix</th></tr>";
     while($row = $result->fetch_assoc()) {
        echo "<tr>\n\t<th>".$row["ID_CLIENT"]."</th>";
        echo "\t<th>".$row["ID_CLIENT"]."</th>";
        echo "\t<th>".$row["DATE"]."</th>";
        echo "\t<th>".$row["PRIX_COMMANDE"]."</th> </tr>";
    }  
     echo"</table>";
     
  } else {
     echo "0 results";
  }
}

function AffichageSmallCommande($IdClient, $IdCommande){
  	$sql = "SELECT DISTINCT NOM_PRODUIT, QUANTITE, QUANTITE*PRIX_PRODUIT AS PRIX_TOTAL FROM QUOI, PRODUIT, COMMANDE WHERE PRODUIT.ID_PRODUIT = QUOI.ID_PRODUIT AND QUOI.ID_COMMANDE = ".$IdCommande." AND COMMANDE.ID_CLIENT=".$IdClient;
  	global $conn;
  	$result = $conn->query($sql);
	$prixTotal = 0;
  	?>
 	<table class="table">
 		<tr>
			<th colspan="3">Commande du <?php //echo GetDateCommande($IdCommande);?>, numero : <?php echo $IdCommande;?></th>
	  	</tr>  
  		<tr class="bordure">
			<th class="espace ">Produit</th>
			<th class="espace ">Quantite</th>
			<th class="total espace">Prix Total</th>
	  	</tr>  
  	<?php
	foreach($result as $produit){
	?>
		<tr>
			<td class="espace"><?php echo $produit['NOM_PRODUIT'];?></td>
			<td class="espace"><?php echo $produit['QUANTITE'];?></td>
			<td class="total espace"><?php echo $produit['PRIX_TOTAL'];?></td>
	  	</tr>  
	<?php
		$prixTotal += $produit['PRIX_TOTAL'];
	}
	?>
		<tr>
			<td class="total " colspan="3">Prix Total : <?php echo $prixTotal;?> &euro;</td>
		</tr>
	</table>
	<?php
}

function AffichageTheme(){
  $sql = "SELECT * FROM THEME";
  global $conn;
  $result = $conn->query($sql);
  echo"<h4>Table Theme</h4>";
  if ($result->num_rows > 0) {
     // output data of each row
    echo "<table><tr><th>ID</th> <th>Nom</th></tr>";
     while($row = $result->fetch_assoc()) {
        echo "<tr>\n\t<th>".$row["ID_THEME"]."</th>";
        echo "\t<th>".$row["NOM_THEME"]."</th> </tr>";
      }
     echo"</table>";
     
  } else {
     echo "0 results";
  }
}

function AffichageProduit(){
  $sql = "SELECT * FROM PRODUIT;";
  global $conn;
  $result = $conn->query($sql);
  echo"<h4>Table Produit</h4>";
  if ($result->num_rows > 0) {
     // output data of each row
    echo "<table><tr><th>ID Produit</th> <th>ID Theme</th> <th>Nom</th> <th>Prix</th> <th>Stock</th> <th>Degre</th> <th>Volume</th> <th>Description</th></tr>\n";
     while($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "\t<th>".$row["ID_PRODUIT"]."</th>";
        echo "\t<th>".$row["ID_THEME"]."</th>";
        echo "\t<th>".$row["NOM_PRODUIT"]."</th>";
        echo "\t<th>".$row["PRIX_PRODUIT"]."</th>";
        echo "\t<th>".$row["STOCK"]."</th>";
        echo "\t<th>".$row["DEGRE"]."</th>";
        echo "\t<th>".$row["VOLUME"]."</th>";
        //echo "\t<th>".$row["DESCRIPTION"]."</th>";
        echo "</tr>";
      }
     echo"</table>";
     
  } else {
     echo "0 results";
  }
}

function AffichageQuoi(){
  $sql = "SELECT * FROM QUOI";
  global $conn;
  $result = $conn->query($sql);
  echo"<h4>Table Quoi</h4>";
  if ($result->num_rows > 0) {
     // output data of each row
    echo "<table><tr><th>ID Commande</th> <th>ID Produit</th> <th>QUantite</th></tr>";
     while($row = $result->fetch_assoc()) {
        echo "<tr>\n\t<th>".$row["ID_COMMANDE"]."</th>";
        echo "\t<th>".$row["ID_PRODUIT"]."</th>";
        echo "\t<th>".$row["QUANTITE"]."</th> </tr>";
    }
    echo"</table>";
     
  } else {
     echo "0 results";
  }
}

function AffichagePrefere(){
  $sql = "SELECT * FROM PREFERE";
  global $conn;
  $result = $conn->query($sql);
  echo"<h4>Table Prefere</h4>";
  if ($result->num_rows > 0) {
     // output data of each row
    echo "<table><tr><th>ID Theme</th> <th>ID Client</th></tr>";
     while($row = $result->fetch_assoc()) {
        echo "<tr>\n\t<th>".$row["ID_THEME"]."</th>";
        echo "\t<th>".$row["ID_CLIENT"]."</th> </tr>";
    }
    echo"</table>";
     
  } else {
     echo "0 results";
  }
}

function AffichageDataBase(){

  AffichagePrefere();
  AffichageQuoi();
  AffichageProduit();
  AffichageTheme();
  AffichageCommande();
  AffichageClient();
}

/*******************************/
/*Get & Display Element / Table*/
/*******************************/

function GetDateCommande($IdC){
	$sql = "SELECT DATE FROM COMMANDE WHERE ID_COMMANDE = ".$IdC ." ORDER BY ID_COMMANDE DESC";
	global $conn;
	$result = $conn->query($sql);
	echo $result['DATE'];
	$result->fetch_assoc();
	
	return $result['DATE'];
}

function GetClient($IdC){
	$sql = "SELECT * FROM CLIENT WHERE ID_CLIENT = ".$IdC;
	global $conn;
	$result = $conn->query($sql);
	return $result->fetch_assoc();
}

function GetMinVolumeFor($nom){
	$sql = "SELECT DISTINCT VOLUME, ID_PRODUIT FROM PRODUIT WHERE NOM_PRODUIT = '".$nom."' ORDER BY VOLUME ASC LIMIT 1";
	global $conn;
	$result = $conn->query($sql);
	$result = $result->fetch_assoc();
	return $result['ID_PRODUIT'];
}

function GetNbProduit(){
	$sql = "SELECT COUNT(ID_PRODUIT) AS NB_PRODUIT FROM PRODUIT" ;
  	global $conn;
	$result = $conn->query($sql);
	$result = $result->fetch_assoc();
	return $result['NB_PRODUIT'];
}

function GetElement($Id, $Table){
  	$sql = "SELECT * FROM ".$Table." WHERE ID_".$Table." = ".$Id ;
  	global $conn;
	$result = $conn->query($sql);
	return $result->fetch_assoc();
}

function GetProduitTheme($IdTheme){
	$sql = "SELECT DISTINCT NOM_THEME FROM THEME WHERE ".$IdTheme." = THEME.ID_THEME";
	global $conn;
  	$result = $conn->query($sql);
  	$row = $result->fetch_assoc();
	return $row['NOM_THEME'];
}

//ne peut recuperer que les tables presentes nativement dans la base
function GetTable($Table){
	$sql = "SELECT * FROM ".$Table;
	global $conn;
  	$result = $conn->query($sql);
	return $result;
}

//ne peut afficher que les tables presentes nativement dans la base
function AffichageTable($Table){
	$result = GetTable($Table);
	$row = $result->fetch_assoc();
	echo "<table><tr>";
	foreach ($row as $key => $value) {
		echo "<th>".$key."</th>";
	}
	echo "</tr>";
	do{
		echo "<tr>";
		foreach ($row as $key => $value) {
			echo "<th>".$value."</th>";
		}
		echo "</tr>";
	}while($row = $result->fetch_assoc());
	echo "</table>";
}

//peut afficher n'importe qu'elle table, notamment les tables custom genere par une requete SQL
function AffichageCustomTable($Table){
	if($Table->num_rows > 0){
		$row = $Table->fetch_assoc();
		echo "<table><tr>";
		foreach ($row as $key => $value) {
			echo "<th>".$key."</th>";
		}
		echo "</tr>";
		do{
			echo "<tr>";
			foreach ($row as $key => $value) {
				echo "<th>".$value."</th>";
			}
			echo "</tr>";
		}while($row = $Table->fetch_assoc());
		echo "</table>";
	}
	else{
		echo "Aucun resultat";
	}
}

//ne peut recuperer que un element present dans une table native de la base
function AfficherElement($Id, $Table){
  $row = GetElement($Id, $Table);
  echo "<table><tr>";
  foreach ($row as $key => $value) {
    echo "<th>".$key."</th>";
  }
  echo "</tr><tr>";
  foreach ($row as $key => $value) {
    echo "<th>".$value."</th>";
  }
  echo "</tr></table>";
}

/****************/
/*Generate Path*/
/****************/

function GeneratePathImg($Id){
	$row = GetElement($Id, 'PRODUIT');
	return '"../img/'.GetProduitTheme($row['ID_THEME']) . "/".str_replace(" ","_",$row['NOM_PRODUIT']).'.jpg"';
}

/********************/
/*Generate Selection*/
/********************/

function GenerateNouveaute($Limit){
	$sql = "SELECT * FROM PRODUIT ORDER BY ID_PRODUIT DESC LIMIT ".$Limit ;
	global $conn;
  	$result = $conn->query($sql);
	return $result;
}

function GeneratePlusVendue($Limit){
	$sql = "SELECT NOM_PRODUIT, QUOI.ID_PRODUIT, SUM(QUANTITE) AS SOMME FROM QUOI, PRODUIT WHERE PRODUIT.ID_PRODUIT = QUOI.ID_PRODUIT GROUP BY ID_PRODUIT ORDER BY SOMME DESC LIMIT ".$Limit;
	global $conn;
  	$result = $conn->query($sql);
	return $result;
}

function GenerateSimilaire($IdT, $IdP, $Limit){
	$sql = "SELECT * FROM PRODUIT WHERE ID_THEME = '".$IdT."' AND ID_PRODUIT != '".$IdP."' LIMIT ".$Limit;
	global $conn;
  	$result = $conn->query($sql);
	return $result;
}

function GenerateFiltre(){
	checkPostFiltre();
	$sql = "SELECT DISTINCT NOM_PRODUIT, ID_PRODUIT, PRIX_PRODUIT, DEGRE, VOLUME FROM PRODUIT" .ifFiltrage().ifPostSet('SelectedTheme').ifPostSet('SelectedVolume').ifPostSet('Degre').ifPostSet('Prix');
	global $conn;
  	$result = $conn->query($sql);
	//echo "<br>".$sql."<br>";	
	return $result;
}

/****************/
/*Generate Liste*/
/****************/
function GetListeCommande($IdC){
	$sql = "SELECT ID_COMMANDE FROM COMMANDE WHERE ID_CLIENT = ".$IdC;
	global $conn;
	$result = $conn->query($sql);
	return $result;
}

function GetProduitWNom($nom){
	$sql = "SELECT ID_PRODUIT, VOLUME FROM PRODUIT WHERE NOM_PRODUIT = '".$nom."'";
	global $conn;
	$result = $conn->query($sql);
	return $result; 
}

function GetListeTheme(){
	$sql = "SELECT * FROM THEME";
	global $conn;
	$result = $conn->query($sql);
	return $result;
}

function GetListeProduitFromTheme($IdTheme){
	$sql = "SELECT DISTINCT NOM_PRODUIT, ID_PRODUIT FROM PRODUIT, THEME WHERE PRODUIT.ID_THEME = ".$IdTheme;
  	global $conn;
	$result = $conn->query($sql);
	return $result;
}

function GetListeVolume(){
	$sql = "SELECT DISTINCT VOLUME FROM PRODUIT ORDER BY VOLUME ASC";
	global $conn;
	$result = $conn->query($sql);
	return $result;
}

function GetListeVolumeFor($nom){
	$sql = "SELECT DISTINCT VOLUME, PRIX_PRODUIT, ID_PRODUIT FROM PRODUIT WHERE NOM_PRODUIT = '".$nom."' ORDER BY VOLUME ASC";
	global $conn;
	$result = $conn->query($sql);
	return $result;
}

function GetListeMinVolumePrixFor($nom){
	$sql = "SELECT PRIX_PRODUIT, VOLUME, ID_PRODUIT FROM PRODUIT WHERE NOM_PRODUIT = '".$nom."' ORDER BY VOLUME ASC LIMIT 1";
	global $conn;
	$result = $conn->query($sql);
	return $result;
}

function GetMinMaxDegre(){
	$sql = "SELECT MAX(DEGRE) AS MAX, MIN(DEGRE) AS MIN FROM PRODUIT";
  	global $conn;
	$result = $conn->query($sql);
	return $result->fetch_assoc();
}

function GetMinMaxPrix(){
	$sql = "SELECT MAX(PRIX_PRODUIT) AS MAX, MIN(PRIX_PRODUIT) AS MIN FROM PRODUIT";
	global $conn;
	$result = $conn->query($sql);
	return $result->fetch_assoc();
}

function GetFavori($IdC){
	$sql = "SELECT DISTINCT THEME.NOM_THEME, THEME.ID_THEME FROM CLIENT, THEME, PREFERE WHERE '".$IdC."' = PREFERE.ID_CLIENT AND PREFERE.ID_THEME = THEME.ID_THEME LIMIT 3";
	global $conn;
	$result = $conn->query($sql);
	return $result;
}

function GetCommande($IdC){
	$sql = "SELECT ID_COMMANDE FROM COMMANDE WHERE ID_CLIENT = '".$IdC."' ORDER BY DATE DESC LIMIT 1";
	global $conn;
	$result = $conn->query($sql);
	return $result->fetch_assoc();
}

/********/
/*Divers*/
/********/

function ifPostSetSelect($valeur, $nom){
  	if(isset($_POST[$nom])){
	  	if($valeur == $_POST[$nom]){
		  	return " selected";
		}
  	}
}

function ifGetSetSelect($valeur, $nom){
  	if(isset($_GET[$nom])){
	  	if($valeur == $_GET[$nom]){
		  	return " selected";
		}
  	}
}

function ifPostSetValue($nom){
	if(isset($_POST[$nom])){
		if("" != $_POST[$nom]){
			return "value='".$_POST[$nom]."'";
		}
	}
}

function ifFiltrage(){
	if("" != $_POST['SelectTheme'] || "" != $_POST['SelectVolume'] || "" != $_POST['MinD'] || "" != $_POST['MaxD'] || "" != $_POST['MinP'] || "" != $_POST['MaxP']){
		return " WHERE";
	}
}

function checkPostFiltre(){
	if(!isset($_POST['SelectTheme'])){
		$_POST['SelectTheme'] = "";
	}
	if(!isset($_POST['SelectVolume'])){
		$_POST['SelectVolume'] = "";
	}
	if(!isset($_POST['MinD'])){
		$_POST['MinD'] = "";
	}
	if(!isset($_POST['MaxD'])){
		$_POST['MaxD'] = "";
	}
	if(!isset($_POST['MaxP'])){
		$_POST['MaxP'] = "";
	}
	if(!isset($_POST['MinP'])){
		$_POST['MinP'] = "";
	}

}

function ifPostSet($nom){
	$requete = "";
	
	switch($nom){
		case "SelectedTheme":
			if("" != $_POST['SelectTheme']){
				return " ID_THEME=".$_POST['SelectTheme'];
			}
			break;
		case "SelectedVolume":
			if("" != $_POST['SelectVolume']){
				$requete = " VOLUME=".$_POST['SelectVolume'];
			}
			
			if("" != $_POST['SelectTheme'] && "" != $_POST['SelectVolume']){
				return " AND".$requete;
			}
			else{
				return $requete;
			}
			break;
		case "Degre":
			if("" != $_POST['MinD'] && "" == $_POST['MaxD']){// min !max
				$requete = " DEGRE >= ".$_POST['MinD'];
			}
			if("" == $_POST['MinD'] && "" != $_POST['MaxD']){// !min max
				$requete = " DEGRE <= ".$_POST['MaxD'];
			}
			if("" != $_POST['MinD'] && "" != $_POST['MaxD']){// min max
				$requete = " DEGRE BETWEEN ".min($_POST['MinD'], $_POST['MaxD'])." AND ".max($_POST['MinD'], $_POST['MaxD']);
			}
			if("" == $_POST['MinD'] && "" == $_POST['MaxD']){// !min !max
				$requete = NULL;
			}

			if(("" != $_POST['SelectTheme'] || "" != $_POST['SelectVolume']) && ("" != $_POST['MinD'] || "" != $_POST['MaxD'])){
				return " AND".$requete;
			}
			else{
				return $requete;
			}
			break;
		case "Prix":
			if("" != $_POST['MinP'] && "" == $_POST['MaxP']){// min !max
				$requete = " PRIX_PRODUIT >= ".$_POST['MinP'];
			}
			if("" == $_POST['MinP'] && "" != $_POST['MaxP']){// !min max
				$requete = " PRIX_PRODUIT <= ".$_POST['MaxP'];
			}
			if("" != $_POST['MinP'] && "" != $_POST['MaxP']){// min max
				$requete = " PRIX_PRODUIT BETWEEN ".min($_POST['MinP'], $_POST['MaxP'])." AND ".max($_POST['MinP'], $_POST['MaxP']);
			}
			if("" == $_POST['MinP'] && "" == $_POST['MaxP']){// !min !max
				$requete = NULL;
			}
			if(("" != $_POST['MinP'] || "" != $_POST['MaxP']) && ("" != $_POST['MinD'] || "" != $_POST['MaxD'] || "" != $_POST['SelectTheme'] || "" != $_POST['SelectVolume'])){
				return " AND".$requete;
			}
			else{
				return $requete;
			}
			break;
	}
}

function checkLogin($user, $mdp){
	$sql = "SELECT ID_CLIENT FROM CLIENT WHERE LOGIN = '".$user."' AND PASSWORD = '".$mdp."'";
	global $conn;
	$result = $conn->query($sql);
	if($result->num_rows > 0)
		return $result->fetch_assoc();
	else
		return false;
}

function isConnected(){
	if(isset($_SESSION['loginB']) && $_SESSION['loginB'] != false){
		return true;
	}
	else{
		return false;
	}
}
/********/
/*Panier*/
/********/

function creationPanier(){
   if (!isset($_SESSION['panier'])){
      $_SESSION['panier'] = array();
      $_SESSION['panier']['produit'] = array();
      $_SESSION['panier']['quantite'] = array();
      $_SESSION['panier']['prix'] = array();
   }
   return true;
}

function ajouterArticle($nomProduit,$quantiteProduit,$prix){

   //Si le panier existe
   if (creationPanier()){
      //Si le produit existe déjà on ajoute seulement la quantité
      $positionProduit = array_search($nomProduit,  $_SESSION['panier']['produit']);

      if ($positionProduit != false){
         $_SESSION['panier']['quantite'][$positionProduit] += $quantiteProduit ;
      }
      else{
         //Sinon on ajoute le produit
         array_push( $_SESSION['panier']['produit'],$nomProduit);
         array_push( $_SESSION['panier']['prix'],$prix);
		 array_push( $_SESSION['panier']['quantite'],$quantiteProduit);
      }
   }
   else{
   		echo "Un problème est survenu veuillez contacter l'administrateur du site.";
   }
}

function supprimerArticle($nomProduit){
   //Si le panier existe
   if (creationPanier()){
      //Nous allons passer par un panier temporaire
      $tmp=array();
      $tmp['produit'] = array();
      $tmp['quantite'] = array();
      $tmp['prix'] = array();

      for($i = 0; $i < count($_SESSION['panier']['produit']); $i++){
         if ($_SESSION['panier']['produit'][$i] != $nomProduit)
         {
            array_push( $tmp['produit'],$_SESSION['panier']['produit'][$i]);
            array_push( $tmp['quantite'],$_SESSION['panier']['quantite'][$i]);
            array_push( $tmp['prix'],$_SESSION['panier']['prix'][$i]);
         }

      }
      //On remplace le panier en session par notre panier temporaire à jour
      $_SESSION['panier'] =  $tmp;
      //On efface notre panier temporaire
      unset($tmp);
   }
   else{
   		echo "Un problème est survenu veuillez contacter l'administrateur du site.";
   }
}

function prixPanier(){
   $prix=0;
   for($i = 0; $i < count($_SESSION['panier']['produit']); $i++)
   {
      $prix += $_SESSION['panier']['quantite'][$i] * $_SESSION['panier']['prix'][$i];
   }
   return $prix;
}

function supprimePanier(){
   unset($_SESSION['panier']);
}

function affichagePanier(){
	if(isset($_SESSION['panier']['produit'][0])){
		
		$rang = 0;
		$nbArticle = 0;
		foreach($_SESSION['panier']['produit'] as $produit){
			$row = GetElement($produit, "PRODUIT");
			?>
				<tr>
					<th class='celluleTable'>
					  <img class='imgVignette' src=<?php echo GeneratePathImg($produit)." alt='". $row['NOM_PRODUIT'];?> onClick="window.open('ficheproduit.php?idP=<?php echo $produit . '&V=' . $row['VOLUME']; ?>','_parent');"/>
					</th>
					<th class='celluleTable'><?php echo $row['NOM_PRODUIT'];?></th>
					<th class='celluleTable'><?php echo $row['VOLUME'];?></th>
					<th class='celluleTable'><?php echo $_SESSION['panier']['quantite'][$rang];?></th>
					<th class='celluleTable'><?php echo $_SESSION['panier']['prix'][$rang];?></th>
					<th class='celluleTable'><?php echo $_SESSION['panier']['quantite'][$rang]* $_SESSION['panier']['prix'][$rang];?></th>
					<th class=' celluleTable trashTable'>
						<form action="panier.php" method="post" target="_parent" id="formDelete">
							<input type="hidden" value="3" name="actionPanier">
							<input type="hidden" value="<?php echo $row['ID_PRODUIT'];?>" name="idProduit">
							<i class='fa fa-trash-o fa-2x fa_trash' onClick="document.getElementById('formDelete').submit();"></i>
						</form>
				  </th>
				</tr>
		<?php
			$nbArticle += $_SESSION['panier']['quantite'][$rang];
			$rang++;
		}//fin foreach
		?>
			</table>
			<br>
			<table class='tableRecap'>
				<tr>
					<th class='titreTable' id='recap' colspan='3'>Récapitulatif</th>
				</tr>
				<tr>
					<td class='celluleTable'>Nombre d'article :</td>
					<td class='celluleTable'><?php echo $nbArticle;?></td>
					<td rowspan='2'>
						<form action=<?php if(isConnected()){echo "'panier.php'";}else{echo "'login.php'";}?> method="post" target="_parent" id="formPaiment">
							<input type="hidden" value="1" name="loginPanier">
							<input type="hidden" name="actionPanier" value="4">
							<span class='fa-stack fa-2x'>
								<i id='fa_panier1' class='fa fa-circle fa-stack-2x fa_panier'></i>
								<i id='fa_panier2' class='fa fa-credit-card fa-stack-1x fa_panier' onClick="document.getElementById('formPaiment').submit();"></i>
							</span>
						</form> 
					</td>
				</tr>
				<tr>
					<td class='celluleTable'>Prix Total :</td>
					<td class='celluleTable'><?php echo prixPanier();?> €</td>
				</tr>
			</table>
			<?php			
	}
	else{
		echo "<tr><td colspan='7'><h2 id='erreur'>Votre panier est vide</h2></td</tr></table>";
	}
}

function actionPanier(){
	if(isset($_POST['actionPanier'])){
		switch($_POST['actionPanier']){
			case 1://ajout panier
				ajouterArticle($_POST['id'], $_POST['quantite'], $_POST['prix']);
				break;
			case 3:
				supprimerArticle($_POST['idProduit']);
			case 2:
				//var_dump($_SESSION);
				affichagePanier();
				break;
			case 4:
				InsertCommande($_SESSION['loginB']['ID_CLIENT'], date('Y-m-d'));
				$IdCommande = GetCommande($_SESSION['loginB']['ID_CLIENT']);
				$rang = 0;
				foreach($_SESSION['panier']['produit'] as $produit){
					InsertQuoi($IdCommande['ID_COMMANDE'],$produit, $_SESSION['panier']['quantite'][$rang]);
				}
				supprimePanier();
				break;
		}
	}
	else{
		echo "<h1>J'ai un trou noir, que faite vous là? j'ai oublié...</h1>";
	}
}
?>