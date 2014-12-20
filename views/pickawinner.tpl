%include('navbar.tpl')


<script type='text/javascript'>
function winclick() {
        t = 1000
        function buildUp () {
            setTimeout(function() {$("#winner").text("Picking.")}, 500)
            setTimeout(function() {$("#winner").text("Picking..")}, 900)
            setTimeout(function() {$("#winner").text("Picking...")}, 1300)
            setTimeout(function() {$("#winner").text("Picking....")}, 1700)
            setTimeout(function() {$("#winner").text("Found one :) :)")}, 2200)
           
            setTimeout(function() {$("#winner").load('/bundle/rawwinner #winner')}, 3500)
            
        }
        setTimeout(function(){buildUp()}, 500)

                            
        function setName(n) {
                        
        $("#winner").text(n);
        $("#afterwinner").text(n);
        }
        //setTimeout(function(){setName("{{ winner }}")}, 3000);
                       
                
       
}



</script>


<br>
<br>
<div class="container text-center">
<div class="row span4">
<h1 id="winner"> ?????? </h1>
<p> <a class="btn btn-primary btn-lg" href="#" role="button" id="winnerbutton" onclick=winclick()> Pick a Winner </a> </p>
</div>
</div>





















%include('footer.tpl')

