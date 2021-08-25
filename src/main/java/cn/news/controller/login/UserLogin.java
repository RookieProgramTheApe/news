package cn.news.controller.login;

import cn.news.consts.UserConst;
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
 * @date：2020/11/24
 * @version：1.0
 */

@WebServlet("/userLogin")
public class UserLogin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //统一编码
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        User user = new User();
        UserService service = new UserServiceImpl();

        Map<String, String[]> userMap = req.getParameterMap();
        try {
            BeanUtils.populate(user,userMap);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        System.out.println(user);

        //如果login方法返回值为空，表示数据库中没有此用户信息
        if (service.Login(user).size() == 0) {
            req.setAttribute("login",UserConst.LOGIN_ERROR);
            req.getRequestDispatcher("/views/homepage/homepage.jsp").forward(req,resp);
            return;
        }

        //如果identifyingUserInfo方法返回值为UserConst.SECURITY_CODE_ERROR，表示验证码校对失败
        if (identifyingUserInfo(user,req) == UserConst.SECURITY_CODE_ERROR) {
            System.out.println("验证码输入错误");
            req.setAttribute("userinfo",user);
            req.setAttribute("login", UserConst.SECURITY_CODE_ERROR);
            req.getRequestDispatcher("/views/homepage/homepage.jsp").forward(req,resp);
            return;
        }

        Integer userIsRoot = service.userIsRoot(user);
        List<User> userInfo = service.Login(user);

        // 如果是管理员就跳转至后台管理页面
        if (userIsRoot == 1) {
            System.out.println("root");
            req.getSession().setAttribute("user",user);
            req.getSession().setAttribute("id", userInfo.get(0).getId());
            resp.sendRedirect(req.getContextPath()+"/newsInfo");
            return;
        }

        resp.sendRedirect(req.getContextPath()+"/userinfo?id="+userInfo.get(0).getId());
        return;
    }

    /***
     * 检测用户提交的验证码是否正确
     * @param user 待检测的用户对象
     * @return 检测结果
     */
    private int identifyingUserInfo(User user,HttpServletRequest req){

        //如果用户输入的验证码错误
        if (!user.getVerifyCode().equalsIgnoreCase((String) req.getSession().getAttribute(UserConst.SESSIONS_SECURITY_CODE))){
            return UserConst.SECURITY_CODE_ERROR;
        }
        //正确则返回0
        return UserConst.SECURITY_CODE_SUCCESS;
    }
}
