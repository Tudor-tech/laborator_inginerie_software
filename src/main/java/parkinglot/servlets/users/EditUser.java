package parkinglot.servlets.users;

import jakarta.inject.Inject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import parkinglot.ejb.UserBean;

import java.io.IOException;

@WebServlet(name = "EditUser", value = "/EditUser")
@ServletSecurity(value = @HttpConstraint(rolesAllowed = {"WRITE_USERS"}))
public class EditUser extends HttpServlet {

    @Inject
    UserBean userBean;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/users/editUser.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long userId = Long.parseLong(request.getParameter("user_id"));
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        userBean.updateUser(userId, username, email, password, null);
        response.sendRedirect(request.getContextPath() + "/Users");
    }
}