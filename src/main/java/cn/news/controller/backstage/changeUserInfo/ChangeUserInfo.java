package cn.news.controller.backstage.changeUserInfo;

import cn.news.domain.User;
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
import java.util.List;
import java.util.Map;

/**
 * @author：niehong
 * @date：2020/12/2
 * @version：1.0
 */
@WebServlet("/changeUserInfo")
public class ChangeUserInfo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        Map<String, String[]> userInfoChangeMap = req.getParameterMap();

        User user = new User();
        UserService service = new UserServiceImpl();

        try {
            BeanUtils.populate(user,userInfoChangeMap);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        if (service.changeUserInfo(user) == 1) {
            User resultUserInfo = service.findByIdUserInfo(user.getId());
            req.setAttribute("user", resultUserInfo);
            req.setAttribute("result","success");
            req.getRequestDispatcher("/views/backstage/index.jsp").forward(req,resp);
            return;
        }

        User resultUserInfo = service.findByIdUserInfo(user.getId());
        req.setAttribute("user", resultUserInfo);
        req.setAttribute("result","error");
        req.getRequestDispatcher("/views/backstage/index.jsp").forward(req,resp);
        return;

    }
}
