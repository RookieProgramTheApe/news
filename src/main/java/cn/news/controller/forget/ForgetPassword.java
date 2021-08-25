package cn.news.controller.forget;

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
 * @author：niehong
 * @date：2020/11/25
 * @version：1.0
 */

@WebServlet("/forgetPassword")
public class ForgetPassword extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        Map<String, String[]> userMap = req.getParameterMap();

        User user = new User();
        UserService service = new UserServiceImpl();
        try {
            BeanUtils.populate(user,userMap);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(user);


        if (identifyingUserInfo(user,req) == UserConst.SECURITY_CODE_ERROR) {
            req.setAttribute("forget",UserConst.SECURITY_CODE_ERROR);
            req.getRequestDispatcher("/views/homepage/homepage.jsp").forward(req,resp);
            return;
        }

        if (service.cityIsChecked(user).size() == 0){
            req.setAttribute("forget",UserConst.NOT_FIND_USERINFO);
            req.getRequestDispatcher("/views/homepage/homepage.jsp").forward(req,resp);
            return;
        }

        req.setAttribute("forget",UserConst.RESULT_SUCCESS);
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
