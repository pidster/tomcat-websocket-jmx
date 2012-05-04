<%--
Licensed to the Apache Software Foundation (ASF) under one or more
contributor license agreements.  See the NOTICE file distributed with
this work for additional information regarding copyright ownership.
The ASF licenses this file to You under the Apache License, Version 2.0
(the "License"); you may not use this file except in compliance with
the License.  You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
--%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Bootstrap, from Twitter</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="${pageContext.request.contextPath}${requestScope.path}/bootstrap.min.css" rel="stylesheet">
    <style>
      body {
        padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
      }
    </style>
    <link href="${pageContext.request.contextPath}${requestScope.path}/bootstrap-responsive.min.css" rel="stylesheet">

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
    <!--
    <link rel="shortcut icon" href="../assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
    -->
  </head>

  <body>

    <div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <a class="brand" href="#">WebSocket + JMX</a>
          <div class="nav-collapse">
            <ul class="nav">
              <li class="active"><a href="#">Home</a></li>
              <li><a href="#about">About</a></li>
              <li><a href="#contact">Contact</a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>

    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span3">
          <div id="mbean-sidebar-list" class="well sidebar-nav">
            <h2>Domains</h2>
            <ul class="nav nav-list">
              <li class="nav-header">MBeans</li>
              <li class="active"><a href="#">Link</a></li>
              <li><a href="#">Link</a></li>
              <li><a href="#">Link</a></li>
              <li><a href="#">Link</a></li>
              <li class="nav-header">Sidebar</li>
              <li><a href="#">Link</a></li>
              <li><a href="#">Link</a></li>
              <li><a href="#">Link</a></li>
              <li><a href="#">Link</a></li>
              <li><a href="#">Link</a></li>
              <li><a href="#">Link</a></li>
              <li class="nav-header">Sidebar</li>
              <li><a href="#">Link</a></li>
              <li><a href="#">Link</a></li>
              <li><a href="#">Link</a></li>
            </ul>
          </div><!--/.well -->
        </div><!--/span-->
        <div class="span9">
          <div class="hero-unit">
            <h1>Hello, world!</h1>
            <p>This is a template for a simple marketing or informational website. It includes a large callout called the hero unit and three supporting pieces of content. Use it as a starting point to create something more unique.</p>
            <p><a class="btn btn-primary btn-large">Learn more &raquo;</a></p>
          </div>
          <div class="row-fluid">
            <div class="span4">
              <h2>Heading</h2>
              <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
              <p><a class="btn" href="#">View details &raquo;</a></p>
            </div><!--/span-->
            <div class="span4">
              <h2>Heading</h2>
              <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
              <p><a class="btn" href="#">View details &raquo;</a></p>
            </div><!--/span-->
            <div class="span4">
              <h2>Heading</h2>
              <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
              <p><a class="btn" href="#">View details &raquo;</a></p>
            </div><!--/span-->
          </div><!--/row-->
          <div class="row-fluid">
            <div class="span4">
              <h2>Heading</h2>
              <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
              <p><a class="btn" href="#">View details &raquo;</a></p>
            </div><!--/span-->
            <div class="span4">
              <h2>Heading</h2>
              <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
              <p><a class="btn" href="#">View details &raquo;</a></p>
            </div><!--/span-->
            <div class="span4">
              <h2>Heading</h2>
              <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
              <p><a class="btn" href="#">View details &raquo;</a></p>
            </div><!--/span-->
          </div><!--/row-->
        </div><!--/span-->
      </div><!--/row-->

	<textarea id="console" rows="10" cols="72"></textarea>

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="${pageContext.request.contextPath}${requestScope.path}/jquery.js"></script>
    <script src="${pageContext.request.contextPath}${requestScope.path}/bootstrap.min.js"></script>

    <script type="text/javascript">
    
    function log(msg) {
        var console = document.getElementById('console');
        console.value =+ msg + "\n"
    }
    
    var target = 'ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}${requestScope.path}/connect';
    var ws = null;

    if ('WebSocket' in window) {
        ws = new WebSocket(target);
        log('WebSocket is supported by this browser');

    } else if ('MozWebSocket' in window) {
        log('WebSocket is kinda supported by this browser');
        ws = new MozWebSocket(target);

    } else {
        log('WebSocket is not supported by this browser');
        return;
    }

    ws.onopen = function() {
        log("opened");
        ws.send(JSON.stringify({query: 'domains'}))
    }
    ws.onclose = function() {
    	log("closed");
    }
    ws.onerror = function(error) {
    	log("error: " + error);
    }
    ws.onmessage = function(message) {
    	log("got message: " + message.data);
    }

    function echo() {
        ws.send('echo');
    }

    function poll() {
    	log("Poll!")
        ws.send('echo');
    }

    </script>

    <!--
    <script src="../assets/js/bootstrap-transition.js"></script>
    <script src="../assets/js/bootstrap-alert.js"></script>
    <script src="../assets/js/bootstrap-modal.js"></script>
    <script src="../assets/js/bootstrap-dropdown.js"></script>
    <script src="../assets/js/bootstrap-scrollspy.js"></script>
    <script src="../assets/js/bootstrap-tab.js"></script>
    <script src="../assets/js/bootstrap-tooltip.js"></script>
    <script src="../assets/js/bootstrap-popover.js"></script>
    <script src="../assets/js/bootstrap-button.js"></script>
    <script src="../assets/js/bootstrap-collapse.js"></script>
    <script src="../assets/js/bootstrap-carousel.js"></script>
    <script src="../assets/js/bootstrap-typeahead.js"></script>
    -->
  </body>
</html>







































<%--

<!DOCTYPE html>
<%@ page session="false" %>
<html lang="en">
    <head>
        <title>WebSocket + JMX Demo</title>
        <link href="${pageContext.request.contextPath}${requestScope.path}/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
    </head>

    <body>

        <div id="container">

        </div>

        <hr />

        <p>
            <textarea id="data" rows="6" cols="18"></textarea>
        </p>
        <p>
            <button onclick="echo(); return false;">Echo</button>
        </p>

        <script type="text/javascript">
        var target = 'ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}${requestScope.path}/connect';
        var data = document.getElementById('data');
        var ws = null;

        if ('WebSocket' in window) {
            ws = new WebSocket(target);
            data.value = 'WebSocket is supported by this browser';

        } else if ('MozWebSocket' in window) {
            data.value = 'WebSocket is kinda supported by this browser';
            ws = new MozWebSocket(target);

        } else {
            data.value = 'WebSocket is not supported by this browser';
            return;
        }

        ws.onopen = function() {
            data.value = "opened";
        }
        ws.onclose = function() {
            data.value = "closed";
        }
        ws.onerror = function(error) {
            data.value = "error: " + error;
        }
        ws.onmessage = function(message) {
            data.value = "got message: " + message.data;
        }

        function echo() {
            ws.send('echo');
        }

        function poll() {
            data.value = "Poll!"
            ws.send('echo');
        }

        </script>
    </body>
</html>
--%>