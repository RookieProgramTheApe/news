package cn.news.controller.backstage.byiddeletenews;

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
 * @date：2020/12/3
 * @version：1.0
 */

@WebServlet("/byIdDeleteNews")
public class ByIdDeleteNews extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");

        UserService service = new UserServiceImpl();
        if (service.byIdDeleteNews(id) == 1) {
            req.setAttribute("delete", 1);
            req.getRequestDispatcher("/newsInfo").forward(req,resp);
            return;
        }
        req.setAttribute("delete", 0);
        req.getRequestDispatcher("/newsInfo").forward(req,resp);
        return;
    }
}
