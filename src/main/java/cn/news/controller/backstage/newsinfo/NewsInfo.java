package cn.news.controller.backstage.newsinfo;

import cn.news.domain.News;
import cn.news.service.UserService;
import cn.news.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author：niehong
 * @date：2020/12/2
 * @version：1.0
 */

@WebServlet("/newsInfo")
public class NewsInfo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8;");
        UserService service = new UserServiceImpl();

        List<News> allNewsContent = service.getAllNewsContent();
        req.setAttribute("news",allNewsContent);
        req.getRequestDispatcher("/views/backstage/newsInfo.jsp").forward(req,resp);
        return;
    }
}
