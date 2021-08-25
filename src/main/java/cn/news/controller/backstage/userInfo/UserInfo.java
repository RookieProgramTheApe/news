package cn.news.controller.backstage.userInfo;

import cn.news.domain.User;
import cn.news.service.UserService;
import cn.news.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author：niehong
 * @date：2020/12/2
 * @version：1.0
 */

@WebServlet("/userinfo")
public class UserInfo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        String id = req.getParameter("id");
        System.out.println(id);

        UserService service = new UserServiceImpl();

        User resultUserInfo = service.findByIdUserInfo(id);
        req.setAttribute("user", resultUserInfo);
        req.getRequestDispatcher("/views/backstage/index.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
