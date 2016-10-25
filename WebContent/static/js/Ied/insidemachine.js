$(function () {
	
	$("#returnsingleMachine").click(function(){
	   	 location.href="/Ied/jumptomachineIed";
	});
    $.getJSON('http://www.hcharts.cn/datas/jsonp.php?filename=usdeur.json&callback=?', function (data) {
    	//alert(data);
        var startDate = new Date(data[data.length - 1][0]), // Get year of last data point
            minRate = 1,
            maxRate = 0,
            startPeriod,
            date,
            rate,
            index;
        startDate.setMonth(startDate.getMonth() - 3); // a quarter of a year before last data point
        startPeriod = Date.UTC(startDate.getFullYear(), startDate.getMonth(), startDate.getDate());
        for (index = data.length - 1; index >= 0; index = index - 1) {
            date = data[index][0]; // data[i][0] is date
            rate = data[index][1]; // data[i][1] is exchange rate
            if (date < startPeriod) {
                break; // stop measuring highs and lows
            }
            if (rate > maxRate) {
                maxRate = rate;
            }
            if (rate < minRate) {
                minRate = rate;
            }
        }
        // Create the chart
        $('#container').highcharts('StockChart', {
        	chart:{
        		backgroundColor: '#000000'
        	},	
        	colors: ['#EEC900','#00CD00'],
        	credits: {
                enabled: false
            },
            scrollbar: {
                enabled: false
            },
            navigator: {
                enabled: false
            },
            rangeSelector: {
            	/*buttons: [{
            		type: 'month',
            		count: 3,
            		text: '实时'
            	}],
            	selected:0*/
            	enabled:false
            },
            title: {
                text: '角位仪录波',
                style: {
                    color: '#ff0000',
                    fontWeight: 'bold'
                    
                }
            },
            subtitle: {
                text: '模拟量通道1:宁海线电压A相',
                align: 'left',
                	style: {
                        color: '#FF00FF',
                        fontWeight: 'bold'
                    }	
            },
            xAxis: {
                labels: {
                    enabled: false
                }
            },
            yAxis: {
                plotLines: [{
                    value: minRate,
                    color: 'green',
                    dashStyle: 'shortdash',
                    width: 2,
                    label: {
                    	useHTML: true,
                        text: '0.8732A',
                        style: {
                            color: '#EEC900',
                            fontWeight: 'bold'
                        }
                    }
                }, {
                    value: maxRate,
                    color: 'red',
                    dashStyle: 'shortdash',
                    width: 2,
                    label: {
                    	useHTML: true,
                        text: '0.9463A',
                        style: {
                            color: '#EEC900',
                            fontWeight: 'bold'
                        }
                    }
                }]
            },
            series: [{
                name: '当前电流(A):',
                data: [0.8733, 0.8783, 0.8833, 0.8933, 0.9033, 0.8733,0.8893, 0.9133, 0.9433, 0.9133, 0.9033, 0.8733,0.8733, 0.8783, 0.8833, 0.8933, 0.9033, 0.8733,0.8893, 0.9133, 0.9433, 0.9133, 0.9033, 0.8733,0.8733, 0.8783, 0.8833, 0.8933, 0.9033, 0.8733,0.8893, 0.9133, 0.9433, 0.9133, 0.9033, 0.8733,0.8733, 0.8783, 0.8833, 0.8933, 0.9033, 0.8733,0.8893, 0.9133, 0.9433, 0.9133, 0.9033, 0.8733,0.8733, 0.8783, 0.8833, 0.8933, 0.9033, 0.8733,0.8893, 0.9133, 0.9433, 0.9133, 0.9033, 0.8733,0.8733, 0.8783, 0.8833, 0.8933, 0.9033, 0.8733,0.8893, 0.9133, 0.9433, 0.9133, 0.9033, 0.8733,0.8733, 0.8783, 0.8833, 0.8933, 0.9033, 0.8733,0.8893, 0.9133, 0.9433, 0.9133, 0.9033, 0.8733],
                tooltip: {
                }
            }],
            
        });
        
        // Create the chart2
        $('#container2').highcharts('StockChart', {
        	chart:{
        		backgroundColor: '#000000'
        	},	
        	colors: ['#00ff00','#00CD00'],
        	credits: {
                enabled: false
            },
            scrollbar: {
                enabled: false
            },
            navigator: {
                enabled: false
            },
            rangeSelector: {
            	enabled: false
            },
            subtitle: {
                text: '模拟量通道2:宁海线电压B相',
                align: 'left',
                	style: {
                        color: '#00ff00',
                        fontWeight: 'bold'
                    }	
            },
            xAxis: {
                labels: {
                    enabled: false
                }
            },
            yAxis: {
                plotLines: [{
                    value: minRate,
                    color: 'green',
                    dashStyle: 'shortdash',
                    width: 2,
                    label: {
                    	useHTML: true,
                        text: '0.8732A',
                        style: {
                            color: '#EEC900',
                            fontWeight: 'bold'
                        }
                    }
                }, {
                    value: maxRate,
                    color: 'red',
                    dashStyle: 'shortdash',
                    width: 2,
                    label: {
                    	useHTML: true,
                        text: '0.9463A',
                        style: {
                            color: '#EEC900',
                            fontWeight: 'bold'
                        }
                    }
                }]
            },
            series: [{
                name: '当前电流(A):',
                data: [0.8733, 0.8783, 0.8833, 0.8933, 0.9033, 0.8733,0.8893, 0.9133, 0.9433, 0.9133, 0.9033, 0.8733,0.8733, 0.8783, 0.8833, 0.8933, 0.9033, 0.8733,0.8893, 0.9133, 0.9433, 0.9133, 0.9033, 0.8733,0.8733, 0.8783, 0.8833, 0.8933, 0.9033, 0.8733,0.8893, 0.9133, 0.9433, 0.9133, 0.9033, 0.8733,0.8733, 0.8783, 0.8833, 0.8933, 0.9033, 0.8733,0.8893, 0.9133, 0.9433, 0.9133, 0.9033, 0.8733,0.8733, 0.8783, 0.8833, 0.8933, 0.9033, 0.8733,0.8893, 0.9133, 0.9433, 0.9133, 0.9033, 0.8733,0.8733, 0.8783, 0.8833, 0.8933, 0.9033, 0.8733,0.8893, 0.9133, 0.9433, 0.9133, 0.9033, 0.8733,0.8733, 0.8783, 0.8833, 0.8933, 0.9033, 0.8733,0.8893, 0.9133, 0.9433, 0.9133, 0.9033, 0.8733],
                tooltip: {
                }
            }],
            
        });
        
        
 });




});
