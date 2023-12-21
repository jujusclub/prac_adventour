package h_controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import getset.H_getset;


public class H_Cto extends HttpServlet {
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
    	String uName ="";
    	uName = request.getParameter("uname");
    	
    	String city_ko = ""; 	
    	String h_name_eng=""; 	
    	String h_indate = "";    	
    	String h_outdate = "";    	
    	String h_peo = "";     	
    	String night_time ="";
    
    
    	
        h_conn_interface inter = H_MainDBselect.im_inter();
        h_conn_interface ukinter = H_MainukAll_DBselect.im_inter();
        h_conn_interface htop10inter = H_MainTop10_DBselect.im_inter();
        h_conn_interface htop10inter1 =  H_MainSch_DBselect.im_inter();
        h_conn_interface hscinter =  H_SCSch_DBselect.im_inter();
        h_conn_interface hcityinter =  H_CityAll_DBselect.im_inter();
        h_conn_interface hinfosch =  H_InfoSch_DBselect.im_inter();
       h_conn_interface htoreserv =  H_Toreserv_DBselect.im_inter(); 
       
       h_conn_interface tomypage =  M_H_re_list_DBselect.im_inter();
        

       System.out.println("cto확인1"+uName); //파라미터 값이 잘 넘어오는지 확인 -ok
   

        try {         
        	if (uName.equals("hmain")) { //호텔 메인에  top10이 보이게 하는
                    String n = inter.showdata(request, response); 
                    RequestDispatcher dispatcher = request.getRequestDispatcher("hotel.jsp");
                    dispatcher.forward(request, response);
        	}else if(uName.equals("uk") || uName.equals("italy")  || uName.equals("france") || uName.equals("spain")){ 
        		//국기모양 나라별 조회
        		String contry_list = request.getParameter("uname"); //매개변수 전달 위해 작성
             	//System.out.println(contry_list);  //파라미터 값이 잘 넘어오는지 확인 - 확인 ok
        	   String uk = ukinter.showdata(request, response); //select문을 하기위해 작성
               RequestDispatcher dispatcher = request.getRequestDispatcher("hotel_sc.jsp");
               dispatcher.forward(request, response);
        	
        	}else if(uName.equals("hotelSearch")) { // 호텔 메인에 셀렉박스 검색창
        		            
        	    String hmsearch = htop10inter1.showdata(request, response);  
        	    RequestDispatcher dispatcher2 = request.getRequestDispatcher("hotel_sc.jsp");
        	    dispatcher2.forward(request, response);   	
        	    
        	}else if(uName.equals("hotelSCSearch")) { // 호텔 스케쥴에 왼쪽 검색창
        		
        		String hscsc = request.getParameter("uname");
        		// System.out.println(hscsc); //파라미터 값이 잘 넘어오는지 확인 -ok
        		      	
        	        String country_ko = request.getParameter("sch_country");
        	        String sch_adult = request.getParameter("sch_adult");
//        	        System.out.println("한글확인 1");
//        	        System.out.println(country_ko);
//        	        System.out.println(sch_adult);
//        	        System.out.println("한글확인 1 끝");
             
        	    String hscsearch = hscinter.showdata(request, response);  
        	    RequestDispatcher dispatcher3 = request.getRequestDispatcher("hotel_sc2.jsp");
        	    dispatcher3.forward(request, response);
        	}else if (uName.equals("mainCity")) {       		
        		String cityko = request.getParameter("city");
        		         
//     	        System.out.println("한글확인 1");
//     	        System.out.println(cityko);
//     	        System.out.println("한글확인 1 끝");
          
     	    String hcityinter1 = hcityinter.showdata(request, response);  
     	    RequestDispatcher dispatcher4 = request.getRequestDispatcher("hotel_sc.jsp");
     	    dispatcher4.forward(request, response);
    
        	} else if (uName.equals("hinfosearch")) {
        	    h_name_eng = request.getParameter("hotel");
        	    h_peo = request.getParameter("person");
        	    h_indate = request.getParameter("checkin");
        	    h_outdate = request.getParameter("checkout");


        	    // 선택된 값들을 request 객체에 저장
        	    request.setAttribute("h_name_eng", h_name_eng);
        	    request.setAttribute("h_peo", h_peo);
        	    request.setAttribute("h_indate", h_indate);
        	    request.setAttribute("h_outdate", h_outdate);

        	    String hinfosch1 = hinfosch.showdata(request, response);
        	    RequestDispatcher dispatcher5 = request.getRequestDispatcher("hotel_info_SCH.jsp");
        	    dispatcher5.forward(request, response);
        	
   	    
        	}else if (uName.equals("toreserv")) {
        		
        	    h_name_eng = request.getParameter("h_info_search_nameeng");
        	    h_indate = request.getParameter("sch_indate");
        	    h_outdate = request.getParameter("sch_outdate");
        	    night_time = request.getParameter("night_time");
        	    h_peo = request.getParameter("sch_peo");
        	    String h_roomnum =  request.getParameter("h_room_num");
  
        	    System.out.println("확인 1");
        	    System.out.println("h_name_eng: " + h_name_eng);
        	    System.out.println("h_indate: " + h_indate);
        	    System.out.println("h_outdate: " + h_outdate);
        	    System.out.println("night_time: " + night_time);
        	    System.out.println("h_peo: " + h_peo);
        	    System.out.println("h_room_num: " +h_roomnum);
        	    System.out.println("확인 1 끝");


        	    String htoreserv1 = htoreserv.showdata(request, response);
        	    RequestDispatcher dispatcher6 = request.getRequestDispatcher(
        	    		"hotel_pay.jsp?checkin="+h_indate+"&checkout="+h_outdate+"&night="+night_time+"&peo="+h_peo);
        	    dispatcher6.forward(request, response);
        	}else if (uName.equals("hotelinfom")) {
        	    // 호텔 메인에 조회해서 나온 top10 중 하나를 누르면 해당 호텔 상세페이지로 

        	    String top10_info = request.getParameter("hotelname");
        	   
      	       System.out.println("새로설정"+top10_info); // 파라미터 값이 잘 넘어오는지 확인  -ok
 
        	    String htop10 = htop10inter.showdata(request, response);  
        	    RequestDispatcher dispatcher1 = request.getRequestDispatcher("hotel_info.jsp");
        	    dispatcher1.forward(request, response);
        	}
        	else if (uName.equals("hotelinfom2")) {
        	    // 호텔 메인에 조회해서 나온 top10 중 하나를 누르면 해당 호텔 상세페이지로 

        	    String top10_info = request.getParameter("hotelname");
        	   
      	       System.out.println("새로설정"+top10_info); // 파라미터 값이 잘 넘어오는지 확인  -ok
 
        	    String htop10 = htop10inter.showdata(request, response);  
        	    RequestDispatcher dispatcher1 = request.getRequestDispatcher("hotel_info3.jsp");
        	    dispatcher1.forward(request, response);
        	}
        	else if (uName.equals("mypage")) {

        		String idid = request.getParameter("customer");
        	   
      	       System.out.println("새로설정"+idid); // 파라미터 값이 잘 넘어오는지 확인  -ok
 
        	    String tomymypage = tomypage.showdata(request, response);  
        	    RequestDispatcher dispatcher1 = request.getRequestDispatcher("mypage_new.jsp");
        	    dispatcher1.forward(request, response);
        	}
        	} catch (Exception e) {
        		
                e.printStackTrace();
            }
        }  
    } 
