function initialise(){
	// dans l'idéal h3 et h4 ne sont lancés que si page=commentaire ou truc du genre


}


// function autonavh3(){
// 	var h3=document.getElementsByTagName('h3');
// 	var nav=document.getElementById('articlenav');
// 	for (var h3s of h3){
// 		let att=document.createAttribute('href');
// 		att.value=h3s.getAttribute('id');
// 		att.value='#'+att.value;


// 		let li=document.createElement('li');
// 		let a =document.createElement('a');
// 		a.setAttributeNode(att);
// 		let texth3s=document.createTextNode(h3s.innerHTML);

// 		a.appendChild(texth3s);
// 		li.appendChild(a);
// 		nav.appendChild(li);
// 	}
// }

// function autonavh4(){
// 	var h4=document.getElementsByTagName('h4');
// 	var nav=document.getElementById('articlenav');
// 	for (var h4s of h4){
// 		let att=document.createAttribute('href');
// 		att.value=h4s.getAttribute('id');
// 		att.value='#'+att.value;


// 		let li=document.createElement('li');
// 		let a =document.createElement('a');
// 		a.setAttributeNode(att);
// 		let texth4s=document.createTextNode(h4s.innerHTML);

// 		a.appendChild(texth4s);
// 		li.appendChild(a);
// 		nav.appendChild(li);
// 	}
// }


// function clickedOn(){
	// récupère le clique sur x
	// identifie la nature du truc sur lequel on a cliqué:
		// extrait cité
		// œuvre citée
	// attribue le script en suivant en passant les paramètres
// A PRIORI inutile, 
// }



// LES TEST SONT EFFECTUES SUR pr_02_01 
function displayExtract(corresp,mAxiologicStatus,mReferenceStatus){

// FERMETURE DES EXTRAITS DÉJÀ OUVERTS
	closeExtract();
// IDENTIFICATION DE L'EXTRAIT À AFFICHER
	let toDisplay=document.getElementById(corresp);


// CONSTITUTION DES ÉLÊMENTS DE COMMENTAIRES, mention du statut axiologie et référentiel
	// 1. Tester les valeurs de l'attributs et le traduire en toutes lettres.

	var mAxiologicStatusTreated='';
	var mReferenceStatusTreated='';
	var axiSpan=document.createElement('span');
	var refSpan=document.createElement('span');

	// @ana=mAxiologicStatus
	if (mAxiologicStatus=='0') {
		mAxiologicStatusTreated='blâme';
		axiSpan.setAttribute('class','Axi0');
	}
	if (mAxiologicStatus=='1') {
		mAxiologicStatusTreated='indifférent';
		axiSpan.setAttribute('class','Axi1');

	}
	if (mAxiologicStatus=='2') {
		mAxiologicStatusTreated='éloge';
		axiSpan.setAttribute('class','Axi2');

	}
	if (mAxiologicStatus=='3') {
		mAxiologicStatusTreated='ambiguë';
		axiSpan.setAttribute('class','Axi3');
	}
	// @cert=mReferenceStatus
	if (mReferenceStatus=='0') {
		mReferenceStatusTreated='citation explicite';
		refSpan.setAttribute('class','Ref0');
	}
	if (mReferenceStatus=='1') {
		mReferenceStatusTreated='mention';
		refSpan.setAttribute('class','Ref1');
	}
	if (mReferenceStatus=='2') {
		mReferenceStatusTreated='mention ambiguë';
		refSpan.setAttribute('class','Ref2');
	}
	if (mReferenceStatus=='3') {
		mReferenceStatusTreated='emprunt non déclaré fortement suggéré';
		refSpan.setAttribute('class','Ref3');
	}
	if (mReferenceStatus=='4') {
		mReferenceStatusTreated='emprunt ou mention non déclaré(e) non suggéré(e) reconstitué(e)';
		refSpan.setAttribute('class','Ref4');
	}
		//On oublie pas de transformer des variables textes en objet manipulable par DOM -_-'
	let mReferenceStatusTreatedObj=document.createTextNode(mReferenceStatusTreated);
	let mAxiologicStatusTreatedObj=document.createTextNode(mAxiologicStatusTreated);
	let separator=document.createTextNode(' ; ');
	let point=document.createTextNode('.');


	refSpan.appendChild(mReferenceStatusTreatedObj);
	axiSpan.appendChild(mAxiologicStatusTreatedObj);

	// 2 Création des éléments html etc
	let mQuoteStatus=document.createElement('p');
	mQuoteStatus.setAttribute('class','editor deleteMe');
	let mQuoteStatusTxt=document.createTextNode('Statuts de la référence : ');



	mQuoteStatus.appendChild(mQuoteStatusTxt);
	mQuoteStatus.appendChild(refSpan);
	mQuoteStatus.appendChild(separator);
	mQuoteStatus.appendChild(axiSpan);
	mQuoteStatus.appendChild(point);
	

	
	// 3 Déduction de la position à laquelle on ajoute les info
		// On insérera avant le frère du premier fils de la divTodisplay, soit avant l'élément qui suit la croix pour fermer (premier fils de ToDisplay), ie le 1er § (de l'extrait ou de commentaire de kl'éditeur).
	let firstChild=toDisplay.firstChild;
	let theOneEvenbefore=firstChild.nextSibling;
	let theOnebefore=theOneEvenbefore.nextSibling;
	// 4 Apendage
	toDisplay.insertBefore(mQuoteStatus,theOnebefore);

	// toDisplay.appendChild(mQuoteStatus);
	// toDisplay.appendChild(mQuoteAxStatus);




// AFFICHAGE DE L'EXTRAIT CLIQUÉ



	toDisplay.setAttribute('class','extractDisplay');


}	


// FERMETURE DES EXTRAITS DÉJÀ OUVERTS
function closeExtract(){
	let toHide=document.getElementsByClassName('extractDisplay');
	for (let toHides of toHide){
		toHides.setAttribute('class','extractHide');
	}
	// Suppression des paragraphes d'annotation créés, pour éviter les doublons.
	let toDelete=document.getElementsByClassName('deleteMe');
	for (var i = toDelete.length - 1; i >= 0; i--) {
		toDelete[i].remove();
	}
}