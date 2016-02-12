<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>담당자정보</title>
</head>
<body>
  <div style="width:50%; margin: 0 auto;">
   <fieldset style="border-color: red;">
     <ul style="list-style: none;">
        <li>운송번호 : ${agent.waybil }</li>
        <li>담당자명 : ${agent.manager }</li>
        <li>전화번호 : ${agent.manager_phone }</li>
     </ul>
    </fieldset>
  </div>
  <br>
  <div style="text-align: center;">
  <button type="button" onclick="window.close();">닫기</button>
  </div>
</body>
</html>