<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.phone.mypage.*" %>
<%@ page import="com.phone.payment.*" %>
<%@ page import="java.util.*" %>
<%@page import="java.text.DecimalFormat"%>
<%MypageVO mypageVO = (MypageVO)request.getAttribute("MypageVO");%>
<%PaymentVO paymentVO = (PaymentVO)request.getAttribute("PaymentVO");%>
<%DecimalFormat df = new DecimalFormat("#,###,###"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript" src="../js/tool.js"></script>
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script type="text/javascript">
	$(function() {
		// 사이트 메뉴 액션
		/* $("ul.nav li ul").hide();
		$("ul.nav li a").click(function(event) {
			$(this).siblings("ul").toggle("normal", "swing");
		}); */
		/* $("#start_year, #start_month, #end_year, #end_month").change(function() {
	         
	        var checkNum = 2;//3개월이면 2로 셋팅
	         
	        //선택된 값을 가져온다.
	        var startYear = $("#start_year option:selected").val();
	        var startMonth = $("#start_month option:selected").val();
	        var endYear = $("#end_year option:selected").val();
	        var endMonth = $("#end_month option:selected").val();
	        //계산을 위해 명시적으로 형변환
	        var startYearNum = Number(startYear);
	        var startMonthNum = Number(startMonth);
	        var endYearNum = Number(endYear);
	        var endMonthNum = Number(endMonth);
	         
	        //일단 차이를 재서 위에서 정한 월이 넘어가는지 확인  
	        var result = ((endYearNum*12)+endMonthNum) - ((startYearNum*12)+startMonthNum);
	                 
	        if(result>checkNum){
	             
	            alert("날짜 검색 범위는 "+(checkNum+1)+"개월 입니다.");
	             
	            if(endMonthNum<=checkNum){
	                startYearNum = endYearNum-1;
	                startMonthNum = 12-(checkNum-endMonthNum)
	            }else{
	                startYearNum = endYearNum;
	                startMonthNum = endMonthNum-checkNum;
	            }
	             
	            $("#start_year").val(startYearNum).attr("selected", "selected");
	            $("#start_month").val(startMonthNum).attr("selected", "selected");
	             
	        };
	    }); */
	});
	
	function trace(waybil, traceno) {
	    var win_file = window.open("../trace/read.do?waybil=" + waybil +"&traceno=" + traceno, '배송조회', 'width=800px, height=550px',
	        'scrollbars=no');

	    var x = (screen.width - 800) / 2;
	    var y = (screen.height - 550) / 2;

	    win_file.moveTo(x, y);
	  }
	
	
	 function detail_list(mno, orderno) {
	      var win_file = window.open("./detail_list.do?mno=" + mno +"&orderno=" + orderno, '주문상세보기', 'width=800px, height=600px',
	          'scrollbars=no');

	      var x = (screen.width - 800) / 2;
	      var y = (screen.height - 600) / 2;

	      win_file.moveTo(x, y);
	    }
	 
function update(mno, orderno, orderstate){
	if(orderstate != "complate"){
		var sm = confirm("배송완료가 되지 않은 제품을 구매확정하시겠습니까?");
		if(sm == true){
			location.href="./update.do?mno=" + mno + "&orderno=" + orderno;
		}
	} else {
			location.href="./update.do?mno=" + mno + "&orderno=" + orderno;
	}
}
</script>

<style>
a {
  text-decoration: none;
  font-size: 12px;
  color: #333;
}

ul, li {
  list-style: none;
  padding: 0;
  margin: 0;
}

ul.nav li ul {
  padding-left: 10px;
}

button{
 margin-bottom: 2%;
 width:40%;
}

button:hover{
  color: red;
  font-weight: bold;
}
</style>


</head>
<!-- ----------------------------------------- -->
<body leftmargin="0" topmargin="0">
  <jsp:include page="/menu/top.jsp" flush='false' />
  <!-- ----------------------------------------- -->

  <DIV class='title'>마이페이지</DIV>

  <DIV class='content'>
    <FORM name='frm' method='POST' action='./.jsp'>
      <fieldset>
        <legend class='legend'></legend>
        <div style="border: none;">
          <table border="1" style="border-collapse: collapse; width: 100%;">
              <colgroup>
                <col style="width:12%">
                <col style="width:12%">
                <col style="width:12%">
                <col style="width:12%">
                <col style="width:12%">
                <col style="width:12%">
                <col style="width:12%">
                <col style="width:12%">
              </colgroup>
              <tr>
              <%
              String grade = (String)request.getAttribute("grade");
              String gd = "";
              if(grade.equals("F")){
                gd = "새내기";
              } else if(grade.equals("D")){
                gd = "브론즈";
              } else if(grade.equals("C")){
                gd = "실버";
              } else if(grade.equals("B")){
                gd = "골드";
              } else if(grade.equals("A")){
                gd = "사파이어";
              } else if(grade.equals("S")){
                gd = "VIP";
              }
              %>
                <td style="font-size: 15px;">구매등급 : <%=gd %></td>
                <td style="font-size: 15px;">입금대기 : ${pay_wait } 건</td>
                <td style="font-size: 15px;">결재완료 : ${pay_ok } 건</td>
                <td style="font-size: 15px;">상품준비중 : ${product_ready } 건</td>
                <td style="font-size: 15px;">배송중 : ${delivery } 건</td>
                <td style="font-size: 15px;">배송완료 : ${complate } 건</td>
                <td style="font-size: 15px;">구매결정대기 : ${ok_wait } 건</td>
              </tr>  
          </table>
        </div>
          <div style="border:none; width:20%; float: left">
            <div>
              <ul class="nav">
                <div style="background-color: #e5e5cc">
                <li><a href="" style="font-weight: bold; font-size: 15px;">MY 쇼핑</a>
                  <ul>
                    <li><a href="" onclick="history.back();">주문목록(배송조회)</a></li>
                    <li><a href="#">취소/반품/환불내역</a></li>
                  </ul>
                  </li>
                  </div>
                  <div style="background-color: #cce5ff">
                <li><a href="" style="font-weight: bold; font-size: 15px;">MY 활동</a>
                  <ul>
                    <li><a href="#">문의하기</a></li>
                    <li><a href="#">상품평</a></li>
                    <li><a href="#">FAQ</a></li>
                  </ul>
                  </li>
                  </div>
                  <div style="background-color: #e0e0eb;">
                     <li><a href="" style="font-weight: bold; font-size: 15px;">MY 정보</a>
                  <ul>
                    <li><a href="#">개인정보수정</a></li>
                    <li><a href="#">비밀번호수정</a></li>
                  </ul>
                  </li>
                  </div>
              </ul>
            </div>
          
          </div>
          <div style="border:none; float: left; width:79.5%;" id="order_menu">
            <div style="border: none; margin: 5px; ">
              <span style="font-weight: bold;">주문목록/배송조회</span>
                          <!-- <span style="float: right;">
                <select id="start_year" name="start_year">
                        <option value="2015">2016</option>
                        <option value="2015">2015</option>
                        <option value="2014">2014</option>
                        <option value="2013">2013</option>
                    </select>
                    <select id="start_month" name="start_month">
                        <option value="1" >1</option>
                        <option value="2" >2</option>
                        <option value="3" >3</option>
                        <option value="4" >4</option>
                        <option value="5" >5</option>
                        <option value="6" >6</option>
                        <option value="7" >7</option>
                        <option value="8" >8</option>
                        <option value="9" >9</option>
                        <option value="10" >10</option>
                        <option value="11" >11</option>
                        <option value="12" >12</option>
                    </select> ~
                    <select id="end_year" name="end_year">
                        <option value="2015">2016</option>
                        <option value="2015" >2015</option>
                        <option value="2014" >2014</option>
                        <option value="2013" >2013</option>
                    </select>
                    <select id="end_month" name="end_month">
                        <option value="1" >1</option>
                        <option value="2" >2</option>
                        <option value="3" >3</option>
                        <option value="4" >4</option>
                        <option value="5" >5</option>
                        <option value="6" >6</option>
                        <option value="7" >7</option>
                        <option value="8" >8</option>
                        <option value="9" >9</option>
                        <option value="10" >10</option>
                        <option value="11" >11</option>
                        <option value="12" >12</option>
                    </select> 
                    <input type="image" src="./images/search.png" alt="검색" class="img"/>
            </span> -->
            </div>

           <div id="order" style="margin: 2%;">
            <%
            ArrayList list = (ArrayList)request.getAttribute("list");
  
            for (int i = 0; i < list.size(); i++) {
              MypageVO vo = (MypageVO)list.get(i);
              String delivery = "";
              if(vo.getOrderstate().equals("delivery_wait")){
                delivery = "배송준비중";
              } else if(vo.getOrderstate().equals("pay_wait")){
                delivery = "결제 대기중";
              } else if(vo.getOrderstate().equals("pay_ok")){
                delivery = "결재 완료";
              } else if(vo.getOrderstate().equals("delivery")){
                delivery = "배송중";
              } else if(vo.getOrderstate().equals("complate")){
                delivery = "배송완료";
              } else if(vo.getOrderstate().equals("ok_wait")){
                delivery = "구매 결정 대기";
              }
             %>

                <div style="border: 1px solid #898989; margin-bottom: 5%;">
                   <div style="background-color: #CCCCCC">
                      <span>주문일 : <%=vo.getPayday().substring(0, 11) %></span>
                      | <span>총 주문 금액 : <%=df.format(vo.getPaymoney())%> 원</span>
                      <span style="float: right;"><a href="" style="font-size: 15px; color: blue;" onclick="detail_list(<%=vo.getMno() %>, orderno=<%=vo.getOrderno() %>)">주문상세보기&gt;</a></span>
                   </div>
                   <br>
                   <table style="width:80%; margin: 0 auto;">
                    <colgroup>
                      <col style="width:70%;">
                      <col style="width:30%;">
                    </colgroup>
                    <tr>
                    <td>
                      <a href="" target="_blank"><img src="./images/festival01_m.jpg" style="float: left; margin-right: 2%;"></img></a><br>
                      <span><%=vo.getItem() %></span><br>
                      <span><%=df.format(vo.getPaymoney()) %>원 / <%=vo.getPcnt() %> 개 </span>
                   </td>
                   <td style="text-align: center; border-left: 1px solid #898989;">
                      <span><%=delivery %></span><br>
                      <button type="button" onclick="trace(<%=vo.getWaybil()%>, <%=vo.getTraceno()%>)">배송조회</button><br>  
                      <%
                      if(vo.getOrdersubmit().equals("N")){
                      %>
                      <button type="button" onclick="update(<%=vo.getMno()%>, <%=vo.getOrderno()%>, '<%=vo.getOrderstate()%>')">구매확정</button><br>
                      <%
                      }
                      %>
                      <button type="button" onclick="">반품신청</button><br>
                      <button type="button" onclick="" style="margin-bottom: 3%">교환문의</button>
                   </td>
                </table>
          </div>
        
          <%} %>
          </div>
     </div>
<!--           <ul>
          <li class='right'>
            <button type="submit"></button>
            <button type="button" onclick="location.href='./list.jsp'"></button>
          </li>
        </ul> -->
      </fieldset>
    </FORM>
  </DIV>

  <!-- -------------------------------------------- -->
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
<!-- -------------------------------------------- -->
</html>
