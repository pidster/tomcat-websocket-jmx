function id(arg) {
    return document.getElementById(arg);
}

function pieChart(name, obj) {
    var canvas = id(name);
}

function barChart(name, obj) {
    var canvas = id(name);
}

function lineChart(name, obj) {
    var canvas = id(name);
    if (canvas && canvas.getContext) {
        var context = canvas.getContext('2d');
        if (context) {
        	context.clearRect (0, 0, canvas.width, canvas.height);
            var d = obj.data;
            var p = obj.config.padding;
            chartTitle(canvas, obj);
            chartScale(canvas, obj.config);
            // context.save();
            chartData(canvas, obj, false);
        }
    }
}

function fillChart(name, obj) {
    var canvas = id(name);
    if (canvas && canvas.getContext) {
        var context = canvas.getContext('2d');
        if (context) {
            var d = obj.data;
            var p = obj.config.padding;
            chartTitle(canvas, obj);
            chartScale(canvas, obj.config);
            chartData(canvas, obj, true);
        }
    }
}

function chartTitle(canvas, obj) {
    if (obj.label) {
        var context = canvas.getContext('2d');
        context.font = obj.label.font;
        context.textBaseline = 'top';
        context.textAlign = obj.label.align;
        context.fillStyle = obj.label.color;
        context.fillText(obj.label.title, (canvas.width / 2), 0);
    }
}


function chartScale(canvas, config) {
    var p = config.padding;
    var context = canvas.getContext('2d');
    context.globalAlpha = 1.0;
    context.beginPath();
    context.strokeStyle = '#666';
    context.lineWidth = 0.5;
    context.lineCap = 'butt';
    context.lineJoin = 'mitre';
    context.lineTo(p + 0.5, p + 0.5);
    context.lineTo(p + 0.5, (canvas.height - p) + 0.5);
    context.lineTo((canvas.width - p) + 0.5, (canvas.height - p) + 0.5);
    context.stroke();
    context.closePath();
}

function chartData(canvas, obj, fill) {
    var context = canvas.getContext('2d');
    // context.restore();
    context.globalAlpha = 0.5;
    var p = obj.config.padding;
    var d = obj.data;
    for (var i=0; i<d.length; i++) {
        var v = d[i].values;
        context.beginPath();
        if (fill) {
            context.fillStyle = d[i].fillStyle;
            var gradient = context.createLinearGradient(p, p, (canvas.width - p), (canvas.height - p));
            gradient.addColorStop(0, d[i].fillStyle);
            gradient.addColorStop(1, '#fff');
            context.moveTo(p, (canvas.height - p));
        }
        else {
            context.strokeStyle = d[i].strokeStyle;
            context.lineWidth = d[i].lineWidth;
            context.lineCap = d[i].lineCap;
            context.lineJoin = d[i].lineJoin;
        }
        var unit = (canvas.width - p) / v.length;
        var j = 0;
        var x, y = 0;
        for (; j<v.length; j++) {
            x = p + (j * unit);
            var y = canvas.height - (v[j] * 2);
            context.lineTo(x, y);
        }
        if (fill) {
            context.lineTo(x, (canvas.height - p));
            context.closePath();
            context.fill();
        }
        else {
            context.stroke();
            context.closePath();
        }
    }
}

/*
var sample = {
    label: {
        title: 'Threads',
        font: '10px sans-serif',
        color: '#336',
        align: 'center'
    },
    config: {
        padding: 10
    },
    data: [
        {
            name: 'one',
            type: 'line',
            strokeStyle: '#69c',
            fillStyle: '#69c',
            lineWidth: 5.0,
            lineCap: 'round',
            lineJoin: 'round',
            values: [25,26,25,27,28,29,31,30,28,27,26,24,26,25,24]
        },
        {
            name: 'two',
            type: 'fill',
            strokeStyle: '#9c6',
            fillStyle: '#9c6',
            lineWidth: 5.0,
            lineCap: 'round',
            lineJoin: 'round',
            values: [31,30,28,27,26,24,26,25,25,26,25,27,28,29,28]
        }
    ]
}


function test() {
    lineChart('threads', sample);
    fillChart('memory', sample);
}
*/
