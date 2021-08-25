package cn.news.service.impl;

import cn.news.dao.UserDao;
import cn.news.dao.impl.UserDaoImpl;
import cn.news.domain.News;
import cn.news.domain.NewsType;
import cn.news.domain.User;
import cn.news.service.UserService;

import java.util.List;

/**
 * @author：niehong
 * @date：2020/11/23
 * @version：1.0
 */
public class UserServiceImpl implements UserService {

    /**
     * 创建dao对象
     */
    private UserDao dao = new UserDaoImpl();

    /**
     *  添加新用户信息至userinfo表中
     * @param user 待添加的用户信息
     * @return 返回数据库执行结果
     */
    public Integer userRegister(User user) {
        return dao.userRegister(user);
    }


    /**
     * 从userinfo表移除上一次添加的用户信息
     * @param user 待移除的用户信息
     * @return 返回数据库执行结果
     */
    public Integer removeLastRegister(User user) {
        return dao.removeLastRegister(user);
    }

    /**
     * 普通用户登录
     * @param user 前端提交的用户信息
     * @return 数据库中有相应用户信息则返回
     */
    public List<User> Login(User user) {
        return dao.Login(user);
    }

    /**
     * 用户忘记密码时的城市信息验证
     * @param user 用户提交的信息
     * @return 执行结果
     */
    public List<User> cityIsChecked(User user) {
        return dao.cityIsChecked(user);
    }

    public Integer userIsRoot(User user) {
        return dao.userIsRoot(user);
    }

    public User findByIdUserInfo(String id) {
        return dao.findByIdUserInfo(id);
    }

    public Integer changeUserInfo(User user) {
        return dao.changeUserInfo(user);
    }

    public List<News> getAllNewsContent() {
        return dao.getAllNewsContent();
    }

    public News findByIdNewsDetail(String id) {
        return dao.findByIdNewsDetail(id);
    }

    public Integer byIdDeleteNews(String id) {
        return dao.byIdDeleteNews(id);
    }

    /**
     * 获取所有新闻内容
     * @return 查询结果
     */
    public List<NewsType> findAllNewsTypes() {
        return dao.findAllNewsTypes();
    }

    public Integer changeByIdNewsType(String changeNewsType,String id) {
        return dao.changeByIdNewsType(changeNewsType, id);
    }
}
