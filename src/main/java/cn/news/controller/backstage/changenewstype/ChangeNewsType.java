package cn.news.controller.backstage.changenewstype;

import cn.news.domain.NewsType;
import cn.news.service.UserService;
import cn.news.service.impl.UserServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

/**
 * @author：niehong
 * @date：2020/12/3
 * @version：1.0
 */

@WebServlet("/changeNewsType")
public class ChangeNewsType extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        Map<String, String[]> changeNewsTypeMap = req.getParameterMap();

        NewsType newsType = new NewsType();
        UserService service = new UserServiceImpl();

        try {
            BeanUtils.populate(newsType,changeNewsTypeMap);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        req.getSession().setAttribute("change", service.changeByIdNewsType(newsType.getNewsType(),newsType.getId()));
        resp.sendRedirect(req.getContextPath()+"/newsTypeInfo");
        return;

    }
}
