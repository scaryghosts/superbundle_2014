%include('navbar.tpl')


<script type='text/javascript'>
function winclick() {
        t = 1000
        function buildUp () {
            setTimeout(function() {$("#winner").text("5")}, 500)
            setTimeout(function() {$("#winner").text("4")}, 900)
            setTimeout(function() {$("#winner").text("3")}, 1300)
            setTimeout(function() {$("#winner").text("2")}, 1700)
            setTimeout(function() {$("#winner").text("1")}, 2200)
           
            setTimeout(function() {$("#winner").text(" Winter King ")}, 2500)
            setTimeout(function() {$('#navbar').append('<li><a href="/bundle/pickwinner">Pick Super Bundle Winner!</a></li>');}, 3500)
            setTimeout(function() {$('#logos').append('<div class="col-lg-4"><img class="img-circle" src="/images/reveal/tesla.jpg" style="width: 140px; height: 140px;"></div> <div class="col-lg-4"><img class="img-circle" src="/images/reveal/youtube.png" style="width: 140px; height: 140px;"> </div> <div class="col-lg-4"><img class="img-circle" src="/images/reveal/disney.png" style="width: 140px; height: 140px;"></div>')}, 3000)
            
        }
        setTimeout(function(){buildUp()}, 500)

                            
        function setName(n) {
                        
        $("#winner").text(n);
        $("#afterwinner").text(n);
        }
        
                       
                
       
}



</script>


<br>
<br>
<div class="container text-center">
<div class="row span4">
<h1 id="winner"> ?????? </h1>
<p> <a class="btn btn-primary btn-lg" href="#" role="button" id="winnerbutton" onclick=winclick()> REVEAL THE CELEBRITY!</a> </p>
</div>
</div>

<br>
<div class="container marketing text-center">
<div class="row" id="logos">
    

    
</div>
</div>




















%include('footer.tpl')

