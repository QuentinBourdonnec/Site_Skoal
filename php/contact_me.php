<?php

//Ce code aurait servit pour une utilisation d'un renvoi de contenu du formulaire vers le mail du propriétaire du site

if(empty($_POST['name'])      ||
   empty($_POST['email'])     ||
   empty($_POST['message'])   ||
   !filter_var($_POST['email'],FILTER_VALIDATE_EMAIL))
   {
	   echo "No arguments Provided!";
	   return false;
   }
   
$name = strip_tags(htmlspecialchars($_POST['name']));
$email_address = strip_tags(htmlspecialchars($_POST['email']));
$message = strip_tags(htmlspecialchars($_POST['message']));
   

$to = 'nom.prenom@gmail.com'; //C'est ici que le propriétaire met son email pour recevoir les informations du formulaires du contact lorsque des clients veulent le joindre
$email_subject = "Website Contact Form:  $name";
$email_body = "Vous venez de recevoir un nouveau message du formulaire de contact de votre site web.\n\n"."Voici les détails du message:\n\nNom: $name\n\nEmail: $email_address\n\nMessage:\n$message";
$headers = "De: noreply@yourdomain.com\n"; 
$headers .= "Reply-To: $email_address";  
mail($to,$email_subject,$email_body,$headers);
 
if(mail($to,$email_subject,$email_body,$headers))
{
	echo 'Votre message a bien &eacute;t&eacute; envoy&eacute; ';
}
else
{
	echo "Votre message n'a pas pu 	&ecirc;tre envoy&eacute;";
}
return true;         
?>
