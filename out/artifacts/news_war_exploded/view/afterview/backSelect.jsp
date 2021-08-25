<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>后台管理选择</title>
    <style>
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
            <img src="image/userSelect.png" style="display: block;margin:20px auto;">
            <span >用户管理</span>
        </div>
        <!--    新闻管理选项-->

        <div class="select newsselect" >
            <a href="newsservlet?hidden=updatelist">
                <img src="image/newsSelect.png" style="display: block;margin:20px  auto;">
                <span >新闻信息管理</span>
        </a>

        </div>
    </div>

<script>
    document.getElementsByClassName("userselect")[0].onclick = function () {
        alert("dddfd")
    }
    // document.getElementsByClassName("newsselect")[0].onclick = function () {
    //     window.location.href="newsservlet";
    // }
</script>
</body>
</html>