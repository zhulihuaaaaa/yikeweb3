$(document).ready(function (){
	var station_id = $("#stationid").html();
//跳转功能
	$("#returnB").click(function(){
		location.href="BDZ2.jsp";
	});
	$("#returnMachine").click(function(){
		location.href="machine5.jsp";
	});
	$(".single").click(function(){
		location.href="singleMachine3.jsp";
	});
//搜索功能
	
	$("#searchbutton").click(function(){
		var val = $("#textsearch").val();
		 if(val.indexOf("#")!=-1){
			 	val = val.replace("#","");
			 	//alert(val);
				location.href="/yikeWeb/AlarmServlet?method=findByMachine&name="+val;
			  }else{
				//alert(111);
				location.href="/yikeWeb/AlarmServlet?method=findByMachine&name="+val;
			  }
	});
	 
//分布图	  
		    var arr = [];
		    $.ajax({
		    	url:"/alarmpie/Alarmpie",
		    	data:{id:station_id},
		        type: "POST",
		        datatype: 'json',
		        success: function (data) {
		        	var model = $.parseJSON(data);
		        	
		        	 //圆分布图
				    var optionspie = new Highcharts.Chart({
				        chart: {
				        	renderTo: 'circle',
				            plotBackgroundColor: null,
				            plotBorderWidth: null,
				            plotShadow: false,
				        },
				        title:null,
				        tooltip: {
				    	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
				        },
				        colors: ['#ba4c32','#ba4c32', '#FF9655','#FF9655','#FFF263', '#FFF263','#CAE8EA', '#CAE8EA','#CAE8EA','#CAE8EA','#CAE8EA','#CAE8EA'],
				        plotOptions: {
				            pie: {
				            	size: '70%',
				            	innerSize:'0%',
				                allowPointSelect: true,
				                cursor: 'pointer',
				                dataLabels: {
				                	distance:1,//数据标签距离饼图边缘的距离，为负数就越靠近饼图圆心
				                    enabled: true,
				                    color: '#000000',
				                    connectorColor: '#000000',
				                    format: '<b>{point.name}</b>: {point.percentage:.1f} %'
				                }
				            }
				        },
				        series: [{
				            type: 'pie',
				            name: '告警所占百分比',
				            data: []
				        }]
				    });
				    
				    $.each(model, function (i, v) {
		        		//console.log(i);
		        		//console.log(v);
		        		arr.push([v.name,eval(v.iedcount)]);
		        		optionspie.series[0].setData(arr);
				    });
				    
		        }
		    });
//end 分布图	   
//告警环比
		    $.ajax({
		    	url:"/alarmchart/Alarmchart",
		    	data:{id:station_id},
		        type: "POST",
		        datatype: 'json',
		        success: function (data) {
		        	var obj = eval("("+data+")");   
		        	var chartlist=JSON.stringify(obj["AlarmchartList"]);
		        	var chartlist2=JSON.stringify(obj["AlarmchartList2"]);
		        	//alert(last);
	                //alert("chartlist:"+obj["chartlist"]);
		        var model1 = $.parseJSON(chartlist);
		        var model2 = $.parseJSON(chartlist2);
		        	var options = {
		            chart: {
		            	renderTo: 'container22',
		                zoomType: 'x'
		            },
		            title: {
		                text: ''
		            },
		            subtitle: {
		                text: document.ontouchstart === undefined ?
		                '在绘图区域中单击并拖动可缩放' :
		                '拖动图表放大',
		                fontSize:5
		            },
		            xAxis: {
		            	categories: []
		            },
		            yAxis: {
		                title: {
		                    text: '事件数'
		                },
		            tickPositions: [0, 100, 200]
		            },
		            plotOptions: {
		                area: {
		                    marker: {
		                        enabled: false,
		                        symbol: 'circle',
		                        radius: 2,
		                        states: {
		                            hover: {
		                                enabled: true
		                            }
		                        }
		                    },
		                    lineWidth: 1,
		                    states: {
		                        hover: {
		                            lineWidth: 1
		                        }
		                    },
		                    threshold: null
		                }
		            },
		            series: [{
		                type: 'area',
		                name: '今天告警数',
		                data: []
		            },{
		                type: 'area',
		                name: '昨天告警数',
		                data: []
		            }]
		        };
		        	
		        	
		        	count(model1,0);
		        	count(model2,1);
		        	function count(model,n) {
		        	var i,ii,s=0,len=model.length;
		        	var arr1=[];
		        	var hour,total=0;
		        	var iii=0;
		        	for(i=0;i<len;i++){
		        		hour = model[i].hour.substr(0,2);
		        		total=eval(model[i].total)
		        		arr1.push([hour,total]);
		        		
		        	}
	            for( i=0;i<24;i++){
	            	ii=i;
	            	if(i<10){
	            	  ii = "0"+i;
	            	}
	            	
	            	for(iii=0;iii<len;iii++){
	            	if(ii == arr1[iii][0]){
	            		/*console.log(arr1[iii][0]);
	            		console.log(ii);
	            		console.log(i);*/
	            		options.series[n].data[i] = eval(arr1[iii][1]);
	            		break;
	            	}
	            	else{
	            		options.xAxis.categories[i]=ii;
		            	options.series[n].data[i] = 0;
	            	}
	            	}
	            	
	            	}
		        	}
	            var chart = new Highcharts.Chart(options);
		        }
		    });
//告警环比end
});


/*//扇形图调用
var chartlen = 8;
for (var i=1;i<=chartlen;i++)
{
	chart($('.chart'+ i));
} 

//扇形图
 function chart(chartA) {
	var gaugeOptions = {
	        chart: {
	            type: 'solidgauge'
	        },
	        title: null,
	        pane: {
	            center: ['50%', '100%'],
	            size: '180%',
	            startAngle: -90,
	            endAngle: 90,
	            background: {
	                backgroundColor:'#ffffff',
	                innerRadius: '60%',
	                outerRadius: '100%',
	                shape: 'arc'
	            }
	        },
	        tooltip: {
	            enabled: false
	        },
	        // the value axis
	        yAxis: {
	            stops: [
					[0.8, '#EE0000'], // red
					[0.8, '#DDDF0D'], // yellow
					[0.9, '#55BF3B'] // green
	            ],
	            lineWidth: 0,
	            minorTickInterval: null,
	            tickPixelInterval: 400,
	            tickWidth: 0,
	            title: {
	                y: -70
	            },
	            labels: {
	                y: 16
	            }
	        },
	        plotOptions: {
	            solidgauge: {
	                dataLabels: {
	                    y: 20,
	                    borderWidth: 0,
	                    useHTML: true
	                }
	            }
	        }
	    };
	
	  chartA.highcharts(Highcharts.merge(gaugeOptions, {
		 
   yAxis: {
       min: 0,
       max: 100
   },
   credits: {
       enabled: false
   },
   series: [{
       name: '设备',
       data: [70],
       dataLabels: {
      	 format: '<div style="text-align:center"><span style="font-size:20px;color:' +
           ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y}</span><br/>' +
           '<span style="font-size:8px;color:silver">分</span></div>'
       },
       tooltip: {
           valueSuffix: 'percent'
       }
   }]
}));
}
//扇形图end
*/
/*
//折线图		
	    $('.chartRow').highcharts({
	        chart: {
	            type: 'column'
	        },
	        title:null,
	        xAxis: {
	            categories: ['当前', '昨天']
	        },
	        yAxis: {
	            title: {
	                text: '告警次数 '
	            }
	        },
	        colors: ['#ba4c32', '#FF9655', '#FFF263', '#CAE8EA', '#6AF9C4'],
	        tooltip: {
	            enabled: false,
	            formatter: function() {
	                return '<b>'+ this.series.name +'</b><br/>'+this.x +': '+ this.y +'°C';
	            }
	        },
	        plotOptions: {
	            line: {
	                dataLabels: {
	                    enabled: true
	                },
	                enableMouseTracking: false
	            }
	        },
	        series: [{
	            name: '1#进线',
	            data: [1, 2]
	        },{
	            name: '2#进线',
	            data: [2, 3]
	        },{
	            name: '2#出线',
	            data: [2, 2]
	        },{
	            name: '1#PT',
	            data: [1, 2]
	        }
	        ]
	    });
//折线图end
*/	
