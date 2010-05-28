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
