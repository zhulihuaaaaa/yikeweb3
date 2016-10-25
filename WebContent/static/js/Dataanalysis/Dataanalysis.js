$(function (){
	 var station_id = $("#stationid").html();
	$("#enterStation").click(function(){
		location.href="/Ied/GetIed2?id="+station_id;
/*		"<a href='/station/GetSingleStation?id="+ID+"'>进入变电站</a>";*/
	});
	
	refreshOnTime(); //首次立即加载  
    window.setInterval(refreshOnTime, 1000000); //执行！！  15分钟间隔
    window.setInterval(function() 
			{ 
    	GetDayFDL(station_id);
			}, 1000000); //执行！！  GetDayFDL(station_id), 

	//初始化日期
    var currentDate = new Date();
    var currentDateStr = currentDate.getFullYear() + "-" + (currentDate.getMonth() + 1) + "-" + currentDate.getDate();
    $("#FDLDate").val(currentDateStr);
   
    //初始化状态曲线图表
    GetFDL(station_id);
    
    //年月日总 按下切换日期控件
    $(".TypeButton").click(function () {

        //切换选中样式
        $(".TypeButton").removeClass("TypeButtonSele");
        $(this).addClass("TypeButtonSele");

        //修改时间控件
        var seleType = $(this).val();
        var currentDate = new Date();
        $("#FDLDate").removeAttr("disabled").removeAttr("onfocus");
        if (seleType == "日") {
            $("#FDLDate").attr("onfocus", "javascript:WdatePicker({ onpicked: function () {},skin: 'whyGreen', lang: 'zh-cn',isShowClear: false,dateFmt: 'yyyy-MM-dd',minDate: '2012-01-01',maxDate: '%y-%M-%d'})");
            $("#FDLDate").val(currentDate.getFullYear() + "-" + (currentDate.getMonth() + 1) + "-" + currentDate.getDate());
        }
        if (seleType == "月") {
            $("#FDLDate").attr("onfocus", "javascript:WdatePicker({ onpicked: function () {},skin: 'whyGreen', lang: 'zh-cn',isShowClear: false,dateFmt: 'yyyy-MM',minDate: '2012-01',maxDate: '%y-%M'})");
            $("#FDLDate").val(currentDate.getFullYear() + "-" + (currentDate.getMonth() + 1));
        }
        if (seleType == "年") {
            $("#FDLDate").attr("onfocus", "javascript:WdatePicker({ onpicked: function () {},skin: 'whyGreen', lang: 'zh-cn',isShowClear: false,dateFmt: 'yyyy',minDate: '2012',maxDate: '%y'})");
            $("#FDLDate").val(currentDate.getFullYear());
        }
        if (seleType == "总") {
            $("#FDLDate").attr("disabled", "disabled");
        }

        GetFDL(station_id);
    });

    //日期加增 按钮
    $("#FDLDate").prev().click(function () {
        var b = $("#FDLDate").val();
        var a = new Date(b);

        n = 1;
        var currentDate = new Date(a - 0 - n * 86400000);
        var seleType = $(".TypeButtonSele").val();
        if (seleType == "日报表") {

            var MonthStr = (currentDate.getMonth() + 1);

            if (MonthStr.toString().length < 2) {
                MonthStr = "0" + MonthStr;
            }


            var dayStr = currentDate.getDate();
            if (dayStr.toString().length < 2) {
                dayStr = "0" + dayStr;
            }

            $("#FDLDate").val(currentDate.getFullYear() + "-" + MonthStr + "-" + dayStr);
        }
        if (seleType == "月报表") {

            var MonthStr = (currentDate.getMonth() + 1);
            if (MonthStr.toString().length < 2) {
                MonthStr = "0" + MonthStr;
            }


            $("#FDLDate").val(currentDate.getFullYear() + "-" + MonthStr);
        }
        if (seleType == "年报表") {

            $("#FDLDate").val(currentDate.getFullYear());
        }
    });

    $("#FDLDate").next().click(function () {
        var b = $("#FDLDate").val();
        var a = new Date(b);
        n = 1;
        var currentDate = new Date(a - 0 + n * 86400000);
        var seleType = $(".TypeButtonSele").val();
        if (seleType == "日") {
            n = 1;
            var currentDate = new Date(a - 0 + n * 86400000);
            var MonthStr = (currentDate.getMonth() + 1);
            if (MonthStr.toString().length < 2) {
                MonthStr = "0" + MonthStr;
            }

            var dayStr = currentDate.getDate();
            if (dayStr.toString().length < 2) {
                dayStr = "0" + dayStr;
            }

            $("#FDLDate").val(currentDate.getFullYear() + "-" + MonthStr + "-" + dayStr);
        }
        if (seleType == "月") {
            n = 31;
            var currentDate = new Date(a - 0 + n * 86400000);
            var MonthStr = (currentDate.getMonth() + 1);
            if (MonthStr.toString().length < 2) {
                MonthStr = "0" + MonthStr;
            }
            $("#FDLDate").val(currentDate.getFullYear() + "-" + MonthStr);
        }
        if (seleType == "年") {
            n = 372;
            var currentDate = new Date(a - 0 + n * 86400000);
            $("#FDLDate").val(currentDate.getFullYear());
        }

    });


});/*ready部分结束*/

//更新chart大小
function updateChartSize()
{
	var height = $(window).height(); //获取窗体高度
	var width= $(window).widht(); //获取窗体宽度
	//如果是页面内容高宽可以将window替换为document即可
	//动态修改容器大小
	$("#divChart").height(height);
	$("#divChart").width(width);
}

//初始化仪表盘
function refreshOnTime(){
	 var station_id = $("#stationid").html();
	$.ajax({
	url:"/station/RealstationPOST",
	data:{id:station_id},
    type: "POST",
    datatype: 'json',
    success: function (data) {
    	//alert(data.constructor.name);
    	var aa = JSON.parse(data);
   	 var a = JSON.stringify(aa.data);
   	 var model = $.parseJSON(a);
    	//alert(model.score);
    	//alert(gaugeOptions.series[0].data);
    	//gaugeOptions.series[0].setData(eval(model.score));这里为什么不能用setData呢
   	 	/*$(window).resize(function() 
   			{    
   		 		gaugeOptions.setSize(
   			       $(document).width(), 
   			       $(document).height()/30,
   			       false
   			    );   
   			});*/
    	var gaugeOptions = new Highcharts.Chart({
            chart: {
            	renderTo: 'mygauge',
                type: 'solidgauge',
            },
            title: null,
            pane: {
                center: ['50%', '95%'],
                size: '180%',
                startAngle: -90,
                endAngle: 90,
                background: {
                    innerRadius: '60%',
                    outerRadius: '100%',
                    shape: 'arc'
                }
            },
            credits: {
            },
            tooltip: {
            	enabled: false
            },
            // the value axis
            yAxis: {
            	 min: 0,
                 max: 100,
                stops: [
                    [0, '#EE0000'], // red
                    [0.8, '#FF8C00'], // orange
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
                	enabled: false
                }
            },
            plotOptions: {
                solidgauge: {
                    dataLabels: {
                    	enabled: true,
                        y: 20,
                        borderWidth: 0,
                        useHTML: true
                    }
                }
            },
            series: [{
            	data: [eval(model.score)],
            	cursor: 'pointer',
            	events: {
    	            click:function(){
    	                location.href="machine5.jsp"
    	            }
    	        },
                dataLabels: {
                	 format: '<div style="text-align:center"><span style="font-size:25px;color:' +
                     ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y}</span><br/>' +
                     '<span style="font-size:8px;color:silver">分</span></div>'
                },
                tooltip: {
                }
            }]
            
        });
    
    }
});
}

function GetFDL(station_id) {

    $("#myPower").html("<img style=' margin-top:80px;' src='static/img/loading.gif'/>");

    var charttype = 0;
    var strChartType = $(".TypeButtonSele").val();

    var startdate = $("#FDLDate").val();
 
    if (strChartType == "日") {

        charttype = 0;

        GetDayFDL(station_id);
    }
    else if (strChartType == "月") {
        charttype = 1;
        GetMonthFDL(charttype,station_id);
    }
    else if (strChartType == "年") {
        charttype = 2;
        GetYearFDL(charttype);
    }
    else if (strChartType == "总") {
        charttype = 3;
        GetTotalFDL(charttype);
    }





}

function GetDayFDL(station_id) {


    $.ajax({
    	url:"/station/StationHis",
    	data:{id:station_id},
        type: "POST",
        datatype: 'json',
        success: function (data) {
        	/*var aa = JSON.parse(data);
          	 var a = JSON.stringify(aa.data);
          	alert(a);
          	 var model = $.parseJSON(a);*/
        	var model = $.parseJSON(data);           var options = {
            	chart: {
                        renderTo: 'myPower', 
            	},
            	title: {
		            text: '变电站状态时刻评估表（0~24h）'
		        },
                subtitle: null,
                xAxis: {
                    categories: []
                },
                yAxis: {
                    title: {
                        text: '状态分(%)'
                    },
                    plotLines: [{
                        color: '#808080'
                    }]
                }, credits: {
                    enabled: false
                },
                tooltip: {
                    shared: true,
                    valueSuffix: '分'
                },

                series: [{
                    name: '实时评分   (横轴数字表示小时)',
                    data: [],
                }]
            };
            
            var i,len=model.length;   
            for( i=0;i<len;i++){
            	//alert(model[i].time);
            	var s = model[i].time.substr(11,2);
            	options.xAxis.categories[i]=s;
            	options.series[0].data[i] = eval(model[i].score);
            }
          
            var chart = new Highcharts.Chart(options);
            
        }
    });


}

function GetMonthFDL(charttype,station_id) {

	 $.ajax({
	    	url:"/yikeWeb/real_station_his_webServlet",
	    	data:{method:"getData",id:station_id},
	        type: "POST",
	        datatype: 'json',
	        success: function (data) {
	            var model = $.parseJSON(data);
	            //alert(model);
	            var options = {
	            	chart: {
	                        renderTo: 'myPower', 
	                        type: 'column'
	            	},
	            	title: {
			            text: '变电站状态月评估表（每天）'
			        },
	                subtitle: null,
	                xAxis: {
	                    categories: []
	                },
	                yAxis: {
	                    title: {
	                        text: '状态分(%)'
	                    },
	                    plotLines: [{
	                        color: '#808080'
	                    }]
	                }, credits: {
	                    enabled: false
	                },
	                tooltip: {
	                    shared: true,
	                    valueSuffix: '分'
	                },
	                series: [{
	                    name: '实时评分 ',
	                    data: [],
	                }]
	            };

	            var i,len=model.length;   
	            alert(model.length);
	            for( i=0;i<len;i++){
	            	alert(model[i].score);
	            	var s = model[i].update_time.substr(11,5);
	            	options.xAxis.categories[i]=s;
	            	options.series[0].data[i] = eval(model[i].score);
	            }
	          
	            var chart = new Highcharts.Chart(options);
	            
	        }
	    });

}

function GetYearFDL(charttype) {

	 $.ajax({
	    	url:"/yikeWeb/Static_ownerServlet",
	    	data:{method:"testChart"},
	        type: "POST",
	        datatype: 'json',
        success: function (data) {
            var rmodel = $.parseJSON(data);

            $('#myPower').highcharts({
                chart: {
                    type: 'column'
                },
                title: '变电站状态年评估表',
                subtitle: null,
                xAxis: {
                    categories: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12']
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: '状态分(%)'
                    }
                },
                tooltip: {
                    headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                        '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true
                },
                plotOptions: {
                    column: {
                        pointPadding: 0.2,
                        borderWidth: 0
                    }
                },
                series: [{
                    name: '实时评分',
                    data: [99.5, 94.5, 98.4, 91.5, 95.2, 96.5,97.0, 96.9, 99.5, 94.5, 98.4, 91.5]

                }]
            });
        }
    });

}

function GetTotalFDL(charttype, startdate, stationid) {

}



																																																																																																																																													

