//Fonction de la fiche produit qui permet d'agmenter la quantité de bouteille que désir le client, et qui fait également augmenter le prix
function Quantite(type){
	var quantite = Math.floor(document.getElementById('quantiteH').getAttribute('value'));
	var stock = Math.floor(document.getElementById('stock').getAttribute('value'));
	if(quantite + type >= 1 && quantite + type <= stock){
		quantite += type;
		document.getElementById('quantite').removeChild(document.getElementById('quantite').childNodes[0]);
		document.getElementById('quantite').appendChild(document.createTextNode("Quantite: " + quantite.toString()));
		document.getElementById('quantiteH').setAttribute('value', quantite);

		var prix = Math.floor(document.getElementById('prixH').getAttribute('value'));
		document.getElementById('prix').removeChild(document.getElementById('prix').childNodes[0]);
		document.getElementById('prix').appendChild(document.createTextNode("Prix: " + (quantite * prix).toString() + " €"));
	}
}

//Vérifie l'âge de la personne sur notre toute première page du site (Mindex.html) pour vérifier que l'utilisateur est majeur pour pouvoir naviguer sur le site
function CheckAge(){
	var date = document.getElementById('date').value;
	if(date <= 2017 - 18 && date != ""){
		return true;
	}
	else{
		document.getElementById('date').style.borderColor = "red";
		document.getElementById('date').style.color = "red";
		return false;
	}
}

//Cette fonction sert à gérer le caroussel de notre page d'accueil, ici il y a 8 photos différentes qui diffilent de gauche à droite ou inversement suivant sur quelle flèche l'utilisateur appuie
function Boucle(num){
	var nbMax = 8;
	if(num > nbMax){
		num = 1;
	}
	if(num<1){
		num = nbMax;
	}
	console.log(num);
	return num.toString();
}

//Cela gère les 2 flèche du caroussel suivant si le client appui sur la flèche de gauche ou celle de droite
function switchImg(type){
	var src = document.getElementById('carrousel').src;
	var num = src.split('/');
	num = Math.floor((num[num.length-1]).split('.')[0]);
	console.log(num);
	document.getElementById('carrousel').src = "../img/Accueil/" + Boucle(num + type) + ".jpg";
}

//Affiche les différents volumes possible pour les bouteilles sur la fiche produit
function volumeChange(){
	var volume = (document.getElementById('selectVolume').value).split(" ")[0];
	var Id = document.getElementById("V"+volume.toString()).value;
	window.open("ficheproduit.php?idP="+Id+"&V="+volume.toString(), "_parent");
}
// JavaScript Document