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