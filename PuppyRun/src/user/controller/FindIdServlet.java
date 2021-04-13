package user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.model.service.UserService;
import user.model.vo.User;

@WebServlet("/user/findId")
public class FindIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FindIdServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("e-user-name");
		String userEmail = request.getParameter("e-user-email");
		
		User user = new UserService().findUserId(userName, userEmail);
		
		if(user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
//			response.sendRedirect("/WEB-INF/views/user/findIdSuccess.html");
			response.sendRedirect("/index.jsp");
		} else {
			request.getRequestDispatcher("/WEB-INF/views/user/error.html").forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
 
}
