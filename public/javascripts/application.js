// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// script que faz sumir as flash_mensagens
document.observe('dom:loaded', function() {
  setTimeout(hideFlashes, 5000);
});

var hideFlashes = function() {
  $$('.msg_notice', '.msg_warning', '.msg_error').each(function(e) {
    if (e) {
        Effect.Fade(e, { duration: 1.5 });        
        }
  })
}

function abre_div(nome_div,check) {
    if(check.checked==true) {
      Effect.toggle(nome_div, 'blind', {duration:0.25});
    }else
    {
      Effect.toggle(nome_div, 'blind', {duration:0.25});
    }
}

function tableZebra(tableID, classTR){ //Declaro a função
	var tr = document.getElementById(tableID).getElementsByTagName("tr"); //Pego todas as "tr" dentro da tabela com "id" que recebemos
	var trLength = tr.length; //Pega a quantidade/tamanho de "tr" existentes
	for(var i = 0; i < trLength; i++){ //Percorro todos os "tr" no loop
		if(i % 2 == 0){ //Conta matemática apenas para definir quem vai receber o "class"
			tr[i].className = classTR; //Atenção aqui: para definir "class" no elemento, não se usa "element.class", e sim "element.className". Isso por que a palavra "class" é reservada
		}; //Fecha instrução "if"
	}; //Fecha loop "for"
}; //Fecha bloco de função
