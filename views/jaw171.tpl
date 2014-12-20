%include('navbar.tpl')

<link href="//vjs.zencdn.net/4.9/video-js.css" rel="stylesheet">
<script src="//vjs.zencdn.net/4.9/video.js"></script>

<div class="container">

  <!-- Adam's garbage
  <video id="video" width="720" height="500"  style="margin: auto;" preload controls>

    <source src=" videos/video_1b.flv" />
    <source src=" videos/video_1b.webm" />
  </video>
  -->

  <!-- Jeff's garbage -->
  <video id="video" class="video-js vjs-default-skin" controls preload="auto" width="720" height="500" style="margin: auto;"
    data-setup='{"controls" : true, "autoplay" : false, "preload" : "auto"}'>
    <source src="/videos/{{ video }}.webm" type='video/webm' />
    <source src="/videos/{{ video }}.flv" type="video/x-flv" />
    <p class="vjs-no-js">To view this video please enable JavaScript, and consider upgrading to a web browser that <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a></p>
  </video>

</div>

%include('footer.tpl')
