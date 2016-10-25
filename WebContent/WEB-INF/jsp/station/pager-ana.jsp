<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    <%--上一页 --%>
<c:choose>
	<c:when test="${anapb.pc eq 1 }"></c:when>
	<c:otherwise><a href="${anapb.url }&pc=${anapb.pc-1}" class="aBtn bold">上一页</a></c:otherwise>
</c:choose>
        
        
<%--我们需要计算页码列表的开始和结束位置，即两个变量begin和end
计算它们需要通过当前页码！
1. 总页数不足6页--> begin=1, end=最大页
2. 通过公式设置begin和end，begin=当前页-1，end=当前页+3
3. 如果begin<1，那么让begin=1，end=6
4. 如果end>tp, 让begin=tp-5, end=tp
 --%>
 <c:choose>
 	<c:when test="${anapb.tp <= 6 }">
 		<c:set var="begin" value="1"/>
 		<c:set var="end" value="${anapb.tp }"/>
 	</c:when>
 	<c:otherwise>
 		<c:set var="begin" value="${anapb.pc-2 }"/>
 		<c:set var="end" value="${anapb.pc + 3}"/>
 		<c:if test="${begin < 1 }">
 		  <c:set var="begin" value="1"/>
 		  <c:set var="end" value="6"/>
 		</c:if>
 		<c:if test="${end > anapb.tp }">
 		  <c:set var="begin" value="${anapb.tp-5 }"/>
 		  <c:set var="end" value="${anapb.tp }"/>
 		</c:if> 		
 	</c:otherwise>
 </c:choose>
 
 <c:forEach begin="${begin }" end="${end }" var="i">
   <c:choose>
   	  <c:when test="${i eq anapb.pc }">
   	  <a href="#" style="border-color:#8c3521; background:#ba4c32; color:#fff;">${i }</a>
   	  </c:when>
   	  <c:otherwise>
   	    <a href="${anapb.url }&pc=${i}">${i }</a>
   	  </c:otherwise>
   </c:choose>
           
          	
 </c:forEach>
    <%-- 计算begin和end --%>
      <%-- 如果总页数<=6，那么显示所有页码，即begin=1 end=${anapb.tp} --%>
        <%-- 设置begin=当前页码-2，end=当前页码+3 --%>
          <%-- 如果begin<1，那么让begin=1 end=6 --%>
          <%-- 如果end>最大页，那么begin=最大页-5 end=最大页 --%>


    
    <%-- 显示点点点 --%>
    <c:if test="${end < anapb.tp }">
      <span class="spanApostrophe">...</span>
    </c:if> 

    
     <%--下一页 --%>
<c:choose>
	<c:when test="${anapb.pc eq anapb.tp }"></c:when>
	<c:otherwise><a href="${anapb.url }&pc=${anapb.pc+1}" class="aBtn bold">下一页</a></c:otherwise>
</c:choose>
        
        
   
