<!DOCTYPE html>
<html>
<head>
	<title>Inscription</title>
	<link href="../css/inscription.css" rel="stylesheet" type="text/css">

	<meta charset="UTF-8">
</head>
<body>
<?php
	include "header.php";
?>

<h3 class="h2Categorie">Mon compte :</h3>
<form method="post" target="_parent" id="formInscription" action="profil.php">
	<div id="personnelle">
		<h2>Info Personnelle :</h2> 
		<label>Civilité :</label>
		<select name="civ" required>
			<option value=""></option> 
			<option value="1">Monsieur</option> 
			<option value="0">Madame</option>
		</select></br><br>

		<label class="Nom">Nom :</label>
		<input type="text" name="nom" required placeholder="dupont"><br><br>

		<label class="prenom">Prénom :</label>
		<input type="text" name="prenom" required placeholder="henry"><br><br>


		<label>Date de naissance :</label>
		<input type="date" name="naissance"></br>
	</div>
	<div id="donnee">
		<h2>Coordonées :</h2>
		<label class="rue">Numero et nom de rue :</label>
		<input type="text" name="rue" required placeholder="6 rue xxxxxx"><br><br>

		<label class="cp">Code postal :</label>
		<input type="text" name="cp" required placeholder="44000"><br><br>

		<label class="ville">Ville :</label>
		<input type="text" name="ville" required placeholder="Nantes"><br><br>

		<label>Pays :</label>
		<select name="pays" required>
			<option value="France" selected>France</option> 
			<option value="Belgique">Belgique</option> 
			<option value="Luxembourg">Luxembourg</option>
		</select></br>
	</div>
  	
  	<input type="hidden" value="<?php echo $_POST['password'];?>" name="password">
  	<input type="hidden" value="<?php echo $_POST['login'];?>" name="login">
   	<input type="hidden" value="1" name="creationCompte">
    <div id="submit">
    <input type="hidden" name="logB" value="<?php if(isset($_SESSION['loginB']) && false != $_SESSION['loginB']){echo 1;}else{echo 0;}?>">
    <input type="submit">
    </div>
</form>
<?php
	include "../html/footer.html";
	$conn->close();
?>
</body>
</html>


