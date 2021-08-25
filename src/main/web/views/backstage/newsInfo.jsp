<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>新闻发布查询系统</title>
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
    <!-- Tweaks for older IEs-->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>

<body>
    <!-- 左侧滑动菜单 -->
    <nav class="side-navbar">
        <div class="side-navbar-wrapper">
            <!-- Sidebar Header    -->
            <div class="sidenav-header d-flex align-items-center justify-content-center">
                <!-- User Info-->
                <div class="sidenav-header-inner text-center">
                    <h2 class="h5">新闻发布查询系统</h2>
                    <span>news</span>
                </div>
                <!-- Small Brand information, appears on minimized sidebar-->

            </div>
            <!-- Sidebar Navigation Menus-->
            <div class="main-menu">
                <h5 class="sidenav-heading">菜单</h5>
                <ul id="side-main-menu" class="side-menu list-unstyled">
                    <li>
                        <a href="${pageContext.request.contextPath}/newsInfo"> <i class="icon-home"></i>新闻信息</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/newsTypeInfo"> <i class="icon-form"></i>新闻类型</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/addAdmin"> <i class="fa fa-bar-chart"></i>友情链接</a>
                    </li>
                    <li>
                        <a href="comment.jsp"> <i class="icon-grid"></i>评论意见</a>
                    </li>
                    <li>
                        <a href="admin.jsp"> <i class="icon-grid"></i>添加管理</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="page">
        <!-- 导航栏-->
        <header class="header">
            <nav class="navbar">
                <div class="container-fluid">
                    <div class="navbar-holder d-flex align-items-center justify-content-between">
                        <div class="navbar-header"><a id="toggle-btn" href="#" class="menu-btn"><i class="icon-bars"> </i></a>
                            <a href="../../indexJquery.html" class="navbar-brand">
                                <div class="brand-text d-none d-md-inline-block"><span>后台 </span><strong class="text-primary">管理</strong></div>
                            </a>
                        </div>
                        <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
                            <!-- 回到新闻首页 -->
                            <li class="nav-item dropdown">
                                <a id="languages1" rel="nofollow"  href="${pageContext.request.contextPath}/views/homepage/homepage.jsp" aria-haspopup="true" aria-expanded="false" class="nav-link language">
                                    <span class="d-none d-sm-inline-block">回到新闻首页</span>
                                </a>
                            </li>
                            <!-- 个人信息 -->
                            <li class="nav-item dropdown">
                                <a id="languages" rel="nofollow"  href="${pageContext.request.contextPath}/userinfo?id=${sessionScope.id}" aria-haspopup="true" aria-expanded="false" class="nav-link language">
                                    <span class="d-none d-sm-inline-block">个人信息</span>
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

        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>新闻信息</h4>
                </div>
                <a class="btn btn-primary btn-sm col-sm-2" style="color: #f2f2f2;margin-top: 7px;margin-left: 7px;">添加新闻</a>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-hover" id="news-table">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>新闻标题</th>
                                    <th>新闻类型</th>
                                    <th>发布时间</th>
                                    <th>作者</th>
                                    <th>查看</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="${requestScope.news}" varStatus="status">
                                    <tr>
                                        <th scope="row">${status.index+1}</th>
                                        <td>${item.title}</td>
                                        <td>${item.newsType}</td>
                                        <td>${item.createTime}</td>
                                        <td>${item.author}</td>
                                        <td style="font-weight: bold;">
                                            <a class="btn-dark btn btn-sm" style="text-decoration: none;" href="${pageContext.request.contextPath}/newsDetail?id=${item.id}">查看</a>
                                            <a class="btn-danger btn btn-sm" style="text-decoration: none;" href="javascript:deleteById('${item.id}','${item.title}')">删除</a>
                                        </td>
                                    </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>


        <!-- 友情链接 -->
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
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script src="../../vendor/popper.js/umd/popper.min.js">
    </script>
    <script src="https://www.jq22.com/jquery/bootstrap-4.2.1.js"></script>
    <script src="../../js/grasp_mobile_progress_circle-1.0.0.min.js"></script>
    <script src="../../vendor/jquery.cookie/jquery.cookie.js">
    </script>
    <script src="../../vendor/chart.js/Chart.min.js"></script>
    <script src="../../vendor/jquery-validation/jquery.validate.min.js"></script>
    <script src="../../vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="../../js/charts-home.js"></script>
    <!-- Main File-->
    <script src="../../js/front.js"></script>
<script>
    function deleteById(id,title){
        if (confirm('您确定要删除名为:\"' + title + '\"的新闻吗？')) {
            location.href = '${pageContext.request.contextPath}/byIdDeleteNews?id='+id+'&date='+new Date().getTime()
        }
    }

    $(() => {
        if (${requestScope.delete == 1}){
            alert('删除成功')
        }else if (${requestScope.delete == 0}){
            alert('删除失败')
        }
    })
</script>
</body>

</html>