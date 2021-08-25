package cn.news.controller.backstage.newsdetail;

import cn.news.domain.News;
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

@WebServlet("/findByIdDetail")
public class FindByIdDetail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;utf-8;");
        String id = req.getParameter("id");

        UserService service = new UserServiceImpl();
        News newsDetail = service.findByIdNewsDetail(id);

        // newsDetail为null表示新闻内容获取失败
        if (newsDetail == null) {
           return;
        }

        //通过response对象的write方法将新闻内容（content）返回至请求方
        resp.getWriter().write(newsDetail.getContent());
    }
}
