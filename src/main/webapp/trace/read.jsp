<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.phone.trace.*" %>
<%@ page import="java.util.*" %>
<%@ page import="web.tool.*" %>
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 

<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript" src="../js/tool.js"></script>
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
 
<script type="text/javascript">
 $(function(){ 

});
 
 function agent(waybil, traceno){
     var win_file1 = window.open("./agent.do?waybil=" + waybil + "&traceno=" + traceno, '택배기사조회', 'width=650px, height=300px',
     'scrollbars=no');
    
    var x = (screen.width - 650) / 2;
    var y = (screen.height - 300) / 2;
    
    win_file1.moveTo(x, y);
 }
</script>
 <style type="text/css">
 * {
 font-size: 15px;
 }
 </style>
 
</head> 
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
<!-- ----------------------------------------- -->
 
<DIV style="width: 80%; margin: 0 auto; font-weight: bold; font-size: 1.5em;">배송조회<br>
 <span style="font-size: 13px; color: #AAAAAA;">고객님이 주문하신 상품에 대한 기본 배송정보입니다</span></DIV>
<DIV class='content'>
  <table border="1" style="border-collapse: collapse; width: 100%; text-align: center;">
    <colgroup>
      <col style="width:15%" />
      <col style="width:35%;" />
      <col style="width:15%;" />
      <col style="width:35%;"/>
    </colgroup>
    <tr>
      <td style="font-weight: bold; background-color:  #b3e0ff;">운송장 번호</td>
      <td>${read.waybil }</td>
      <td style="font-weight: bold; background-color:  #b3e0ff;">배송상태</td>
      <td>${read.trace_state }</td>
    </tr>
    <tr>
      <td style="font-weight: bold; background-color:  #b3e0ff;">배송지</td>
      <td colspan="3">(${read.resive_post }) ${read.resive_addr1} ${read.resive_addr2 } </td>
      
    </tr>
    <tr>
      <td style="font-weight: bold; background-color:  #b3e0ff;">수량</td>
      <td>${read.pcnt} 개</td>
      <td style="font-weight: bold; background-color:  #b3e0ff;">받는 분</td>
      <td>${read.resive_name }</td>
    </tr>
    <tr>
      <td style="font-weight: bold; background-color:  #b3e0ff;">품명명</td>
      <td colspan="3">${read.item }</td>
  </table>
</DIV>
<br>
<DIV style="width: 80%; margin: 0 auto; font-weight: bold; font-size: 1.5em;">배송현황<br>
 <span style="font-size: 13px; color: #AAAAAA;">담당자 이름을 클릭하면 연락처를 확인하실 수 있습니다.</span></DIV>
  <DIV class='content'>
  <table border="1" style="border-collapse: collapse; width:100%; text-align: center;">
      <colgroup>
        <col style="width:15%;"/>
        <col style="width:15%;"/>
        <col style="width:25%;" />
        <col style="width:15%;" />
        <col style="width:30%;" />
      </colgroup>
      <tr>
        <th style="background-color:  #b3e0ff;">일자</th>
        <th style="background-color:  #b3e0ff;">시각</th>
        <th style="background-color:  #b3e0ff;">대리점</th>
        <th style="background-color:  #b3e0ff;">담당자</th>
        <th style="background-color:  #b3e0ff;">구분</th>
     </tr>
     <tr>
  <%
       ArrayList list = (ArrayList)request.getAttribute("list");
  
       for (int i = 0; i < list.size(); i++) {
       TraceVO vo = (TraceVO)list.get(i);
      
       int a = Integer.parseInt(vo.getTdate().substring(11, 13));
       String p;
       if(a < 12){
         p = "오전";
       } else {
         p = "오후";
         a = a - 12;
       }
       %>
        <tr>
          <td><%=vo.getTdate().substring(0, 10)%></td>
          <td><%=p + "  " + a + ":" +vo.getTdate().substring(14, 19)%></td>
          <td><%=vo.getAgent() %></td>
          <td><a href="#" onclick="agent(<%=vo.getWaybil()%>, <%=vo.getTraceno()%>);"><%=vo.getManager() %></a></td>
          <td><%=vo.getContent() %></td>
        </tr>    
       <%} %>
  </table>
  </DIV>
  <div style="text-align: center;">
    <button type="button" onclick="window.close();">닫기</button>
  </div>
<!-- -------------------------------------------- -->
</body>
<!-- -------------------------------------------- -->
</html> 