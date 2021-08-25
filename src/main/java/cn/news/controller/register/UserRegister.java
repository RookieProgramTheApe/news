package cn.news.controller.register;

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
import java.util.Map;

/**
 * @author niehong
 * @date 2020/11/23
 */
@WebServlet("/userRegister")
public class UserRegister extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        req.setCharacterEncoding("utf-8");

        //拿到用户提交的注册信息
        Map<String, String[]> userMap = req.getParameterMap();

        //创建一个User对象
        User user = new User();
        //创建业务层对象
        UserService service = new UserServiceImpl();

        //通过BeanUtils的populate方法将用户提交的注册信息封装到user对象中
        try {
            BeanUtils.populate(user,userMap);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        //如果用户名或邮箱已存在(106)
        if (service.userRegister(user) == null) {
            req.setAttribute("result", UserConst.RESULT_EXIST);
            user.setEmail("");
            user.setUsername("");
            //设置状态码
            req.setAttribute("user",user);
            req.getRequestDispatcher("/views/homepage/homepage.jsp").forward(req,resp);
            return;
        }

        //如果用户输入的验证码错误(105)
        if (identifyingUserInfo(user,req) == UserConst.SECURITY_CODE_ERROR) {
            //从userinfo表中移除上一步添加的用户信息
            service.removeLastRegister(user);
            req.setAttribute("user",user);
            //设置状态码
            req.setAttribute("result", UserConst.SECURITY_CODE_ERROR);
            req.getRequestDispatcher("/views/homepage/homepage.jsp").forward(req,resp);
            return;
        }
        //设置状态码
        req.setAttribute("result", UserConst.RESULT_SUCCESS);
        req.getRequestDispatcher("/views/homepage/homepage.jsp").forward(req,resp);
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
