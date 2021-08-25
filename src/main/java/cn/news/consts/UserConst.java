package cn.news.consts;

/**
 * @author：niehong
 * @date：2020/11/24
 * @version：1.0
 */
public class UserConst {
    /**
     * 验证码的key值
     */
    public static final String SESSIONS_SECURITY_CODE = "securityCode";

    /**
     * 验证码验证成功状态码
     */
    public static final int SECURITY_CODE_SUCCESS = 0;

    /**
     *  验证码验证失败状态码
     */
    public static final int SECURITY_CODE_ERROR = 105;

    /**
     * 用户注册成功状态码
     */
    public static final int RESULT_SUCCESS = 0;

    /**
     * 用户注册失败状态码
     */
    public static final int RESULT_EXIST = 106;

    /**
     * 用户名或密码不存在
     */
    public static final  int LOGIN_ERROR = 106;


    /**
     * 没有找到相应用户信息
     */
    public static final int NOT_FIND_USERINFO = 107;

    /**
     * 邮箱验证字符
     */
    public static final String EMAIL_CHECKED = "@";
}
