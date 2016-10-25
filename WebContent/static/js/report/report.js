$(document).ready(function (){
	
	//date
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
	    if (seleType == "日报表") {
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
	    if (seleType == "月报表") {
	        n = 31;
	        var currentDate = new Date(a - 0 + n * 86400000);
	        var MonthStr = (currentDate.getMonth() + 1);
	        if (MonthStr.toString().length < 2) {
	            MonthStr = "0" + MonthStr;
	        }
	        $("#FDLDate").val(currentDate.getFullYear() + "-" + MonthStr);
	    }
	    if (seleType == "年报表") {
	        n = 372;
	        var currentDate = new Date(a - 0 + n * 86400000);
	        $("#FDLDate").val(currentDate.getFullYear());
	    }

	});
	//年月日总 按下切换日期控件
	$(".TypeButton").click(function () {

	    //切换选中样式
	    $(".TypeButton").removeClass("TypeButtonSele");
	    $(this).addClass("TypeButtonSele");

	    //修改时间控件
	    var seleType = $(this).val();
	    var currentDate = new Date();
	    $("#FDLDate").removeAttr("disabled").removeAttr("onfocus");
	    if (seleType == "日报表") {
	        $("#FDLDate").attr("onfocus", "javascript:WdatePicker({ onpicked: function () {},skin: 'whyGreen', lang: 'zh-cn',isShowClear: false,dateFmt: 'yyyy-MM-dd',minDate: '2015-01-01',maxDate: '%y-%M-%d'})");
	        $("#FDLDate").val(currentDate.getFullYear() + "-" + (currentDate.getMonth() + 1) + "-" + currentDate.getDate());
	    }
	    if (seleType == "月报表") {
	        $("#FDLDate").attr("onfocus", "javascript:WdatePicker({ onpicked: function () {},skin: 'whyGreen', lang: 'zh-cn',isShowClear: false,dateFmt: 'yyyy-MM',minDate: '2015-01',maxDate: '%y-%M'})");
	        $("#FDLDate").val(currentDate.getFullYear() + "-" + (currentDate.getMonth() + 1));
	    }
	    if (seleType == "年报表") {
	        $("#FDLDate").attr("onfocus", "javascript:WdatePicker({ onpicked: function () {},skin: 'whyGreen', lang: 'zh-cn',isShowClear: false,dateFmt: 'yyyy',minDate: '2015',maxDate: '%y'})");
	        $("#FDLDate").val(currentDate.getFullYear());
	    }
	    if (seleType == "总") {
	        $("#FDLDate").attr("disabled", "disabled");
	    }
	});
	//date end
	/*
	 * 焦点切换
	 
	 $(".pricing-table").on("mouseenter",function(){
		 $(".pricing-table").removeClass("featured");
		 $(this).addClass("featured");
         
	 });*/

	 $(".strong").click(function () {
		 $("#content").html("");
		 //alert($(this).find(".hide").text());
		 var id = $(this).find(".hide").text();
		 location.href="/Ied/GetIedreport?id="+id;
	 });
	 
});//ready

//checkbox全选全不选
function selectStation(){
		if($(".checkstation").prop("checked")){
		$(".checkstation").prop("checked", false);
		}
		else{
			$(".checkstation").prop("checked", true);
		}
}

function selectIed(){
	if($(".checkIed").prop("checked")){
	$(".checkIed").prop("checked", false);
	}
	else{
		$(".checkIed").prop("checked", true);
	}
}
function selectReport(){
	if($("*[name='checkReport']").prop("checked")){
		$("*[name='checkReport']").prop("checked",false);
	}
	else{
		$("*[name='checkReport']").prop("checked",true);
	}
	
}




//弹窗不用了
var iWidth = 500;
var iHeight = 300;
var iTop = (window.screen.availHeight - 30 - iHeight) / 2;
var iLeft = (window.screen.availWidth - 10 - iWidth) / 2;
function winpop(){
window.open("report2.jsp", "弹出窗口", "width=" + iWidth + ", height=" + iHeight + ",top=" + iTop + ",left=" + iLeft + ",toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no,alwaysRaised=yes,depended=yes");
}
	
//excel2
function isIE() { //ie?
    if (!!window.ActiveXObject || "ActiveXObject" in window)
        return true;
    else
        return false;
}
function getXlsFromTbl(inTblId, inWindow) {
    try {
        var allStr = "";
        var curStr = "";
        var fileName = getExcelFileName();
        //                var cc = document.all;
        //                var ccc = typeof (document.all)
        //                alert(cc)
        //                alert(ccc)
        if (inTblId != null && inTblId != "" && inTblId != "null") {
            var hh = isIE();
            if (hh == true) //IE浏览器
            {
                curStr = getTblData(inTblId, inWindow);
                if (curStr != null) {
                    allStr += curStr;
                }
                else {
                    alert("你要导出的表不存在！");
                    return;
                }
                doFileExport(fileName, allStr);
            } else {
                curStr = getTblData1(inTblId, inWindow);
                if (curStr != null) {
                    allStr += curStr;
                }
                else {
                    alert("你要导出的表不存在！");
                    return;
                }
                var uri = 'data:text/xls;charset=utf-8,\ufeff' + encodeURIComponent(allStr);
                //创建a标签模拟点击下载
                var downloadLink = document.createElement("a");
                downloadLink.href = uri;
                downloadLink.download = fileName;
                document.body.appendChild(downloadLink);
                downloadLink.click();
                document.body.removeChild(downloadLink);
            }
        }
    }
    catch (e) {
        alert("导出发生异常:" + e.name + "->" + e.description + "!");
    }
}


function getTblData(inTbl, inWindow) {
    var rows = 0;
    //alert("getTblData is " + inWindow); 
    var tblDocument = document;
    if (!!inWindow && inWindow != "") {
        if (!document.all(inWindow)) {
            return null;
        }
        else {
            tblDocument = eval(inWindow).document;
        }
    }
    var curTbl = tblDocument.getElementById(inTbl);
    var outStr = "";
    if (curTbl != null) {
        for (var j = 0; j < curTbl.rows.length; j++) {
            //alert("j is " + j); 
            for (var i = 0; i < curTbl.rows[j].cells.length; i++) {
                //alert("i is " + i); 
                if (i == 0 && rows > 0) {
                    outStr += " \t";
                    rows -= 1;
                }
                outStr += curTbl.rows[j].cells[i].innerHTML + " \t";
                if (curTbl.rows[j].cells[i].colSpan > 1) {
                    for (var k = 0; k < curTbl.rows[j].cells[i].colSpan - 1; k++) {
                        outStr += " \t";
                    }
                }
                if (i == 0) {
                    if (rows == 0 && curTbl.rows[j].cells[i].rowSpan > 1) {
                        rows = curTbl.rows[j].cells[i].rowSpan - 1;
                    }
                }
            }
            outStr += "\r\n";
        }
    }
    else {
        outStr = null;
        alert(inTbl + "不存在!");
    }
    return outStr;
}
function getTblData1(inTbl, inWindow) {
    var rows = 0;
    var tblDocument = document;
    //tblDocument = eval(inWindow).document;
    var curTbl = tblDocument.getElementById(inTbl);
    var outStr = "";
    if (curTbl != null) {
        for (var j = 0; j < curTbl.rows.length; j++) {
            for (var i = 0; i < curTbl.rows[j].cells.length; i++) {

                if (i == 0 && rows > 0) {
                    outStr += ","; // \t";
                    rows -= 1;
                }

                outStr += curTbl.rows[j].cells[i].innerHTML + ","; //\t";
                if (curTbl.rows[j].cells[i].colSpan > 1) {
                    for (var k = 0; k < curTbl.rows[j].cells[i].colSpan - 1; k++) {
                        outStr += ","; // \t";
                    }
                }
                if (i == 0) {
                    if (rows == 0 && curTbl.rows[j].cells[i].rowSpan > 1) {
                        rows = curTbl.rows[j].cells[i].rowSpan - 1;
                    }
                }
            }
            outStr += "\r\n";
        }
    }
    else {
        outStr = null;
        alert(inTbl + "不存在 !");
    }
    return outStr;
}
function getExcelFileName() {
    var d = new Date();
    var curYear = d.getYear();
    var curMonth = "" + (d.getMonth() + 1);
    var curDate = "" + d.getDate();
    var curHour = "" + d.getHours();
    var curMinute = "" + d.getMinutes();
    var curSecond = "" + d.getSeconds();
    if (curMonth.length == 1) {
        curMonth = "0" + curMonth;
    }
    if (curDate.length == 1) {
        curDate = "0" + curDate;
    }
    if (curHour.length == 1) {
        curHour = "0" + curHour;
    }
    if (curMinute.length == 1) {
        curMinute = "0" + curMinute;
    }
    if (curSecond.length == 1) {
        curSecond = "0" + curSecond;
    }
    var fileName = curYear + curMonth + curDate + "_"
    + curHour + curMinute + curSecond + ".xls";
    //alert(fileName); 
    return fileName;
}
function doFileExport(inName, inStr) {
    var xlsWin = null;
    if (!!document.all("glbHideFrm")) {
        xlsWin = glbHideFrm;
    }
    else {
        var width = 6;
        var height = 4;
        var openPara = "left=" + (window.screen.width / 2 - width / 2)
+ ",top=" + (window.screen.height / 2 - height / 2)
+ ",scrollbars=no,width=" + width + ",height=" + height;
        xlsWin = window.open("", "_blank", openPara);
    }
    xlsWin.document.write(inStr);
    xlsWin.document.close();
    xlsWin.document.execCommand('Saveas', true, inName);
    xlsWin.close();
}
//excel2

//---------------------------------------
//弹窗2
function alertMsg(msg, mode) { //mode为空，即只有一个确认按钮，mode为1时有确认和取消两个按钮
    msg = msg || '';
    mode = mode || 0;
    var top = document.body.scrollTop || document.documentElement.scrollTop;
    var isIe = (document.all) ? true : false;
    var isIE6 = isIe && !window.XMLHttpRequest;
    var sTop = document.documentElement.scrollTop || document.body.scrollTop;
    var sLeft = document.documentElement.scrollLeft || document.body.scrollLeft;
    var winSize = function(){
        var xScroll, yScroll, windowWidth, windowHeight, pageWidth, pageHeight;
        // innerHeight获取的是可视窗口的高度，IE不支持此属性
        if (window.innerHeight && window.scrollMaxY) {
            xScroll = document.body.scrollWidth;
            yScroll = window.innerHeight + window.scrollMaxY;
        } else if (document.body.scrollHeight > document.body.offsetHeight) { // all but Explorer Mac
            xScroll = document.body.scrollWidth;
            yScroll = document.body.scrollHeight;
        } else { // Explorer Mac...would also work in Explorer 6 Strict, Mozilla and Safari
            xScroll = document.body.offsetWidth;
            yScroll = document.body.offsetHeight;
        }

        if (self.innerHeight) {    // all except Explorer
            windowWidth = self.innerWidth;
            windowHeight = self.innerHeight;
        } else if (document.documentElement && document.documentElement.clientHeight) { // Explorer 6 Strict Mode
            windowWidth = document.documentElement.clientWidth;
            windowHeight = document.documentElement.clientHeight;
        } else if (document.body) { // other Explorers
            windowWidth = document.body.clientWidth;
            windowHeight = document.body.clientHeight;
        }

        // for small pages with total height less then height of the viewport
        if (yScroll < windowHeight) {
            pageHeight = windowHeight;
        } else {
            pageHeight = yScroll;
        }

        // for small pages with total width less then width of the viewport
        if (xScroll < windowWidth) {
            pageWidth = windowWidth;
        } else {
            pageWidth = xScroll;
        }

        return{
            'pageWidth':pageWidth,
            'pageHeight':pageHeight,
            'windowWidth':windowWidth,
            'windowHeight':windowHeight
        }
    }();
    //alert(winSize.pageWidth);
    //遮罩层
    var styleStr = 'top:0;left:0;position:absolute;z-index:10000;background:#666;width:' + winSize.pageWidth + 'px;height:' +  (winSize.pageHeight + 30) + 'px;';
    styleStr += (isIe) ? "filter:alpha(opacity=80);" : "opacity:0.8;"; //遮罩层DIV
    var shadowDiv = document.createElement('div'); //添加阴影DIV
    shadowDiv.style.cssText = styleStr; //添加样式
    shadowDiv.id = "shadowDiv";
    //如果是IE6则创建IFRAME遮罩SELECT
    if (isIE6) {
        var maskIframe = document.createElement('iframe');
        maskIframe.style.cssText = 'width:' + winSize.pageWidth + 'px;height:' + (winSize.pageHeight + 30) + 'px;position:absolute;visibility:inherit;z-index:-1;filter:alpha(opacity=0);';
        maskIframe.frameborder = 0;
        maskIframe.src = "about:blank";
        shadowDiv.appendChild(maskIframe);
    }
    document.body.insertBefore(shadowDiv, document.body.firstChild); //遮罩层加入文档
    //弹出框
    var styleStr1 = 'display:block;position:fixed;_position:absolute;left:' + (winSize.windowWidth / 2 - 200) + 'px;top:' + (winSize.windowHeight / 2 - 150) + 'px;_top:' + (winSize.windowHeight / 2 + top - 150)+ 'px;'; //弹出框的位置
    var alertBox = document.createElement('div');
    alertBox.id = 'alertMsg';
    alertBox.style.cssText = styleStr1;
    //创建弹出框里面的内容P标签
    var alertMsg_info = document.createElement('P');
    alertMsg_info.id = 'alertMsg_info';
    alertMsg_info.innerHTML = msg;
    alertBox.appendChild(alertMsg_info);
    //创建按钮
    var btn1 = document.createElement('a');
    btn1.id = 'alertMsg_btn1';
    btn1.href = 'javas' + 'cript:void(0)';
    btn1.innerHTML = '<cite>确定</cite>';
    btn1.onclick = function () {
        document.body.removeChild(alertBox);
        document.body.removeChild(shadowDiv);
        return true;
    };
    alertBox.appendChild(btn1);
    if (mode === 1) {
        var btn2 = document.createElement('a');
        btn2.id = 'alertMsg_btn2';
        btn2.href = 'javas' + 'cript:void(0)';
        btn2.innerHTML = '<cite>取消</cite>';
        btn2.onclick = function () {
            document.body.removeChild(alertBox);
            document.body.removeChild(shadowDiv);
            return false;
        };
        alertBox.appendChild(btn2);
    }
    document.body.appendChild(alertBox);

}
//弹窗end

/*var idTmr;  
function  getExplorer() {  
    var explorer = window.navigator.userAgent ;  
    //ie  
    if (explorer.indexOf("MSIE") >= 0) {  
        return 'ie';  
    }  
    //firefox  
    else if (explorer.indexOf("Firefox") >= 0) {  
        return 'Firefox';  
    }  
    //Chrome  
    else if(explorer.indexOf("Chrome") >= 0){  
        return 'Chrome';  
    }  
    //Opera  
    else if(explorer.indexOf("Opera") >= 0){  
        return 'Opera';  
    }  
    //Safari  
    else if(explorer.indexOf("Safari") >= 0){  
        return 'Safari';  
    }  
}  
function exportExcel(tableid) {  
    if(getExplorer()=='ie')  
    {  
        var curTbl = document.getElementById(tableid);  
        var oXL = new ActiveXObject("Excel.Application");  
        var oWB = oXL.Workbooks.Add();  
        var xlsheet = oWB.Worksheets(1);  
        var sel = document.body.createTextRange();  
        sel.moveToElementText(curTbl);  
        sel.select();  
        sel.execCommand("Copy");  
        xlsheet.Paste();  
        oXL.Visible = true;  

        try {  
            var fname = oXL.Application.GetSaveAsFilename("Excel.xls", "Excel Spreadsheets (*.xls), *.xls");  
        } catch (e) {  
            print("Nested catch caught " + e);  
        } finally {  
            oWB.SaveAs(fname);  
            oWB.Close(savechanges = false);  
            oXL.Quit();  
            oXL = null;  
            idTmr = window.setInterval("Cleanup();", 1);  
        }  

    }  
    else  
    {  
        tableToExcel(tableid)  
    }  
}  
function Cleanup() {  
    window.clearInterval(idTmr);  
    CollectGarbage();  
}  
var tableToExcel = (function() {  
    var uri = 'data:application/vnd.ms-excel;base64,',  
            template = '<html><head><meta charset="UTF-8"></head><body><table>{table}</table></body></html>',  
            base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) },  
            format = function(s, c) {  
                return s.replace(/{(\w+)}/g,  
                        function(m, p) { return c[p]; }) }  
    return function(table, name) {  
        if (!table.nodeType) table = document.getElementById(table)  
        var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}  
        window.location.href = uri + base64(format(template, ctx))  
    }  
})()
*/

