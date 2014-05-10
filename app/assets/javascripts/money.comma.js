jQuery(function($){
        $('.money input').mask('#0,00', {reverse: true, maxlength: false});
        $( ".actions input" ).click(function(){
                var result = $(".money input").val().split(",");
                $(".money input").val( result[0] + "." + result[1]);
        });
});