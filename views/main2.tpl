<DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Super Bundle</title>

    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">

        <link href="../css/carousel.css" rel="stylesheet">
  </head>

  <body>

    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->

    <div class="container marketing">

      <h2 style="text-align:center; margin-left:auto; margin-right:auto; font-weight:bold;">Super Bundle RMX:</h2>

      <!-- Three columns of text below the carousel -->
      <div class="row">

          %for column in range(1, 4):
              %if len(items) > 0:
                  %item = items.pop()

                  <div class="col-lg-4">
                      <img class="img-circle" src="{{ item['thumb_image_path'] }}" alt="{{ item['title'] }}" style="width: 140px; height: 140px;">
                      <h2>{{ item['title'] }}</h2>
                      <p id="item{{ column }}">{{ item['description'] }}</p>
                      <p><a class="btn btn-default" href="bundle/items" role="button">{{ item['linktag'] }} &raquo;</a></p>
                  </div>
              %end
          %end

      </div><!-- /.row -->
    </div>



    <!-- Carousel
    ================================================== -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
        <li data-target="#myCarousel" data-slide-to="3"></li>
      </ol>
      <div class="carousel-inner">

        <div class="item active" style="background:grey;">
          <!--<img src="data:image/gif;base64,R0lGODlhAQABAIAAAGZmZgAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="FAQ">-->
          <img src="../images/Superlogo-v4-nobg.png" alt="FAQ">
          <div class="container">
            <div class="carousel-caption">
              <h1>Super Bundle RMX</h1>
              <p>Your bundle. Supersized.</p>
              <p><a class="btn btn-lg btn-primary" href="bundle/faq" role="button">Read the FAQ</a></p>
            </div>
          </div>
        </div>

        <div class="item" style="background:grey;">
          <!--<img src="../images/video-blue.png" alt="Video">-->
          <img src="../images/movie-camera-hi.png" alt="Video">
          <div class="container">
            <div class="carousel-caption">
              <h1>Super Video</h1>
              <p>Everything you need to know about this year's bundle!</p>
              <p><a class="btn btn-lg btn-primary" href="bundle/playvideo" role="button">Play Now</a></p>
            </div>
          </div>
        </div>

        <div class="item" style="background:grey;">
          <img src="../images/ticketsbig.jpg" alt="Ticket Tracker">
          <div class="container">
            <div class="carousel-caption">
              <h1>Ticket Tracker</h1>
              <p id='muxtest'>See where you stand. Revel in your piety and shame your peers!</p>
              <p><a class="btn btn-lg btn-primary" href="bundle/tickets" role="button">See how you stack up</a></p>
            </div>
          </div>
        </div>

        <div class="item" style="background:grey;">
          <!--<img src="../images/uw_rgb_banner.jpg" alt="United Way">-->
`         <img src="../images/uw_rgb_banner.png" alt="United Way">
          <div class="container">
            <div class="carousel-caption">
              <!--
              <h1>Proceeds benefit the United Way</h1>
              <p>The best way to donate to the United Way is to buy Super Bundle tickets. Buy as many as you can!</p>
              -->
              <p><a class="btn btn-lg btn-primary" href="http://www.unitedway.com/" role="button">Learn More</a></p>
            </div>
          </div>
        </div>

      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
    </div><!-- /.carousel -->





    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="../js/jquery-1.11.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/docs.min.js"></script>
    <script src="../bundle/mux"></script>
   
  </body>
</html>

