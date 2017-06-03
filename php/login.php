<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Page de connexion</title>
<link href="../css/login.css" rel="stylesheet" type="text/css">
</head>


<?php
	/*if(isset($_POST['logout']) && $_POST['logout'] = 1){
		echo "<h1>Vous etes maintenant deconnecte</h1>";
	}*/

	//var_dump($_POST);
	if(!isset($_POST['loginB']) && (!isset($_POST['logB']) || (isset($_POST['logB']) &&$_POST['logB'] == 0))){
		include "header.php";
		?>
		<body id="bodyLogin">
		<div class="divLogin">
		  <h2>Connectez vous</h2>
			<form action=<?php if(isset($_POST['loginPanier'])){echo "'panier.php'";}else{echo "'login.php'";}?> method="post" target="_parent">
				<?php if(isset($_POST['loginPanier'])){echo "<input type='hidden' value='4' name='actionPanier'>";}?>
			  <label class="labelLogin">Login :</label>
				<input name="login" type="text" required="required" class="inputLogin"><br>
				<label class="labelLogin">Password :</label>
				<input name="password" type="password" required="required" class="inputLogin"><br>
				<input type="hidden" value="true" name="loginB">
				<input type="submit">
			</form>
		</div>

		<div class="divLogin" id="divCreation">
		  <h2>Vous êtes nouveau client ?</h2>
			<form action="inscription.php" method="post" target="_parent">
				<label class="mail">Email :</label>
				<input name="email" type="text" placeholder="exemple@mail.fr" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" required data-validation-required-message="Saisissez votre adresse Email."size="40"><br>
				<label class="labelLogin">Login :</label>
				<input type="text" name="login" class="inputLogin" required placeholder="Minimum 6 caractères"><br>

				<label class="labelLogin">Password :</label>
				<input type="password" name="password" class="inputLogin" required ><br>



				<button type="submit"  value="envoyer">Créer un compte</button>	
				<input type="hidden" name="logB" value="<?php if(isset($_SESSION['loginB']) && false != $_SESSION['loginB']){echo 1;}else{echo 0;}?>">
			</form>
		</div>
        <?php
		include "../html/footer.html";
		$conn->close();
	}
	else{
		include "profil.php";
	}
?>
	</body>
	</html>
		
