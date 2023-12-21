<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <title>게시판 글쓰기</title>
  <link rel="stylesheet" type="text/css" href="css/community.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="js/community.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
  </head>

<body>

	<header>
		<%
if (session.getAttribute("id") != null) {
%>
	<jsp:include page="header_login.jsp"></jsp:include>
		<%
}
%>

	</header>

<form name="c_form" action="c_fileupload.jsp"  method="post" enctype="multipart/form-data">

  <div class="c_div" name="c_div">
    <label><h2> < 여행여정  공유  글  작성 > </h2></label>

    <div class="c_info_div">
     <div class="c_writer_div" name="c_writer_div">
       <label>작성자 : </label><input type="text" class="c_writer" name="c_writer" readonly  value="<%= session.getAttribute("id")%>"/> <!-- 확인용 아이디 로그인 후 자동으로 받아오도록 해야함 -->
     </div><!--c_writer_div-->

     <div class="c_date_div" name="c_date_div">
       <label>작성날짜 : <p id="clock" class="c_date" name="c_date" >c_date</p></label>
     </div><!--c_date_div-->


   </div><!--c_info_div-->



    <div class="c_title_div" name="c_title_div">
      <label>제목 : </label><input type="text" class="c_title" name="c_title" placeholder="제목을 입력하세요."/>
    </div><!--c_title_div-->

    <div class="c_city_div" name="c_city_div">
      <select class="c_country" name="c_country">
        <option value="">공유할 나라를 선택하세요.</option>
         <option value="uk">영국</option>
         <option value="ity">이탈리아</option>
         <option value="fra">프랑스</option>
         <option value="spa">스페인</option>
      </select>
      <select  class="c_city" name="c_city">
        <option value="">공유할 도시를 선택하세요.</option>
        <option value="lond">런던</option>
        <option value="liv">리버풀</option>
        <option value="eden">에든버러</option>
        <option value="roma">로마</option>
        <option value="vene">베네치아</option>
        <option value="mila">밀라노</option>
        <option value="paris">파리</option>
        <option value="mars">마르세유</option>
        <option value="mona">모나코</option>
        <option value="mard">마드리드</option>
        <option value="barc">바르셀로나</option>
        <option value="sev">세비야</option>
      </select>
    </div><!--c_city_div-->
  
 
    <div class="c_con_div" name="c_con_div">
      <textarea class="c_con" name="c_con" placeholder="내용을 입력하세요."></textarea>
    </div><!--c_con_div-->

    <h4 class="c_pho_title" name="c_pho_title"> * 이미지파일 첨부(선택)  </h4>
    
    <div class="c_pho1_div" name="c_pho1_div">
    <label for = "fileName1">이미지1 : </label> <input type="file" name="fileName1" id = "fileName1"> 
    </div><!--c_pho1_div-->
    
    <div class="c_pho_div" name="c_pho2_div">
      <label for = "fileName1">이미지2 : </label> <input type="file" name="fileName2" id = "fileName2"> 
    </div><!--c_pho1_div-->
   
    <div class="c_pho_div" name="c_pho3_div">
      <label for = "fileName1">이미지3 : </label> <input type="file" name="fileName3" id = "fileName3"> 
    </div><!--c_pho1_div-->
   
    <div class="c_pho_div" name="c_pho4_div">
     <label for = "fileName1">이미지4 : </label> <input type="file" name="fileName4" id = "fileName4"> 
    </div><!--c_pho1_div-->
   
    <div class="c_pho_div" name="c_pho5_div">
     <label for = "fileName1">이미지5 : </label> <input type="file" name="fileName5" id = "fileName5"> 
    </div><!--c_pho1_div-->




<div class="c_btn" name="c_btn">
  <input id="c_btn" type="submit" value="글 올리기">
</div><!--c_btn-->
  </div><!--c_div-->

</form>

 <!-- footer.html import-->
	<div id="footer"></div>

</body>

</html>