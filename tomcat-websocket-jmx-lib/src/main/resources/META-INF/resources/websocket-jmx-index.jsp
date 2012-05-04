<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>WebSocket + JMX</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link href="${pageContext.request.contextPath}${requestScope.path}/bootstrap.min.css" rel="stylesheet">
    <style>
      body {
        padding-top: 60px;
      }
    </style>
    <link href="${pageContext.request.contextPath}${requestScope.path}/bootstrap-responsive.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}${requestScope.path}/display.css" rel="stylesheet">

    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
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
            <canvas id="threads"></canvas>
        </div><!--/span-->

        <div class="span3">
            <canvas id="memory"></canvas>
        </div><!--/span-->

        <div class="span3">
            <canvas id="canvas3"></canvas>
        </div><!--/span-->

        <div class="span3">
            <canvas id="canvas4"></canvas>
        </div><!--/span-->
      </div><!--/row-->

    <textarea id="console" rows="10" cols="300"></textarea>

    <script src="${pageContext.request.contextPath}${requestScope.path}/jquery.js"></script>
    <script src="${pageContext.request.contextPath}${requestScope.path}/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}${requestScope.path}/core.js"></script>

    <script type="text/javascript">

    function log(msg) {
        var console = document.getElementById('console');
        console.value += (msg + "\n");
    }

    var threadCount = [20]

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
        ws.send(JSON.stringify([{query: 'domains'}]))
    }

    ws.onclose = function() {
        log("closed");
    }

    ws.onerror = function(error) {
        log("error: " + error);
    }

    ws.onmessage = function(message) {
        log("got stats: " + message.data);
        var stats = JSON.parse(message.data);

        for (model in stats) {
        	log("model: " + model);

        	var data = stats[model].data;
			log("data: " + data)
        	
/* 			for (var i=0; i<data.length; i++) {
				log("name: " + data[i].name)
			}
 */
        }

        threads.data[0].values.push(stats.threads.threadCount);
        if (threads.data[0].values.length > 20) {
            threads.data[0].values.shift()
        }
        lineChart('threads', threads);

        memory.data[0].values.push(stats.memory.usedHeap);
        memory.data[1].values.push(stats.memory.usedNonHeap);
        if (memory.data[0].values.length > 20) {
        	memory.data[0].values.shift()
        }
        if (memory.data[1].values.length > 20) {
        	memory.data[1].values.shift()
        }
        fillChart('memory', memory);
    }

    function echo() {
        ws.send('echo');
    }

    function collect() {
        ws.send('collect');
    }

    var timer = setInterval("collect()", 2000)

    var charts = {
    	'threads': {
	        'label': {
	            title: 'Threads',
	            font: '10px sans-serif',
	            color: '#336',
	            align: 'center'
	        },
	        'config': {
	            padding: 10
	        },
	        'data': [
	            {
	                name: 'threadCount',
	                type: 'line',
	                strokeStyle: '#69c',
	                fillStyle: '#69c',
	                lineWidth: 2.0,
	                lineCap: 'round',
	                lineJoin: 'round',
	                values: []
	            }
	        ]
	    },

	    'memory': {
	        'label': {
	            title: 'Memory',
	            font: '10px sans-serif',
	            color: '#336',
	            align: 'center'
	        },
	        'config': {
	            padding: 10
	        },
	        'data': [
	            {
	                name: 'usedHeap',
	                type: 'fill',
	                strokeStyle: '#69c',
	                fillStyle: '#69c',
	                lineWidth: 2.0,
	                lineCap: 'round',
	                lineJoin: 'round',
	                values: []
	            },
	            {
	                name: 'usedNonHeap',
	                type: 'fill',
	                strokeStyle: '#69c',
	                fillStyle: '#69c',
	                lineWidth: 2.0,
	                lineCap: 'round',
	                lineJoin: 'round',
	                values: []
	            }            
	        ]
	    }
    }

    </script>
  </body>
</html>
