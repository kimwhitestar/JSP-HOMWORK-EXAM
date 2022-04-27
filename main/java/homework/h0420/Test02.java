package homework.h0420;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Test02
 */
@SuppressWarnings("serial")
@WebServlet("/tt02Ok")
public class Test02 extends HttpServlet {
       
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		int num = Integer.parseInt(request.getParameter("num"));
		int numPow = (int)Math.pow(num, 2.0d);
		
		PrintWriter out = response.getWriter();
		out.println("<p>");
		out.printf("입력받은 수 : %d의 거듭제곱 값은 %d 입니다", num, numPow);
		out.println("</p>");
		out.println("<p><a href='"+request.getContextPath()+"/homework/0420/test02.jsp'>돌아가기</a>");
		
	}
}
