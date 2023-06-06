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
	// récupérer en paramètre les autres attributs
	// pour ajouter une ligne avec statut axio et ref
	var mAxiologicStatusTreated='';
	var mReferenceStatusTreated='';

	// @ana=mAxiologicStatus
	if (mAxiologicStatus=='1') {
		mAxiologicStatusTreated='indifférent';
	}
	if (mAxiologicStatus=='2') {
		mAxiologicStatusTreated='éloge';
	}
	if (mAxiologicStatus=='0') {
		mAxiologicStatusTreated='blâme';
	}
	if (mAxiologicStatus=='3') {
		mAxiologicStatusTreated='ambiguë';
	}
	// @cert=mReferenceStatus
	if (mReferenceStatus=='0') {
		mReferenceStatusTreated='citation explicite';
	}
	if (mReferenceStatus=='1') {
		mReferenceStatusTreated='mention';
	}
	if (mReferenceStatus=='2') {
		mReferenceStatusTreated='mention ambiguë';
	}
	if (mReferenceStatus=='3') {
		mReferenceStatusTreated='emprunt non déclaré fortement suggéré';
	}
	if (mReferenceStatus=='4') {
		mReferenceStatusTreated='emprunt ou mention non déclaré(e) non suggéré(e) reconstitué(e)';
	}
	// Quote ref status
	let mQuoteStatus=document.createElement('p');
	mQuoteStatus.setAttribute('class','editor deleteMe');
	let mQuoteStatusTxt=document.createTextNode('Status de la référence : '+mReferenceStatusTreated+'.');
	mQuoteStatus.appendChild(mQuoteStatusTxt);
	// Quote axio status
	let mQuoteAxStatus=document.createElement('p');
	mQuoteAxStatus.setAttribute('class','editor deleteMe');
	let mQuoteAxStatusTxt=document.createTextNode('Status axiologique : '+mAxiologicStatusTreated+'.');
	mQuoteAxStatus.appendChild(mQuoteAxStatusTxt);

	closeExtract();
	let toDisplay=document.getElementById(corresp);
	toDisplay.setAttribute('class','extractDisplay');
	toDisplay.appendChild(mQuoteStatus);
	toDisplay.appendChild(mQuoteAxStatus);

}	

function closeExtract(){
	let toHide=document.getElementsByClassName('extractDisplay');
	for (let toHides of toHide){
		toHides.setAttribute('class','extractHide');
	}
	let toDelete=document.getElementsByClassName('deleteMe');
	for (var i = toDelete.length - 1; i >= 0; i--) {
		toDelete[i].remove();
	}
}