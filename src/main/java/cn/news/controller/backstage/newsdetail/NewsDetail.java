package cn.news.controller.backstage.newsdetail;

import cn.news.domain.News;
import cn.news.service.UserService;
import cn.news.service.impl.UserServiceImpl;
import com.sun.javaws.ui.CacheViewDialog;

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

@WebServlet("/newsDetail")
public class NewsDetail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");

        UserService service = new UserServiceImpl();
        News newsDetail = service.findByIdNewsDetail(id);

        if (newsDetail == null) {
            req.setAttribute("newsDetail",null);
            req.getRequestDispatcher("/views/newsdetail/detail.jsp").forward(req,resp);
            return;
        }

        req.setAttribute("newsDetail",newsDetail);
        req.getRequestDispatcher("/views/newsdetail/detail.jsp").forward(req,resp);
        System.out.println(newsDetail);
    }
}
