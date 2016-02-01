<%@ page contentType="text/html; charset=UTF-8" %>

<%
// 프로젝트 경로 자동 추출, Context root 명 자동 추출
// /ws_web/notice_v2jq -> /notice_v2jq
String root = request.getContextPath(); 
%>

<!-- 화면 상단 메뉴 --> 
<DIV style='text-align: left; margin: 0px; padding: 0px;'>
  ARTBox ver 0.7<br>
  <nav id="topMenu">
    <ul>
      <li><a class='menuLink' href='<%=root %>/index.do'>HOME</a></li>
      <%
      if (session.getAttribute("id") == null){
      %>
        <li><a class='menuLink' href='<%=root %>/member/login.do'>로그인</a></li>
      <%
      }else{
      %>
        <li><a class='menuLink' href="#">장바구니</a></li>      
        <li><a class='menuLink' href="#">마이페이지</a></li>
        <li><a class='menuLink' href="#">고객센터</a></li>
        <li><a class='menuLink' href='<%=root %>/member/logout.do'>로그아웃</a></li>      
      <%  
      }
      %>
      <!-- 필요한 메뉴 적어서 올리기 -->
      <li><a class='menuLink' href="#">Apple</a></li>
      <li><a class='menuLink' href="#">Samsung</a></li>
      <li><a class='menuLink' href="#">LG</a></li>
      <li><a class='menuLink' href="#">Sound</a></li>
      <li><a class='menuLink' href="#">Accessory</a></li>

      <%
      if (session.getAttribute("act") == null){
      %>
        <li><a class='menuLink' href='<%=root %>/admin1/login_ck_form.jsp'>Admin</a></li>
      <%
      }else{
      %>
        <li><a class='menuLink' href='<%=root %>/admin1/logout_proc.jsp'>Logout</a></li>
        <li><a class='menuLink' href='<%=root %>/admin1/list.jsp'>관리자</a></li>
      <%
      }
      %>
      
    </ul>
  </nav>

</DIV>

