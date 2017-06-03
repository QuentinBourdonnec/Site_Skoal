<!DOCTYPE html>
<html>
<head>
	<title>Reception de mail de contact</title>
	<meta charset="UTF-8">
</head>
<body>

<?php

if (isset($_POST['name']) && isset($_POST['email']) && isset($_POST['message'])) 
{
	echo "Vous avez reçu un nouveau message à partir du formulaire de contact de votre site Web.<br><br>Voici les details :<br><br>";
	echo 'Nom : '.$_POST['name']."<br>";
	echo 'Email: '.$_POST['email']."<br>";
	echo  'Message : '.$_POST['message'];
}

?>

</body>
</html>
