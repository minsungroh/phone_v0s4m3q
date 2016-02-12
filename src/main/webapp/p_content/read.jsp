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
  
     <DIV>
          <fieldset style="width: 1000px; height: 500px; margin: 20px auto;">
         <br><br>
 
            <span style="margin-left: 50px; margin-top: 50px; "><IMG src = './storage/<%=Tool.checkNull(p_contentVO.getFile()) %>'></span>
            <span style="float: right; margin-right: 100px;"><%=p_contentVO.getTitle() %><br>
            <br>상품번호 : <%=p_contentVO.getP_contentno() %><br>
            <br>판매가 : <%=p_contentVO.getMoney() %><br>
            <br>배송비안내 : 50,000원 이상 구매시 무료배송<br>
            <br>소재 : <%=p_contentVO.getMeterial() %><br>
            <br>수량 : <input type="number" min='1' max='50' step='1' value='1'><br>
            <br>색상 : <select>
              <option value='Black'>Black</option>
	          <option value='Gray'>Gray</option>
	          <option value='Red'>Red</option>
	          <option value='Blue'>Blue</option>
	          <option value='Pink'>Pink</option>
            </select>
              
            </span>
            
            <button type='button' onclick="location.href='#'" style="margin-left: 600px;">바로구매</button>
            <button type='button' onclick="location.href='#'" >장바구니</button>
          
          </fieldset>
          </DIV>
  <DIV class='content'>
    <FORM name='frm' method="get" action='./update.do'>
      <input type="hidden" name="p_contentno" value="<%=p_contentVO.getP_contentno() %>">
      
     
      <fieldset class="fieldset">
        <ul>
         <%--  <li>
            <label for='title' class="label" style="width:150px;">제목 : </label>
            <span><%=p_contentVO.getTitle() %></span><br>
          </li> --%>
          
       
          <li>
            <label for='content' class="label" style="width:150px;">내용 : </label>
            <span><%=p_contentVO.getContent() %></span>
          </li>
 
          <li>
            <label for="file1" class="label" style="width:150px;">업로드 파일: </label>
            <div>
              <IMG src = './storage/<%=Tool.checkNull(p_contentVO.getFile1()) %>'><br>
            </div>
          </li>
           <li>
            <label for='money' class="label" style="width:150px;">가격 : </label>
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
