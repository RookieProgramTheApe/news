package cn.news.dao.impl;

import cn.news.consts.UserConst;
import cn.news.dao.UserDao;
import cn.news.domain.News;
import cn.news.domain.NewsType;
import cn.news.domain.User;
import com.alibaba.druid.pool.DruidDataSource;
import com.sun.org.apache.bcel.internal.generic.NEW;
import com.sun.org.apache.regexp.internal.REUtil;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.swing.tree.VariableHeightLayoutCache;
import java.util.ArrayList;
import java.util.List;

/**
 * @author：niehong
 * @date：2020/11/23
 * @version：1.0
 */
public class UserDaoImpl implements UserDao {

    private DruidDataSource dataSource = new DruidDataSource();
    private JdbcTemplate jdbcTemplate = new JdbcTemplate();


    public UserDaoImpl() {
        this.dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        this.dataSource.setUrl("jdbc:mysql://127.0.0.1:3306/test");
        this.dataSource.setUsername("root");
        this.dataSource.setPassword("root");
        this.dataSource.setMaxActive(100);
        this.dataSource.setInitialSize(5);
        this.dataSource.setMaxWait(3000);
        this.jdbcTemplate.setDataSource(this.dataSource);
    }

    /**
     *  添加新用户信息至userinfo表中
     * @param user 待添加的用户信息
     * @return 返回数据库执行结果
     */
    public Integer userRegister(User user) {
        String sql = "insert into userinfo(email, username, age, password, gender, city) values(?,?,?,?,?,?)";

        try{
            int result = jdbcTemplate.update(sql, user.getEmail(), user.getUsername(), user.getAge(), user.getPassword(), user.getGender(), user.getCity());
            return result;
        }catch (Exception exception){
            exception.printStackTrace();
            return null;
        }
    }

    /**
     * 从userinfo表移除上一次添加的用户信息
     * @param user 待移除的用户信息
     * @return 返回数据库执行结果
     */
    public Integer removeLastRegister(User user) {
        String sql = "delete from userinfo where username = ?";
        try {
            return jdbcTemplate.update(sql, user.getUsername());
        }catch (Exception exception){
            exception.printStackTrace();
            return null;
        }
    }

    /**
     * 普通用户登录
     * @param user 前端提交的用户信息
     * @return 数据库中有相应用户信息则返回
     */
    public List<User> Login(User user) {
        List<User> query;
        String sql = "select * from userinfo where username = ? and password = ?";
        List<User> result = jdbcTemplate.query(sql, new BeanPropertyRowMapper<User>(User.class), user.getUsername(), user.getPassword());
        if (result.size() == 0) {
            sql = "select * from userinfo where email = ? and password = ?";
            query = jdbcTemplate.query(sql, new BeanPropertyRowMapper<User>(User.class), user.getUsername(),  user.getPassword());

            System.out.println("ccc");
            return query;
        }
        return result;
    }

    /**
     * 用户忘记密码时的城市信息验证
     * @param user 用户提交的信息
     * @return 执行结果
     */
    public List<User> cityIsChecked(User user) {
        //当用户输入的为邮箱验证时
        if (user.getUsername().contains(UserConst.EMAIL_CHECKED)) {
            String selectUsernameSql = "select * from userinfo where email = ?";
            List<User> result = jdbcTemplate.query(selectUsernameSql, new BeanPropertyRowMapper<User>(User.class), user.getUsername());
            if (result.isEmpty()) {
                return result;
            }

            String updateByEmailSql = "update userinfo set password = ? where email = ? and city = ?";
            if (jdbcTemplate.update(updateByEmailSql, user.getPassword(), user.getUsername(), user.getCity()) == 0) {
                return new ArrayList<User>();
            }
            return result;
        }

        //当用户输入的为用户名验证时
        String selectEmailSql = "select * from userinfo where username = ?";
        List<User> result = jdbcTemplate.query(selectEmailSql, new BeanPropertyRowMapper<User>(User.class), user.getUsername());
        if (result.isEmpty()) {
            return result;
        }

        String updateByEmailSql = "update userinfo set password = ? where username = ? and city = ?";
        if (jdbcTemplate.update(updateByEmailSql, user.getPassword(), user.getUsername(), user.getCity()) == 0) {
            return new ArrayList<User>();
        }
        return result;
    }

    /**
     *  检查登录的用户是否为管理员
     * @param user 用户提交的信息
     * @return 执行结果
     */
    public Integer userIsRoot(User user) {
        List<User> query;
        String sql = "select * from userinfo where username=? and password=?";
        List<User> result = jdbcTemplate.query(sql, new BeanPropertyRowMapper<User>(User.class), user.getUsername(), user.getPassword());
        if (result.size() == 0) {
            sql = "select * from userinfo where email=? and password=?";
            query = jdbcTemplate.query(sql, new BeanPropertyRowMapper<User>(User.class), user.getUsername(),  user.getPassword());
            if (query.size() == 0) {
                return query.size();
            }
            String rootVar = "select * from userinfo where email = ? and root = 1";
            List<User> rootResult = jdbcTemplate.query(rootVar, new BeanPropertyRowMapper<User>(User.class), user.getUsername());
            return rootResult.size();
        }
        System.out.println("ddd");

        String rootVar = "select * from userinfo where username = ? and root = 1";
        List<User> rootResult = jdbcTemplate.query(rootVar, new BeanPropertyRowMapper<User>(User.class), user.getUsername());
        return rootResult.size();
    }

    public User findByIdUserInfo(String id) {
        String findByIdSql = "select * from userinfo where id = ?";
        return jdbcTemplate.queryForObject(findByIdSql, new BeanPropertyRowMapper<User>(User.class), id);
    }

    public Integer changeUserInfo(User user) {
        String updateSql = "update userinfo set email = ?,username = ?,age = ?, gender = ?, city = ? where id = ?";
        try {
            return jdbcTemplate.update(updateSql, user.getEmail(), user.getUsername(), user.getAge(), user.getGender(), user.getCity(), user.getId());
        }catch (Exception e){
            return 0;
        }
    }

    /**
     * 获取所有新闻信息
     * @return 查询结果
     */
    public List<News> getAllNewsContent() {
        List<News> query = jdbcTemplate.query("select * from newsinfo", new BeanPropertyRowMapper<News>(News.class));
        return query;
    }

    /**
     * 获取指定的新闻id对应的新闻信息
     * @param id 要获取的新闻id
     * @return 获取结果 （获取失败返回null）
     */
    public News findByIdNewsDetail(String id) {
        try {
            String selectNewsDetailSql = "select * from newsinfo where id = ?";
            return jdbcTemplate.queryForObject(selectNewsDetailSql, new BeanPropertyRowMapper<News>(News.class), id);
        }catch (Exception e){
            return null;
        }
    }

    /**
     * 删除指定id的新闻数据
     * @param id 要删除的新闻id
     * @return 结果
     */
    public Integer byIdDeleteNews(String id) {
        String deleteByIdNews = "delete from newsinfo where id = ?";
        return jdbcTemplate.update(deleteByIdNews, id);
    }

    public List<NewsType> findAllNewsTypes() {
        return jdbcTemplate.query("select * from newstype", new BeanPropertyRowMapper<NewsType>(NewsType.class));
    }

    public Integer changeByIdNewsType(String changeNewsType, String id) {
        String updateNewsTypeSql = "update newstype set newsType = ? where id = ?";
        if (jdbcTemplate.update(updateNewsTypeSql, changeNewsType, id) == 1) {
            return 1;
        }
        return 0;
    }
}
