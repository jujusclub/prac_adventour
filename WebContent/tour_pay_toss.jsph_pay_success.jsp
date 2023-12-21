<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Base64"%>
<%@ page import="java.util.Base64.Encoder"%>
<%@ page import="java.net.HttpURLConnection"%>
<%@ page import="java.net.URL" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ page import="org.json.simple.parser.ParseException" %>
<%@ page import="java.io.OutputStream" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.io.Reader" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Calendar" %>

<%
 // 결제 승인 API 호출하기 
 // @docs https://docs.tosspayments.com/guides/payment-widget/integration#3-결제-승인하기

  String orderId = request.getParameter("orderId");
  String paymentKey = request.getParameter("paymentKey");
  String customerName = request.getParameter("customerName");
  String amount = request.getParameter("amount");
  
  /* System.out.println( customerName); */
  
  // 개발자센터에 로그인해서 내 결제위젯 시크릿 키를 입력하세요. 시크릿 키는 외부에 공개되면 안돼요.
  // @docs https://docs.tosspayments.com/reference/using-api/api-keys
  String secretKey = "test_gsk_docs_OaPz8L5KdmQXkzRz3y47BMw6:";
  
  Encoder encoder = Base64.getEncoder(); 
  byte[] encodedBytes = encoder.encode(secretKey.getBytes("UTF-8"));
  String authorizations = "Basic "+ new String(encodedBytes, 0, encodedBytes.length);


  
  URL url = new URL("https://api.tosspayments.com/v1/payments/confirm");
  
  HttpURLConnection connection = (HttpURLConnection) url.openConnection();
  connection.setRequestProperty("Authorization", authorizations);
  connection.setRequestProperty("Content-Type", "application/json");
  connection.setRequestMethod("POST");
  connection.setDoOutput(true);
  JSONObject obj = new JSONObject();
  obj.put("paymentKey", paymentKey);
  obj.put("orderId", orderId);
  obj.put("customerName", customerName);
  obj.put("amount", amount);
  
  OutputStream outputStream = connection.getOutputStream();
  outputStream.write(obj.toString().getBytes("UTF-8"));
  
  int code = connection.getResponseCode();
  boolean isSuccess = code == 200 ? true : false;
  
  InputStream responseStream = isSuccess? connection.getInputStream(): connection.getErrorStream();
  
  Reader reader = new InputStreamReader(responseStream, StandardCharsets.UTF_8);
  JSONParser parser = new JSONParser();
  JSONObject jsonObject = (JSONObject) parser.parse(reader);
  responseStream.close();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>결제 성공</title>
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
</head>
<script>

/* function getCookie(name) {
    var value = "; " + document.cookie;
    var parts = value.split("; " + name + "=");
    if (parts.length === 2) return parts.pop().split(";").shift();
} */

/* // 쿠키에서 값을 가져옵니다.
var  h_roomnum = getCookie("h_roomnum");
var  h_m_id = getCookie("h_m_id");
var h_room_user = getCookie("h_room_user");
var h_total_price = getCookie("h_total_price");
var h_indate = getCookie("h_indate");
var h_outdate = getCookie("h_outdate");
var h_user_name = getCookie("h_user_name");
var h_user_pnum = getCookie("h_user_pnum");
var h_user_mail = getCookie("h_user_mail"); */
//쿠키에서 값을 가져옵니다. (투어)
/* var t_id = getCookie("t_id");
var m_id = getCookie("m_id");
var t_r_date = getCookie("t_r_date");
var t_total_price = getCookie("t_total_price");
var t_total_headcount = getCookie("t_total_headcount");
var t_user_name = getCookie("t_user_name");
var t_user_mail = getCookie("t_user_mail");
 */

//alert("3번"+ h_m_id);

</script>

<body>
 
<section>
    <%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    session.getAttribute("id");
    
     
     /* System.out.println("aaaaaa"+session.getAttribute("id")); */
    
     String t_id = "";
     String m_id = "";
     String t_r_date = "";
     String t_total_price = "";
     String t_total_headcount = "";
     String t_user_name = "";
     String t_user_phone ="";
     String t_user_mail = "";
    /* String h_roomnum = "";   
    String h_m_id = "";     
    String h_room_user = ""; 
    String h_total_price ="";
    String h_indate = ""; 
    String h_outdate ="";
    String h_user_name =""; 
    String h_user_pnum = ""; 
    String h_user_mail = ""; */ 
    
    if (isSuccess) {
  
    Cookie[] cookies = request.getCookies(); // 쿠키 목록 받아오기

  

    
     for (Cookie cookie : cookies) {
     String name = cookie.getName();
     String value = cookie.getValue();
     
         if (name.equals("m_id")){
        	 m_id = value;
	      }else if (name.equals("t_id")){
	    	  t_id = value;
	      }else if (name.equals("t_total_headcount")){
	    	  t_total_headcount = value;
	      }else if (name.equals("t_total_price")){
	    	  t_total_price = value;
	      }else if (name.equals("t_r_date")){
	    	  t_r_date = value;
	      }else if (name.equals("t_user_name")){
	    	  t_user_name = value;
	      }else if (name.equals("t_user_phone")){
	    	  t_user_phone = value;
	      }else if (name.equals("t_user_mail")){
	    	  t_user_mail = value;
	      }
     }
/*      for (Cookie cookie : cookies) {
     String name = cookie.getName();
     String value = cookie.getValue();
     
         if (name.equals("h_m_id")){
	      h_m_id = value;
	      }else if (name.equals("h_roomnum")){
	    	  h_roomnum = value;
	      }else if (name.equals("h_room_user")){
	    	  h_room_user = value;
	      }else if (name.equals("h_total_price")){
	    	  h_total_price = value;
	      }else if (name.equals("h_indate")){
	    	  h_indate = value;
	      }else if (name.equals("h_outdate")){
	    	  h_outdate = value;
	      }else if (name.equals("h_user_name")){
	    	  h_user_name = value;
	      }else if (name.equals("h_user_pnum")){
	    	  h_user_pnum = value;
	      }else if (name.equals("h_user_mail")){
	    	  h_user_mail = value;
	      }
     } */
    
    // JDBC 연결 정보
    String jdbcUrl = "jdbc:mysql://localhost:3306/adventour";
    String dbUser = "root";
    String dbPassword = "0521";

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // JDBC 드라이버 로드
        Class.forName("com.mysql.cj.jdbc.Driver");

        // 데이터베이스 연결
        conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

/*         // SQL 쿼리 준비
        String sql = "INSERT INTO h_reserve"+
                     "(h_tinum, h_roomnum, h_m_id, h_room_user, h_total_price, h_indate, h_outdate, h_user_name, h_user_pnum, h_user_mail)"+ 
                      "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"; */
                      // SQL 쿼리 준비

                      String sql = "INSERT INTO t_reservation"+
                                   "(t_r_id, t_id, m_id, t_total_headcount, t_total_price, t_r_date, t_user_name, t_user_phone, t_user_mail)"+ 
                                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";                      
        pstmt = conn.prepareStatement(sql);

        // h_tinum 생성: "YYMMDD" + "H"
        Calendar cal = Calendar.getInstance();
        String year = Integer.toString(cal.get(Calendar.YEAR) % 100); // 두 자리 연도
        String month = String.format("%02d", cal.get(Calendar.MONTH) + 1); // 두 자리 월
        String day = String.format("%02d", cal.get(Calendar.DAY_OF_MONTH)); // 두 자리 일
        String t_r_id = year + month + day + "T";
        
        
   /* System.out.println("aaaaa"+t_total_price) ;    
   System.out.println("aaaaa"+t_r_date) ; */
   

        // 매개변수 설정
        pstmt.setString(1,year + month + day + "T" + t_id);// "YYMMDD" + "H" + h_roomnum
        pstmt.setString(2, t_id); 
        pstmt.setString(3, m_id);
        pstmt.setString(4, t_total_headcount);
        pstmt.setString(5, t_total_price);
        pstmt.setString(6, t_r_date);
        pstmt.setString(7, t_user_name);
        pstmt.setString(8, t_user_phone);
        pstmt.setString(9, t_user_mail);

        // 쿼리 실행
        pstmt.executeUpdate();
        
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        // 연결 해제
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
 %> 
 <input type="hidden" id="sess_id" value="<%= session.getAttribute("id") %>">  

 <%    
    } else { %>
   <h1>결제 실패</h1>
   <p><%= jsonObject.get("message") %></p>
   <span>에러코드: <%= jsonObject.get("code") %></span>
   <%
}  
    
%>
<script> 
// 결제 성공시 데이터 베이스 저장 후 파이페이지로 이동
 var m_id = $("#sess_id").val();rnsl
 
 alert("m_id 확인용");
 alert("m_id"+m_id);

 var url = 'Mypage.mypage?uname=mypage&&customer='+m_id
 window.location.href = url;
</script>