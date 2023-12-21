<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%@ page import="adventour.g_list_print"%>
<%@ page import="adventour.g_getset"%>
<%@ page import="adventour.t_getset"%>
<%@ page import="adventour.t_r_getset"%>
<%@ page import="java.util.*"%>

<html>
<head>
    <meta charset="UTF-8">
    <title>Tour List</title>
    <link rel="stylesheet" type="text/css" href="./css/t_list_country.css">
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.0.js"></script>
    <script src="./js/jquery-3.6.0.min.js"></script>
    <style>
 
    </style>
</head>

<body>
		<header>
			<%
				if (session.getAttribute("id") == null) {
			%>
    			<jsp:include page="header.html"></jsp:include>
			<%
				} else {
			%>
    			<jsp:include page="header_login.jsp"></jsp:include>
			<%
				}
			%>
		</header>

    <div class="tour_contant">
        <jsp:useBean id="id" class="adventour.g_list_print">
            <%
                String countryEng = request.getParameter("country_eng");
                ArrayList<t_getset> a1 = id.t3(countryEng);
            %>
			
<div class="t_country_div" style="text-align: center;">
    <div style="display: inline-block;">
        <%
        if ("uk".equals(countryEng)) {
        %>
            <img alt="영국" src="./image/tour/ukflag.png" height="30px">
        <%
        } else if ("france".equals(countryEng)) {
        %>
            <img alt="프랑스" src="./image/tour/frflag.png" height="30px">
        <%
        } else if ("spain".equals(countryEng)) {
        %>
            <img alt="스페인" src="./image/tour/esflag.png" height="30px">
        <%
        } else if ("italy".equals(countryEng)) {
        %>
            <img alt="이탈리아" src="./image/tour/itaflag.png" height="30px">
        <%
        }
        %>
    </div>
    <h1 class="t_country" style="display: inline-block; ">
		<%
			String countryName = ""; 

			if ("uk".equals(countryEng)) {
				countryName = "영국";
				out.println("영국");
			} else if ("france".equals(countryEng)) {
				countryName = "프랑스";
				out.println("프랑스");
			} else if ("spain".equals(countryEng)) {
    			countryName = "스페인";
    			out.println("스페인");
    		} else if ("italy".equals(countryEng)) {
    			countryName = "이탈리아";
    			out.println("이탈리아");
    		}
    	%>
    </h1>
</div>

			<!--  -->
	
	<div class="country_list" >
		
		<div id="country_all" class="country_content" style="margin-left: auto;">
			<a href="main.tour?tour=tourlist"> <img alt="europeicon" src="./image/tour/euricon.png" height="30px;"><h2 class="c_name">전체</h2> </a>  
		</div>
		<div id="country_uk" class="country_content">
			<a href="t_list_country.jsp?country_eng=uk"> <img alt="ukflag" src="./image/tour/ukflag.png" height="30px;"> <h2 class="c_name">영국</h2> </a>
		</div>
		<div id="conutry_fr" class="country_content">
			<a href="t_list_country.jsp?country_eng=france"> <img alt="ukflag" src="./image/tour/frflag.png" height="30px;"> <h2 class="c_name">프랑스</h2> </a> 
		</div>
		<div id="country_es" class="country_content">
			<a href="t_list_country.jsp?country_eng=spain"> <img alt="ukflag" src="./image/tour/esflag.png" height="30px;">  <h2 class="c_name">스페인</h2> </a>
		</div>
		<div id="country_ita" class="country_content" style="margin-right: auto;">
			<a href="t_list_country.jsp?country_eng=italy"> <img alt="ukflag" src="./image/tour/itaflag.png" height="30px;">  <h2 class="c_name">이탈리아</h2> </a>
		</div>
	
	</div>
				
			<!--  -->
			<div class="tour-container">
            <% for (t_getset g : a1) { %>
            
			<div class="tour-item">
                <a href="t_info.jsp?t_id=<%=g.getT_id() %>">
                	<div class="tour-img">
                        <img src="<%=g.getT_img1()%>" alt="img<%=g.getT_name() %>">                    
                	</div>
                </a>
                <div class="tour-info">
                
                	<div class="tour_title_div" >
                    <h3 class="tour-title">
                        <a href="t_info.jsp?t_id=<%=g.getT_id() %>">
                        	<%= g.getT_name() %>
                        </a>
                    </h3>
                    </div>
                    <hr>
                    
                    <div class="tour_location_div">
                    	<p class="tour-location">
                        	<%= g.getCountry() %>, <%= g.getCity() %>
                    	</p>
                    </div>
                    <div class="t-price-rating-container">
    					<div class="tour-price" id="formattedPrice<%= g.getT_id() %>">
        					<strong> <%= g.getT_price() %> </strong>
    					</div>
						<div class="tour-rating-star" id="tour-rating-star">
    						<% String t_id = g.getT_id();
        						ArrayList<t_r_getset> rv = id.t7(t_id);  
        						for (t_r_getset tr : rv) {
    						%>
    							<div style="text-align: center; margin-right: auto; margin-left: auto;">
    								<strong>평점</strong>
    								<div class="star-rating">
       									<span class="star" data-rating="<%= tr.getT_rating() %>"></span>
    								</div>
    							</div>
    						<% } %>
						</div> <!-- tour-rating-star -->
					</div> <!-- t-price-rating-container -->
                </div>
            </div>
            
<script>
    function formatNumberWithCommas(number) {
        // 가격에 컴마 추가
        return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    }

    document.addEventListener('DOMContentLoaded', function() {
        var priceElement = document.getElementById('formattedPrice<%= g.getT_id() %>');
        var priceText = priceElement.textContent;
        var price = parseInt(priceText.replace(/[^\d]/g, '')); // 가격을 숫자로 파싱
        priceElement.textContent = '₩ ' + formatNumberWithCommas(price) + ' 원~';
    });
</script>

<script>
document.addEventListener('DOMContentLoaded', function() {
	var country = '<%= countryName %>';  // JSP 변수를 JavaScript로 가져옵니다.

    // 모든 country_content 요소를 선택
    var countryElements = document.querySelectorAll('.country_content');

    // 요소를 순환하면서 텍스트 내용을 확인하고 일치하는 경우 스타일을 변경합니다.
    for (var i = 0; i < countryElements.length; i++) {
        var h2 = countryElements[i].querySelector('h2'); // h2 요소를 찾습니다.
        if (h2.innerText.trim() === country) { // 텍스트 내용 일치 여부 확인
            countryElements[i].style.backgroundColor = 'rgba(0, 0, 0, 0.1)'; // 예시로 배경색을 변경
        }
    }
});

</script>
                       
            <% } %>
            </div>
        </jsp:useBean>
    </div>

    <footer>
        <jsp:include page="footer.html"></jsp:include>
    </footer> 
    
    <!-- 별점 -->
    <script>
const starElements = document.querySelectorAll(".star");

starElements.forEach((star) => {
    const rating = parseFloat(star.getAttribute("data-rating"));
    const roundedRating = Math.round(rating); // 반올림한 숫자를 가져옵니다.

    for (let i = 1; i <= 5; i++) {
        const starItem = document.createElement("span");
        starItem.className = "star-item";

        if (i <= roundedRating) {
            starItem.innerHTML = "★"; // 별 표시
        } else {
            starItem.innerHTML = "☆"; // 별 표시하지 않음
        }

        star.appendChild(starItem);
    }
});


</script>



</body>
</html>
