<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>后台管理选择</title>
    <style>
        a:link {color: blue; text-decoration:none;}
        a:active{color: red; }
        a:visited {color:purple;text-decoration:none;}
        a:hover {color: red; text-decoration:underline;}
        .outer{
            width: 480px;
            height: 200px;
            /*border: 1px solid #f0ad4e;*/
            box-sizing: border-box;
            position: fixed;
            left: 50%;
            top: 50%;
            margin-left: -240px;
            margin-top: -100px;
        }
        .select{
            width: 180px;
            height: 200px;
            border: 1px solid #0f0f0f;
            text-align: center;

        }

        .select:hover{
            background-color: #08e7ff;
        }
        .userselect{
            float: left;
        }
        .newsselect{
            float: right;
        }
    </style>
</head>
<body>
    <div class="outer">
        <!--    用户管理选项-->
        <div class="select userselect">
            <a style="text-decoration: none;color: #0f0f0f;">
                <img src="${pageContext.request.contextPath}/image/userSelect.png" style="display: block;margin:20px auto;">
                <span >用户管理</span>
            </a>
        </div>
        <!--    新闻管理选项-->

        <div class="select newsselect" >
            <a href="${pageContext.request.contextPath}/views/newsBackstage/backstage.jsp" style="text-decoration: none;color: #0f0f0f;">
                <img src="${pageContext.request.contextPath}/image/newsSelect.png" style="display: block;margin:20px  auto;">
                <span >新闻信息管理</span>
            </a>
        </div>
    </div>

<script>

</script>
</body>
</html>