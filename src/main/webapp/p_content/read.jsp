<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.phone.p_content.*" %>
<%@ page import="web.tool.Tool" %>

<% 
P_contentVO p_contentVO = (P_contentVO)request.getAttribute("p_contentVO");  
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

</head>
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
  <jsp:include page="/menu/top.jsp" flush='false' />
  <!-- ----------------------------------------- -->
  <div class='content_menu'>
    <A href='./list2.do?p_categoryno=<%=p_contentVO.getP_categoryno() %>'>${title } 게시판</A>｜
    <A href='./update.do?p_contentno=<%=p_contentVO.getP_contentno()%>'>글 수정</A>｜
    <A href='./delete.do?p_contentno=<%=p_contentVO.getP_contentno()%>&p_categoryno=<%=p_contentVO.getP_categoryno() %>'>글 삭제</A>
  </div> 
  <DIV class='content'>
    <FORM name='frm' method="get" action='./update.do'>
      <input type="hidden" name="p_contentno" value="<%=p_contentVO.getP_contentno() %>">
      
     
      <fieldset class="fieldset">
        <ul>
          <li>
            <label for='title' class="label" style="width:150px;">제목 : </label>
            <span><%=p_contentVO.getTitle() %></span><br>
          </li>
          <li>
            <label for='content' class="label" style="width:150px;">내용 : </label>
            <span><%=p_contentVO.getContent() %></span>
          </li>
 
          <li>
            <label for="file" class="label" style="width:150px;">Thumb 파일 : </label>
            <%=Tool.checkNull(p_contentVO.getFile()) %><br>
          </li>
          <li>
            <label for="file1" class="label" style="width:150px;">업로드 파일: </label>
            <div>
              <%=Tool.checkNull(p_contentVO.getFile1()) %><br>
            </div>
          </li>
           <li>
            <label for='money' class="label" style="width:150px;">내용 : </label>
            <span><%=p_contentVO.getMoney() %></span>
          </li>
          <li>
            <label for="replycnt" class="label" style="width:150px;">댓글수 : </label>
            <span><%=p_contentVO.getReplycnt() %></span>
          </li>
          <li>
            <label for="" class='label' style="width:150px;">블로그 카테고리 번호 : </label>
            <span><%=p_contentVO.getP_categoryno() %></span>
          </li> 
        </ul>
      </fieldset>
    </FORM>
  </DIV>

  <!-- -------------------------------------------- -->
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html>

