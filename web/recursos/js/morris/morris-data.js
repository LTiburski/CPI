// Morris.js Charts sample data for SB Admin template

$(function() {

    // Area Chart
    Morris.Area({
        element: 'morris-area-chart',
        data: [{
            period: '2010 Q1',
            inst1: 2666,
            inst2: 2000,
            inst3: 3000
        }, {
            period: '2010 Q2',
            inst1: 2778,
            inst2: 1500,
            inst3: 1860
        }, {
            period: '2010 Q3',
            inst1: 4912,
            inst2: 3457,
            inst3: 2790
        }, {
            period: '2010 Q4',
            inst1: 3767,
            inst2: 3500,
            inst3: 2957
        }, {
            period: '2011 Q1',
            inst1: 6810,
            inst2: 4120,
            inst3: 1542
        }, {
            period: '2011 Q2',
            inst1: 5670,
            inst2: 2789,
            inst3: 7500
        }, {
            period: '2011 Q3',
            inst1: 4820,
            inst2: 4000,
            inst3: 6800,
        }, {
            period: '2011 Q4',
            inst1: 15073,
            inst2: 4541,
            inst3: 7654
        }, {
            period: '2012 Q1',
            inst1: 10687,
            inst2: 3204,
            inst3: 7014
        }, {
            period: '2012 Q2',
            inst1: 17000,
            inst2: 7451,
            inst3: 6217
        }],
        xkey: 'period',
        ykeys: ['inst1', 'inst2', 'inst3'],
        labels: ['Instituição 01', 'Instituição 02', 'Instituição 03'],
        pointSize: 3,
        hideHover: 'auto',
        resize: true
    });

    Morris.Bar({
        element: 'bar',
        data:[
            {mes: 'Janeiro', inst1: 3500, inst2: 2300, inst3: 3000},
            {mes: 'Fevereiro', inst1: 2800, inst2: 2500, inst3: 3100},
            {mes: 'Março', inst1: 2500, inst2: 2700, inst3: 3000},
            {mes: 'Abril', inst1: 2950, inst2: 2100, inst3: 4500},
            {mes: 'Maio', inst1: 1050, inst2: 3000, inst3: 1800},
            {mes: 'Junho', inst1: 1230, inst2: 3850, inst3: 2300},
            {mes: 'Julho', inst1: 2000, inst2: 3740, inst3: 2220}
        ],
        xkey: 'mes',
        ykeys: ['inst1', 'inst2', 'inst3'],
        labels: ['Instituição 01', 'Instituição 02', 'Instituição 03']
    });

    // Donut Chart
    Morris.Donut({
        element: 'morris-donut-chart',
        data: [{
            label: "Instituição 01",
            value: 12
        }, {
            label: "Instituição 02",
            value: 30
        }, {
            label: "Instituição 03",
            value: 20
        }],
        resize: true
    });

    // Line Chart
    Morris.Line({
        // ID of the element in which to draw the chart.
        element: 'morris-line-chart',
        // Chart data records -- each entry in this array corresponds to a point on
        // the chart.
        data: [{
            d: '2012-10-01',
            visits: 802
        }, {
            d: '2012-10-02',
            visits: 783
        }, {
            d: '2012-10-03',
            visits: 820
        }, {
            d: '2012-10-04',
            visits: 839
        }, {
            d: '2012-10-05',
            visits: 792
        }, {
            d: '2012-10-06',
            visits: 859
        }, {
            d: '2012-10-07',
            visits: 790
        }, {
            d: '2012-10-08',
            visits: 1680
        }, {
            d: '2012-10-09',
            visits: 1592
        }, {
            d: '2012-10-10',
            visits: 1420
        }, {
            d: '2012-10-11',
            visits: 882
        }, {
            d: '2012-10-12',
            visits: 889
        }, {
            d: '2012-10-13',
            visits: 819
        }, {
            d: '2012-10-14',
            visits: 849
        }, {
            d: '2012-10-15',
            visits: 870
        }, {
            d: '2012-10-16',
            visits: 1063
        }, {
            d: '2012-10-17',
            visits: 1192
        }, {
            d: '2012-10-18',
            visits: 1224
        }, {
            d: '2012-10-19',
            visits: 1329
        }, {
            d: '2012-10-20',
            visits: 1329
        }, {
            d: '2012-10-21',
            visits: 1239
        }, {
            d: '2012-10-22',
            visits: 1190
        }, {
            d: '2012-10-23',
            visits: 1312
        }, {
            d: '2012-10-24',
            visits: 1293
        }, {
            d: '2012-10-25',
            visits: 1283
        }, {
            d: '2012-10-26',
            visits: 1248
        }, {
            d: '2012-10-27',
            visits: 1323
        }, {
            d: '2012-10-28',
            visits: 1390
        }, {
            d: '2012-10-29',
            visits: 1420
        }, {
            d: '2012-10-30',
            visits: 1529
        }, {
            d: '2012-10-31',
            visits: 1892
        }, ],
        // The name of the data record attribute that contains x-visitss.
        xkey: 'd',
        // A list of names of data record attributes that contain y-visitss.
        ykeys: ['visits'],
        // Labels for the ykeys -- will be displayed when you hover over the
        // chart.
        labels: ['Visits'],
        // Disables line smoothing
        smooth: false,
        resize: true
    });

    // Bar Chart
    Morris.Bar({
        element: 'morris-bar-chart',
        data: [{
            device: 'iPhone',
            geekbench: 136
        }, {
            device: 'iPhone 3G',
            geekbench: 137
        }, {
            device: 'iPhone 3GS',
            geekbench: 275
        }, {
            device: 'iPhone 4',
            geekbench: 380
        }, {
            device: 'iPhone 4S',
            geekbench: 655
        }, {
            device: 'iPhone 5',
            geekbench: 1571
        }],
        xkey: 'device',
        ykeys: ['geekbench'],
        labels: ['Geekbench'],
        barRatio: 0.4,
        xLabelAngle: 35,
        hideHover: 'auto',
        resize: true
    });


});
