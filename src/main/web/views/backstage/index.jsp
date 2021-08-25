<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>用户信息</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="https://www.jq22.com/jquery/bootstrap-4.2.1.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="https://www.jq22.com/jquery/font-awesome.4.7.0.css">
    <!-- Fontastic Custom icon font-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fontastic.css">
    <!-- Google fonts - Roboto -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700">
    <!-- jQuery Circle-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/grasp_mobile_progress_circle-1.0.0.min.css">
    <!-- Custom Scrollbar-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/favicon.ico">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
    <script>
      if (${requestScope.result == 'success'}){
        alert("用户信息修改成功~")
      } else if (${requestScope.result == 'error'}){
        alert('用户名重复，修改失败')
      }
    </script>
  </head>
  <body>
    <div class="page" style="width: 100%;">
      <!-- 导航栏 -->
      <header class="header">
        <nav class="navbar">
          <div class="container-fluid">
            <div class="navbar-holder d-flex align-items-center justify-content-between">
              <div class="navbar-header"><a id="toggle-btn" href="#" class="menu-btn"><i class="icon-bars"> </i></a>

                  <div class="brand-text d-none d-md-inline-block"><strong class="text-primary">用户信息</strong></div>
                </a>
              </div>
              <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
                <!-- 回到新闻首页 -->
                <li class="nav-item dropdown">
                  <a id="languages1" rel="nofollow" data-target="#" href="${pageContext.request.contextPath}/views/homepage/homepage.jsp" aria-haspopup="true" aria-expanded="false" class="nav-link language">
                    <span class="d-none d-sm-inline-block">回到新闻首页</span>
                  </a>
                </li>
                <!--退出-->
                <li class="nav-item">
                  <a href="${pageContext.request.contextPath}/logout" class="nav-link logout"> <span class="d-none d-sm-inline-block">退出帐号</span><i class="fa fa-sign-out"></i></a>
                </li>
              </ul>
            </div>
          </div>
        </nav>
      </header>

      <!-- 用户信息表单 -->
      <section class="forms">
        <div class="container-fluid">
            <div class="col-lg-12">
              <div class="card">
                <div class="card-body">
                  <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/changeUserInfo">
                    <input type="text" name="id" value="${requestScope.user.id}" hidden="hidden">
                    <div class="form-group row">
                      <label class="col-sm-2 form-control-label">邮箱</label>
                      <div class="col-sm-10">
                        <input type="email" class="form-control" name="email" value="${requestScope.user.email}">
                      </div>
                    </div>
                    <div class="line"></div>
                    <div class="form-group row">
                      <label class="col-sm-2 form-control-label">昵称</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" name="username" value="${requestScope.user.username}">
                      </div>
                    </div>
                    <div class="line"></div>
                    <div class="form-group row">
                      <label class="col-sm-2 form-control-label">年龄</label>
                      <div class="col-sm-10">
                        <input type="text" name="age"  class="form-control" value="${requestScope.user.age}">
                      </div>
                    </div>

                    <div class="line"></div>
                    <div class="form-group row">
                      <label class="col-sm-2 form-control-label">性别</label>
                      <div>
                        <c:if test="${requestScope.user.gender == '男'}">
                          <input id="optionsRadios3" type="radio" value="男" checked name="gender">
                          <label for="optionsRadios3">小哥哥</label>
                        </c:if>

                        <c:if test="${requestScope.user.gender != '男'}">
                          <input id="optionsRadios3" type="radio" value="男"  name="gender">
                          <label for="optionsRadios3">小哥哥</label>
                        </c:if>

                      </div>
                      <div class="col-sm-1"></div>
                      <div>
                        <c:if test="${requestScope.user.gender == '女'}">
                          <input id="optionsRadios3" type="radio" value="女" checked name="gender">
                          <label for="optionsRadios3">小仙女</label>
                        </c:if>
                        <c:if test="${requestScope.user.gender != '女'}">
                          <input id="optionsRadios3" type="radio" value="女" name="gender">
                          <label for="optionsRadios3">小仙女</label>
                        </c:if>
                      </div>
                    </div>

                    <div class="line"></div>
                    <div class="form-group row">
                      <label class="col-sm-2 form-control-label">城市</label>
                      <div class="col-sm-10 mb-3">
                        <select name="city" class="form-control">
                          <c:if test="${requestScope.user.city == '北京'}">
                            <option selected  value="北京">北京</option>
                          </c:if>
                          <c:if test="${requestScope.user.city != '北京'}">
                            <option  value="北京">北京</option>
                          </c:if>
                          <c:if test="${requestScope.user.city == '上海'}">
                            <option selected  value="上海">上海</option>
                          </c:if>
                          <c:if test="${requestScope.user.city != '上海'}">
                            <option  value="上海">上海</option>
                          </c:if>
                          <c:if test="${requestScope.user.city == '天津'}">
                            <option selected  value="天津">天津</option>
                          </c:if>
                          <c:if test="${requestScope.user.city != '天津'}">
                            <option  value="天津">天津</option>
                          </c:if>
                          <c:if test="${requestScope.user.city == '深圳'}">
                            <option selected  value="深圳">深圳</option>
                          </c:if>
                          <c:if test="${requestScope.user.city != '深圳'}">
                            <option  value="深圳">深圳</option>
                          </c:if>
                          <c:if test="${requestScope.user.city == '贵阳'}">
                            <option selected  value="贵阳">贵阳</option>
                          </c:if>
                          <c:if test="${requestScope.user.city != '贵阳'}">
                            <option  value="贵阳">贵阳</option>
                          </c:if>
                          <c:if test="${requestScope.user.city == '四川'}">
                            <option selected  value="四川">四川</option>
                          </c:if>
                          <c:if test="${requestScope.user.city != '四川'}">
                            <option  value="四川">四川</option>
                          </c:if>
                          <c:if test="${requestScope.user.city == '重庆'}">
                            <option selected  value="重庆">重庆</option>
                          </c:if>
                          <c:if test="${requestScope.user.city != '重庆'}">
                            <option  value="重庆">重庆</option>
                          </c:if>
                          <c:if test="${requestScope.user.city == '成都'}">
                            <option selected  value="成都">成都</option>
                          </c:if>
                          <c:if test="${requestScope.user.city != '成都'}">
                            <option  value="成都">成都</option>
                          </c:if>
                        </select>
                      </div>
                    </div>

                    <div class="line"></div>
                    <div class="form-group row">
                      <div class="col-sm-4 offset-sm-2">
                        <c:if test="${sessionScope.id > 0}">
                          <a type="button" class="btn btn-secondary" href="${pageContext.request.contextPath}/newsInfo">返回</a>
                        </c:if>
                        <button type="submit" class="btn btn-primary">保存更改</button>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
      </section>
      <footer class="main-footer">
        <div class="container-fluid">
          <div class="row">
            <div class="col-sm-6">
              <p>Copyright &copy; 2019.Company name All rights reserved.</p>
            </div>
            <div class="col-sm-6 text-right">
              
              
            </div>
          </div>
        </div>
      </footer>
    </div>
    <!-- JavaScript files-->
    <script src="https://www.jq22.com/jquery/jquery-1.10.2.js"></script>
    <script src="../../vendor/popper.js/umd/popper.min.js"> </script>
    <script src="https://www.jq22.com/jquery/bootstrap-4.2.1.js"></script>
    <script src="../../js/grasp_mobile_progress_circle-1.0.0.min.js"></script>
    <script src="../../vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="../../vendor/chart.js/Chart.min.js"></script>
    <script src="../../vendor/jquery-validation/jquery.validate.min.js"></script>
    <script src="../../vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
    <!-- Main File-->
    <script src="../../js/front.js"></script>
  </body>
</html>