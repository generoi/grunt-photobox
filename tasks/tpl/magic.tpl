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
      overflow: hidden;
      -webkit-transition: all .5s linear;
      transition: all .5s linear;
    }

    main.inspect .col {
      width: 0%;
      margin: 0;
    }
    main.inspect .col.active {
      width: 96.6%;
      margin-left: 3.333%;
    }

    .col img {
      width: 100%;
      max-width: 100%;

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
            <div class="col" data-col="1">
              <h2>Old screens</h2>
              <img src="img/last/<%= name %>-<%= size %>.png?<%= now %>" data-size="<%= size %>">
              <p><%= timestamps.last %></p>
            </div><div class="col" data-col="2">
              <h2>Difference</h2>
              <img src="img/diff/<%= name %>-<%= size %>.png?<%= now %>" data-size="<%= size %>">
            </div><div class="col" data-col="3">
              <h2>New Screens</h2>
              <img src="img/current/<%= name %>-<%= size %>.png?<%= now %>" data-size="<%= size %>">
              <p><%= timestamps.current %></p>
            </div>
          </div>
        </div>
      <% } );%>
    <% } );%>
  </main>

  <script src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
  <script type="text/javascript">
  (function(){
    'use strict';

    var $main = $('main');

    $( 'body' ).on( 'click', '.col', function() {
      var col = $( this ).data('col'),
          $cols = $( '[data-col="' + col + '"]' ),
          is_active = this.className.indexOf( 'active' ) !== -1;

      $cols.toggleClass( 'active', !is_active );
      $main.toggleClass( 'inspect', !is_active );
    });

  })();
  </script>

</body>
</html>
