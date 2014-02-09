<html>
<head>
  <title>photobox</title>
  <style type="text/css">
    * {
      box-sizing: border-box;
    }

    a {
      position: relative;
      color: #fff;
      text-decoration: none;
    }

    body {
      font-family: Helvetica;
      font-size: 14px;
      font-weight: 200;
    }

    h2 {
      margin: 0;
      padding: 0;
      font-weight: 200;

      text-align: center;

      padding: 0.5em;
      color: #fff;
      background-color: #0F3340;
      box-shadow: inset 0 1px 2px #000;
    }

    button {
      margin: 0 auto;
      width: 240px;
      text-align: center;
      display: block;
      padding: 10px;

      background-color: #3da1fe;
      color: #fff;

      border: 0;

      cursor: pointer;

      font-size: 1.5em;
      font-weight: 800;
    }

    main {
      width: 98%;
      margin: 0 auto;
      position: relative;
    }

    .row {
      width: 100%;

      padding: 1% 0;
      margin: 0 0 2% 0;
    }

    .col {
      display: inline-block;
      width: 30%;
      margin-left: 3.333%;

      position: relative;

      vertical-align: top;
    }

    .col img {
      width: 100%;

      box-shadow: 0 1px 1px #333;
    }

    .col p {
      background-color: #fff;
      box-shadow: inset 0 1px 1px #000;
      text-align: center;
      margin: 0;
      padding: 0.5em;


      color: #fff;
      background-color: #0F3340;
    }

    .colContainer {
      position: relative;
      width: 100%;
      margin-left: -1.666%;
      clear: both;
    }

    .name, .size {
      text-align: center;
      color: #3da1fe;
      float: left;

      color: #fff;

    }

    .name {
      font-size: 2em;

      padding: 0.5em 0.5em 0.5em 1em;
      margin: 1em 0 0 -0.0625em;

      background-color: #F4882D;
      box-shadow: 0 1px 1px #333;
    }

    .size {
      font-size: 1.5em;
      margin: 0.5em 0 ;
      padding: 0.5em;
      clear: left;

      background-color: #0F3340;
      box-shadow: inset 0 1px 2px #000;
    }
  </style>
</head>
<body>
  <main class="">
    <% _.each( _.keys( templateData ), function( url ) { %>
      <% var name  = url.replace( /(http:\/\/|https:\/\/)/, '' ).replace( /\//g, '-' ); %>
      <div class="name"><a href="<%= url %>" data-name="<%= name %>" target="_blank"><%= name %></a></div>

      <% _.each( templateData[ url ], function( size ) {%>
        <div class="row">
          <div class="size"><%= size %></div>
          <div class="colContainer">
            <div class="col col-1">
              <h2>Old screens</h2>
              <a href="img/last/<%= name %>-<%= size %>.png?<%= now %>" target="_blank">
                <img src="" data-src="img/last/<%= name %>-<%= size %>.png?<%= now %>" data-size="<%= size %>">
              </a>
              <p><%= timestamps.last %></p>
            </div><div class="col col-2">
              <h2>Difference</h2>
              <a href="img/diff/<%= name %>-<%= size %>.png?<%= now %>" target="_blank">
                <img src="" data-src="img/diff/<%= name %>-<%= size %>.png?<%= now %>" data-size="<%= size %>">
              </a>
            </div><div class="col col-3">
              <h2>New Screens</h2>
              <a href="img/current/<%= name %>-<%= size %>.png?<%= now %>" target="_blank">
                <img src="" data-src="img/current/<%= name %>-<%= size %>.png?<%= now %>" data-size="<%= size %>">
              </a>
              <p><%= timestamps.current %></p>
            </div>
          </div>
        </div>
      <% } );%>
    <% } );%>
  </main>

  <script type="text/javascript">
  (function(){
    'use strict';
    var imagesList      = document.querySelectorAll( 'img' ),
        images          = Array.prototype.slice.call( imagesList, 0 );

    function placeKitten() {
      var size = this.dataset.size.replace( /x/, '/')
      this.src = 'http://placekitten.com/' + size;
    }

    images.forEach( function( image ) {
      image.onerror = placeKitten;
      image.src = image.dataset.src;
    } );


  })();
  </script>

</body>
</html>
