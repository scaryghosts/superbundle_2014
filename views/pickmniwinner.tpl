%include('navbar.tpl')


<script type='text/javascript'>







function winclick1() {
        t = 1000
        function buildUp () {
            setTimeout(function() {$("#winner1").text("?????")}, 500)
            setTimeout(function() {$("#winner1").text("????")}, 900)
            setTimeout(function() {$("#winner1").text("???")}, 1300)
            setTimeout(function() {$("#winner1").text("??")}, 1700)
            setTimeout(function() {$("#winner1").text("?")}, 2200)
           
            setTimeout(function() {$("#winner1").load('/bundle/rawwinner #winner')}, 3000)
            
        }
        setTimeout(function(){buildUp()}, 500)

                            
        function setName(n) {
                        
        $("#winner").text(n);
        $("#afterwinner").text(n);
        }
        
                       
                
       
}


function winclick2() {
        t = 1000
        function buildUp () {
            setTimeout(function() {$("#winner2").text("?????")}, 500)
            setTimeout(function() {$("#winner2").text("??")}, 900)
            setTimeout(function() {$("#winner2").text("!")}, 1300)
            setTimeout(function() {$("#winner2").text("^ _ ^")}, 1700)
       

            setTimeout(function() {$("#winner2").load('/bundle/rawwinner #winner')}, 2200)
            
    

        }
        setTimeout(function(){buildUp()}, 500);


       




}


$(document).ready(function() {
    setTimeout(function() {$('#navbar').append('<li><a href="/bundle/reveal">Reveal!</a></li>');}, 500)
});



</script>


<br>
<br>
<div class="container text-center">
<div class="row">
<div class="span5">
<h1 id="winner1"> ?????? </h1>
<a class="btn btn-primary btn-lg" href="#" role="button" id="winnerbutton1" onclick=winclick1()> Pick First Finalist </a>
</div>
<div class="span5">
<h1 id="winner2"> ?????? </h1>
<a class="btn btn-primary btn-lg" href="#" role="button" id="winnerbutton2" onclick=winclick2()> Pick Second Finalist</a>
</div>
</div>
</div>
</div>





















%include('footer.tpl')

