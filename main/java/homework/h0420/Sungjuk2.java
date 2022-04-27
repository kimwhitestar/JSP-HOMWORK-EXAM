package homework.h0420;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Sungjuk
 */
@SuppressWarnings("serial")
@WebServlet("/sungjukOk2")
public class Sungjuk2 extends HttpServlet {

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
				
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String no = request.getParameter("no");
		String hakyun = request.getParameter("hakyun");
		String hakyunOption = request.getParameter("hakyunOption");
		int kor = Integer.parseInt(request.getParameter("kor"));
		int eng = Integer.parseInt(request.getParameter("eng"));
		int mat = Integer.parseInt(request.getParameter("mat"));
		String[] language = request.getParameterValues("language");
		String[] sports = request.getParameterValues("sports");
/* front(jsp)에서 공백체크하는 문제이므로 주석처리함  		
		String otherSports = request.getParameter("otherSports")==null ? "" : request.getParameter("otherSports");
*/
		String otherSports = request.getParameter("otherSports");
		
		String strSports = "";
		String strLanguage = "";
/* front(jsp)에서 공백체크하는 문제이므로 주석처리함  		
		if(sports != null) {
*/
			for(String sport : sports) {
/* front(jsp)에서 공백체크하는 문제이므로 주석처리함  		
				if(sport.equals("기타")) {
					if(otherSports.trim().length() <= 0) {
						out.println("<script>");
						out.println("alert('기타항목을 선택하셨으면 기타란에 입력하세요.');");
						out.println("history.back();");
						out.println("</script>");
						return;
					}
*/					
					if (sport.equals("기타")) strSports = otherSports;
					else strSports += sport + " / ";
			}
/* front(jsp)에서 공백체크하는 문제이므로 주석처리함  		
		}
		else {
			out.println("<script>");
			out.println("alert('좋아하는 스포츠를 1개 이상 입력하세요.');");
			out.println("history.back();");
			out.println("</script>");
			return;
		}
		if(language == null) {
			out.println("<script>");
			out.println("alert('사용가능언어를 선택하세요.');");
			out.println("history.back();");
			out.println("</script>");
			return; 
		}
		else {
*/
			for(String lang : language) {
				strLanguage += lang + " / ";
			}
/*	}*/
			
		int tot;
		double avg = 0.0d;
		String grade;
		
		//문제를 따르면, 학년을 선택하지않을경우 공란으로 JSP에서 처리되며, 기타항목에 입력한 값 가져옴
		if(hakyun.equals("")) hakyun = hakyunOption;//학년이 공란의 경우, 기타항목으로 설정
		
		tot = kor + eng + mat;
		avg = tot / 3.0d;
		
		System.out.println("avg=" + String.format("%.1f", avg));
		System.out.println("(int)avg =" + (int)avg);
		switch ((int)avg / 10) {
			case 10:
			case 9:
				grade = "A";
				break;
			case 8:
				grade = "B";
				break;
			case 7:
				grade = "C";
				break;
			case 6:
				grade = "D";
				break;
			default:
				grade = "F";
		}
		
		//SungjukVO vo = new SungjukVO(name, gender, no, hakyun, language, sports, strLanguage, strSports, otherSports, kor, eng, mat, tot, avg, grade);
		//기본생성자와 setter사용 숙제
		SungjukVO2 vo = new SungjukVO2();
		vo.setName(name);
		vo.setGender(gender);
		vo.setNo(no);
		vo.setHakyun(hakyun); 
		vo.setLanguage(language); 
		vo.setSports(sports); 
		vo.setStrLanguage(strLanguage); 
		vo.setStrSports(strSports); 
		vo.setOtherSports(otherSports); 
		vo.setKor(kor); 
		vo.setEng(eng); 
		vo.setMat(mat); 
		vo.setTot(tot); 
		vo.setAvg(Double.valueOf(String.format("%.1f", avg))); 
		vo.setGrade(grade); 
		
		//1번 방식 : response.sendRedirect() GET방식//모두 String형이므로 jsp에서 vo타입으로 꺼낼 수 없다
		//response.sendRedirect(request.getContextPath()+"/0420/sungjukView.jsp?vo="+vo);
		
		//2번 방식 : forward방식 POST방식
		RequestDispatcher dispatcher = request.getRequestDispatcher("/homework/0420/sungjukView2.jsp");
		request.setAttribute("vo", vo);
		dispatcher.forward(request, response);
	}
}
