var $btnAumentar = $("#btnAumentar");
var $btnDiminuir = $("#btnDiminuir");
var $elemento = $("body #sect-align #sect").find("*"); //encontra todos os elementos dentro do #content
var fonts = [];

function obterTamanhoFonte() {
    for (var i = 0; i < $elemento.length; i++) {
        fonts.push(parseFloat($elemento.eq(i).css('font-size')));
    }
}
obterTamanhoFonte();
$btnAumentar.on('click', function () {
    console.log("Aumentando Fonte");
    for (var i = 0; i < $elemento.length; i++) {
        ++fonts[i];
        $elemento.eq(i).css('font-size', fonts[i]);

    }
});
$btnDiminuir.on('click', function () {
    console.log("Diminuindo Fonte");

    for (var i = 0; i < $elemento.length; i++) {
        --fonts[i];
        $elemento.eq(i).css('font-size', fonts[i]);
    }
});