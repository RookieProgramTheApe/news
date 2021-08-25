<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>后台管理</title>
    <link rel="icon" href="${pageContext.request.contextPath}/image/icon1.png" type="image/x-icon">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <style>
        th,td{
            text-align: center;
        }

        tr{
            padding: 0px 0px;
        }

        .news-title{
            border: none;
            width: 800px;
            height:48px;
            text-indent: 45px;
            overflow:hidden;
            text-overflow:ellipsis;
            display:-webkit-box;
            -webkit-box-orient:vertical;
            -webkit-line-clamp:2;
        }

        li{
            list-style-type: none;
            margin-right: 10px;
        }

        a:hover{
            text-decoration: none;
            cursor: pointer;
        }
    </style>

    <script>
        $(() => {
            $('ul#news-nav').on('click','li',function(){
                // alert($(this).index())
                let index = $(this).index()
                $('#news-nav li').each((i,n) => {
                    if (index === i && i > 0) {
                        $(n).addClass('btn-warning')
                    }else {
                        if (i > 0) {
                            $(n).removeClass('btn-warning')
                            $(n).addClass('btn-primary')
                        }
                    }
                })
            })
        })
    </script>
</head>
<body>
    <div class="container-fluid">
        <!--管理员页面标题及右上角设置按钮组-->
        <div style="display: flex;justify-content: space-between;">
            <div class="text-center" style="width: 85%;">
                <h2>新闻后台管理系统</h2>
            </div>
            <div style="width: 10%;">
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle bg-success" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">管理员，你好 <span class="caret"></span></a>
                        <ul class="dropdown-menu bg-success">
                            <li><a href="#">我的信息</a></li>
                            <li><a href="#">添加管理员</a></li>
                            <li><a href="#">会员信息管理</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">退出登录</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>

        <!--新闻类型管理-->
        <div>
            <ul style="display: flex;margin-top: 60px;" id="news-nav">
                <li class="btn-sm">新闻类型：</li>
                <li  class="btn-primary btn-sm"><a style="color: #fcf8e3">要闻</a></li>
                <li  class="btn-primary btn-sm"><a style="color: #fcf8e3">抗疫情</a></li>
                <li  class="btn-primary btn-sm"><a style="color: #fcf8e3">国内</a></li>
                <li  class="btn-primary btn-sm"><a style="color: #fcf8e3">国际</a></li>
                <li  class="btn-primary btn-sm"><a style="color: #fcf8e3">军事</a></li>
                <li  class="btn-primary btn-sm"><a style="color: #fcf8e3">法制</a></li>
                <li  class="btn-primary btn-sm"><a style="color: #fcf8e3">教育</a></li>
                <li  class="btn-primary btn-sm"><a style="color: #fcf8e3">社会</a></li>
                <li  class="btn-primary btn-sm"><a style="color: #fcf8e3">娱乐</a></li>
                <li  class="btn-primary btn-sm"><a style="color: #fcf8e3">其它</a></li>
            </ul>
        </div>

        <!--数据表格-->
        <table class="table table-bordered table-hover table-condensed" style="text-align: center;">
            <tr class="info">
                <th><input type="checkbox" name="allCheckbox"></th>
                <th style=" width: 800px;">新闻标题</th>
                <th>新闻类型</th>
                <th>发布时间</th>
                <th>作者</th>
                <th style="width: 180px;">操作</th>
            </tr>
            <c:forEach items="${requestScope.newses}" var ="news">
                <tr>
                    <td><input type="checkbox" name="itemCheckbox"></td>
                    <td class="news-title">${news.newstitle}</td>
                    <td><strong>${news.newstype}</strong></td>
                    <td>${news.time}</td>
                    <td>${news.author}</td>
                    <td style="width: 180px;">
                        <a  class="btn btn-info btn-sm" href="newsservlet?hidden=updateNewsContent&id=${news.id}">查看</a>
                        <a  class="btn btn-success btn-sm" href="newsservlet?hidden=ModifyNewsinfo&id=${news.id}">修改</a>
                        <a class="btn btn-danger btn-sm" href="newsservlet?hidden=deleteNewsinfo&id=${news.id}">删除</a>
                    </td>
                </tr>
            </c:forEach>
            <tr>
                <td></td>
                <td class="news-title"></td>
                <td><strong></strong></td>
                <td></td>
                <td></td>
                <td style="width: 180px;">
                    <a class="btn btn-info btn-sm" href="view/afterview/newsAdd.jsp">添加</a>
                </td>
            </tr>
        </table>


        <!-- 底部分页条 -->
        <div>
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li>
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li>
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</body>
</html>