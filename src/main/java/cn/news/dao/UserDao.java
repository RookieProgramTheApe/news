package cn.news.dao;

import cn.news.domain.News;
import cn.news.domain.NewsType;
import cn.news.domain.User;

import java.util.List;

/**
 * @author：niehong
 * @date：2020/11/23
 * @version：1.0
 */
public interface UserDao {
    /**
     * 添加新用户信息至userinfo表中
     * @param user 待添加的用户信息
     * @return 返回数据库执行结果
     */
    Integer userRegister(User user);

    /**
     * 从userinfo表移除上一次添加的用户信息
     * @param user 待移除的用户信息
     * @return 返回数据库执行结果
     */
    Integer removeLastRegister(User user);

    /**
     * 普通用户登录
     * @param user 前端提交的用户信息
     * @return 数据库中有相应用户信息则返回
     */
    List<User> Login(User user);

    /**
     * 用户忘记密码时的城市信息验证
     * @param user 用户提交的信息
     * @return 执行结果
     */
    List<User> cityIsChecked(User user);

    /**
     *  检查登录的用户是否为管理员
     * @param user 用户提交的信息
     * @return 执行结果
     */
    Integer userIsRoot(User user);


    /**
     * 根据id查找用户信息
     * @param id
     * @return
     */
    User findByIdUserInfo(String id);

    /**
     * 更改用户信息
     * @param user 待修改的用户信息
     * @return
     */
    Integer changeUserInfo(User user);

    /**
     * 获取所有新闻内容
     * @return
     */
    List<News> getAllNewsContent();

    /**
     * 获取指定id的新闻详情信息
     * @param id 要获取的新闻id
     * @return 结果
     */
    News findByIdNewsDetail(String id);

    /**
     * 删除指定id的新闻数据
     * @param id 要删除的新闻id
     * @return 结果
     */
    Integer byIdDeleteNews(String id);


    /**
     * 查找所有的新闻类型并返回
     * @return 所有新闻类型的集合
     */
    List<NewsType> findAllNewsTypes();

    /**
     * 通过id修改新闻类型
     * @param changeNewsType 修改后的新闻类型
     * @param id 要修改的新闻类型id
     * @return 修改结果
     */
    Integer changeByIdNewsType(String changeNewsType, String id);
}
