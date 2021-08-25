package cn.news.controller.backstage.newstype;

import cn.news.domain.NewsType;
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
 * @date：2020/12/3
 * @version：1.0
 */

@WebServlet("/newsTypeInfo")
public class NewsTypeInfo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserService service = new UserServiceImpl();

        List<NewsType> allNewsTypes = service.findAllNewsTypes();

        req.setAttribute("result", allNewsTypes);
        req.getRequestDispatcher("/views/backstage/newsType.jsp").forward(req,resp);
        return;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
