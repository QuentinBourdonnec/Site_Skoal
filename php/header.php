<!doctype html>
<html>
<head>
	<meta charset="UTF-8">
	<title>header</title>
	<link rel="shortcut icon" href="../img/logo.png">
	<link href="../css/header.css" rel="stylesheet" type="text/css">
	<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
</head>

<?php
	include "bdd.php";
	session_start();
	creationPanier();
	
	if(isset($_POST['logout']) && $_POST['logout'] = 1){
		$_SESSION['loginB'] = false;
	}
	if(isset($_POST['loginB'])){
		$_SESSION['loginB'] = array();
		$_SESSION['loginB'] = checkLogin($_POST['login'], $_POST['password']);
		//var_dump(checkLogin($_POST['login'], $_POST['password']));
	}
?>

<body>
	<div id="MenuDiv">
		<div class="col-md-5" id="nomSite" onClick="window.open('../php/page_principale.php','_parent')">
			<label id="labelSite ">Skoal</label>
		<?php
			if(isset($_SESSION['loginB']) && false != $_SESSION['loginB']){
				$result = GetFavori($_SESSION['loginB']['ID_CLIENT']);
				$nbFavoris = $result->num_rows;
				?>
					</div>
						<div class="col-md-<?php echo 3-$nbFavoris;?>" id="vide">
					</div>
					<div class="buttonMenu col-md-1" id="button6">
						<form action="catalogue.php" method="post" target="_parent" id="formCatalogue">
							<input type="hidden" value="1" name="filtre">
							<label class="labelButton" onClick="document.getElementById('formCatalogue').submit();">Catalogue</label>
						</form>
					</div>
				<?php	
				foreach($result as $theme){
					?>
					<div class="buttonMenu col-md-1">
						<form action="catalogue.php" method="post" target="_parent" id="form<?php echo $theme['NOM_THEME'];?>">
							<input name="SelectTheme" type="hidden" value="<?php echo $theme['ID_THEME'];?>">
							<input type="hidden" value="1" name="filtre">
							<label class="labelButton" onClick="document.getElementById('form<?php echo $theme['NOM_THEME'];?>').submit();"><?php echo $theme['NOM_THEME'];?></label>
						</form>
					</div>
					<?php
				}
			}
			else{
				?>
				</div>
				 	<div class="col-md-4" id="vide">
				</div>
				<div class="buttonMenu col-md-1"  id="button6">
					<form action="catalogue.php" method="post" target="_parent" id="formCatalogue">
						<input type="hidden" value="1" name="filtre">
						<label class="labelButton" onClick="document.getElementById('formCatalogue').submit();">Catalogue</label>
					</form>
				</div>
				<?php
			}
		?>
		<div class="col-md-1  buttonClient" id="button7">
			<form action="login.php" method="post" target="_parent" id="formUser">
				<label class="labelButton">
					<input type="hidden" name="logB" value="<?php if(isset($_SESSION['loginB']) && false != $_SESSION['loginB']){echo 1;}else{echo 0;}?>">
					<i class="fa fa-2x fa-user-circle-o" onClick="document.getElementById('formUser').submit();"></i>
				</label>
			</form>
		</div>
		<?php
			if(isset($_SESSION['loginB']) && $_SESSION['loginB'] != false){
		?>
		<div class="col-md-1  buttonClient" id="button8">
			<form action="login.php" method="post" target="_parent" id="formLogout">
				<input type="hidden" value="1" name="logout">
				<label class="labelButton">
					<i class="fa  fa-2x fa-sign-out " onClick="document.getElementById('formLogout').submit();"></i>
				</label>
			</form>
		</div>
		<?php
			}
		?>
		<div class="col-md-1  buttonClient" id="button8">
			<form action="panier.php" method="post" target="_parent" id="formPanier">
				<input type="hidden" value="1" name="filtre">
				<input type="hidden" value="2" name="actionPanier">
				<label class="labelButton">
					<i class="fa  fa-2x fa-shopping-cart" onClick="document.getElementById('formPanier').submit();"></i>
				</label>
			</form>
		</div>
	</div>
</body>
</html>