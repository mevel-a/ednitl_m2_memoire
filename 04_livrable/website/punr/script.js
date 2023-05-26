function initialise{
	autonavh3();
	autonavh4();
	/*gère la création de h4*/
	autonavA();
	/*gère la création d'un menu en fonction de l'argumentaire d'ARG*/
}


function autonavh3(){
	var h3=document.getElementsByTagName('h3');
	var nav=document.getElementById('articlenav');
	for (var h3s of h3){
		let att=document.createAttribute('href');
		att.value=h3s.getAttribute('id');
		att.value='#'+att.value;


		let li=document.createElement('li');
		let a =document.createElement('a');
		a.setAttributeNode(att);
		let texth3s=document.createTextNode(h3s.innerHTML);

		a.appendChild(texth3s);
		li.appendChild(a);
		nav.appendChild(li);
	}
}

function clickedOn(){
	// récupère le clique sur x
	// identifie la nature du truc sur lequel on a cliqué:
		// extrait cité
		// œuvre citée
	// attribue le script en suivant en passant les paramètres
// A PRIORI inutile, 
}



// LES TEST SONT EFFECTUES SUR pr_02_01 
function displayExtract(corresp){
	// 
	let toHide=document.getElementsByClassName('extractDisplay');
	for (let toHides of toHide){
		toHides.setAttribute('class','extractHide');
	}
	let toDisplay=document.getElementById(corresp);
	toDisplay.setAttribute('class','extractDisplay');
}