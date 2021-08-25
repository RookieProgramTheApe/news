<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>新闻首页</title>
    <link rel="icon" href="${pageContext.request.contextPath}/image/icon1.png" type="image/x-icon">
    <link rel="stylesheet" href="view/homepage/homepage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <style>
        .error{
            color: #ad360e;
            font-size: 15px;
            font-weight: bold;
        }
        .carousel-inner > .item > img {
            width:100%; /* Or try to use important */
            height:auto;
        }
        .text-li{
            text-indent: 21px;
            margin: 10px 1px;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            line-clamp: 2;
            -webkit-box-orient: vertical;
            width: 100%;
            box-sizing: border-box;
            overflow: hidden;
        }

        .text-li:hover{
            cursor: pointer;
            color: #761c19;
            font-weight: bold;
        }

        .new-title{
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            line-clamp: 2;
            -webkit-box-orient: vertical;
            text-indent: 60px;
            position: absolute;
            font-weight: bold;
            color: #0f0f0f;
            font-size: 25px;
            z-index: 500;
            overflow: hidden;
            padding: 0px 30px;
        }

        .new-title-item{
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 1;
            line-clamp: 1;
            -webkit-box-orient: vertical;
            text-indent: 30px;
            position: absolute;
            font-weight: bold;
            color: #fff;
            font-size: 15px;
            z-index: 500;
            overflow: hidden;
            padding: 0px 20px;
        }

        .text-body{
            margin-top: 10px;
            display: -webkit-box;
            -webkit-line-clamp: 4;
            line-clamp: 4;
            -webkit-box-orient: vertical;
            text-indent: 30px;
            padding: 0px 18px;
            font-size: 16px;
            overflow: hidden;
        }

        .user-input:hover{
            color: #2aabd2;
        }

        .user-input-group{
            width: 31%;
            height: 100%;
            background-color: #f2f2f2;
            /*border-radius: 19px;*/
            overflow: hidden;
            box-shadow: 0 0 12px -4px gray;
        }

        .user-input-group:hover{
            cursor:pointer;
            box-shadow: 0 0 15px -4px rgb(42,171,210);
            color: gray;
        }

        .other-news-group{
            margin-top: 50px;
            width:75%;
            min-width:900px;
            display: flex;
            justify-content: center;
        }

        .other-news-item{
            margin-top: 20px;
            position: relative;
            top: 0px;
            left: 0px;
            width: 97%;
            height: 320px;
            padding: 8px 13px;
            box-sizing: border-box;
            /*border-radius: 15px;*/
            box-shadow: 0 0 8px -4px gray;
            border: 1px solid #cdcdcd;
        }

        .other-news-item:hover{
            color: gray;
            cursor:pointer;
            border: 1px solid #cdcdcd;
            box-shadow: 0 0 15px -4px rgb(42,171,210);
        }

        .other-body{
            padding: 0 35px;
            box-sizing: border-box;
            text-indent: 40px;
            display: -webkit-box;
            -webkit-line-clamp: 6;
            line-clamp: 6;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

    </style>
    <script>
        <%--        验证码点击事件--%>
        function switchImg(){
            $('.img-code').prop("src",'${pageContext.request.contextPath}/identifyingCode?time=' + new Date().getTime());
        }
        function regist(){
            $('#myModal2').modal('hide')
            $('#myModal3').modal('hide')
            $('#myModal4').modal('hide')
            $('#myModal').modal('hide')
            $('#registerIdentifyingCode').attr('src','${pageContext.request.contextPath}/identifyingCode?time=' + new Date().getTime())
            setTimeout(()=> {
                $('#myModal1').modal('show')
        },500)
        }
        function login(){
            $('#myModal1').modal('hide')
            setTimeout(() =>{
                $('#myModal').modal('show')
        },500)
        }

        function forget(){
            $('#myModal').modal('hide')
            $('#myModal2').modal('hide')
            $('#forgetPasswordIdentifyingCode').attr('src','${pageContext.request.contextPath}/identifyingCode?time=' + new Date().getTime())
            setTimeout(() => {
                $('#myModal3').modal('show')
        },500)
        }

        function restart(){
            $('#myModal3').modal('hide')
            setTimeout(()=>{
                $('#myModal4').modal('show')
        },500)
        }

        function toTop(){
            $('html,body').animate({scrollTop: 0},500);
        }
        // JQuery入口函数
        $(() => {

            //根据后端返回的状态码执行操作
            if (${requestScope.result == 0}){
                alert(`尊贵的${requestScope.user.username}用户，您好，请登录`);
                login();
            }else if (${requestScope.result == 105}){
                alert("验证码输入错误，请重新输入验证码")
                regist();
            }
            else if (${requestScope.result == 106}){
                alert('用户名或邮箱已存在，请更改后重试');
                regist();
            }else if (${requestScope.login == 105}){
                alert("验证码输入错误，请重新输入验证码")
                login()
            }else if (${requestScope.login == 106}){
                alert("用户名或密码输入错误")
                login()
            }else if (${requestScope.forget == 105}){
                alert('验证码输入错误，请重新输入验证码dd')
                forget()
            }else if (${requestScope.forget == 107}){
                alert('用户名或邮箱错误，请重试')
                forget()
            }else if (${requestScope.forget == 0}){
                alert('密码修改成功，请登录')
                login()
            }

            //用户注册表单验证
            $('#form-register').validate({
                rules:{
                    email:{
                        required:true,
                        email: true
                    },
                    username:{
                        required: true,
                        rangelength:[3,9]
                    },
                    age:{
                       required:true,
                        range: [18, 99]
                    },
                    password:{
                        required:true,
                        rangelength: [8,16]
                    },
                    passwordVerify:{
                        required:true,
                        rangelength: [8,16],
                        equalTo:'#password'
                    }
                },
                messages: {
                    email: {
                        required: '请输入邮箱',
                        email: '请输入正确的邮箱格式'
                    },
                    username: {
                        required: '请输入用户名',
                        rangelength: '用户名为3至9个字符'
                    },
                    age: {
                        required: '请输入年龄',
                        range: '年龄要求为18至99'
                    },
                    password: {
                        required: '请输入密码',
                        rangelength: '密码要求为8至16位'
                    },
                    passwordVerify: {
                        required: '请重复密码',
                        rangelength: '密码要求为8至16位',
                        equalTo: '两次输入的密码不同'
                    },

                }
                })

            //用户登录，表单验证
            $('#login-form').validate({
                rules:{
                    username:{
                        required: true,
                        rangelength:[3,25]
                    },

                    password:{
                        required:true,
                        rangelength: [8,16]
                    },

                },
                messages: {
                    username: {
                        required: '请输入用户名',
                        rangelength: '用户名为3至25个字符'
                    },

                    password: {
                        required: '请输入密码',
                        rangelength: '密码要求为8至16位'
                    }
                }
            })

            //忘记密码表单验证
            $('#form-forget').validate({
                rules:{
                    username:{
                        required: true,
                        rangelength:[3,25]
                    },

                    password:{
                        required:true,
                        rangelength: [8,16]
                    },
                    city:{
                        required:true
                    },
                    passwordVerify:{
                        required:true,
                        rangelength: [8,16],
                        equalTo:'#passwordf'
                    }

                },
                messages: {
                    username: {
                        required: '请输入用户名',
                        rangelength: '用户名为3至25个字符'
                    },
                    city: {
                        required:'请输入城市'
                    },
                    password: {
                        required: '请输入密码',
                        rangelength: '密码要求为8至16位'
                    },
                    passwordVerify:{
                        required: '请重复密码',
                        rangelength: '密码要求为8至16位',
                        equalTo: '两次输入的密码不同'
                    }
                }
            })

            $(document).scroll(() => {
                var scroH = $(document).scrollTop();  //滚动高度
                var viewH = $(window).height();  //可见高度
                var contentH = $(document).height();  //内容高度
                console.log("scrlH:"+scroH)
                console.log("viewH:"+viewH)
                console.log("contentH:"+contentH)


        if(scroH >100){  //距离顶部大于100px时

        }
        if (contentH - (scroH + viewH) <= 100){  //距离底部高度小于100px

        }
        if (contentH == (scroH + viewH)){  //滚动条滑到底部啦
            console.log('到底了')
        }

        })
        // 导航栏点击后选中效果
        $('ul#menu').on('click','li',function(){
            $('.other-news-group').show('slow','swing')
            // alert($(this).index())
            let index = $(this).index()
            $('li').each((i,n) => {
                if (index === i){
                $(n).attr('class','active')
            }else{
                $(n).attr('class','')
            }
        })
        })

        // 普通用户登录
        $('#login-btn').click(() => {
            $('#myModal1').modal('hide')
            $('#loginIdentifyingCode').attr('src','${pageContext.request.contextPath}/identifyingCode?time=' + new Date().getTime())
        setTimeout(() => {
            $('#myModal').modal('show')
        },500)
        })

        // 管理员登录
       $('#admin-login-btn').click(() => {
            $('#myModal').modal('hide')
            $('#myModal1').modal('hide')
            $('#myModal3').modal('hide')
            $('#myModal4').modal('hide')
            $('#adminLoginIdentifyingCode').attr('src','${pageContext.request.contextPath}/identifyingCode?time=' + new Date().getTime())
        setTimeout(() => {
            $('#myModal2').modal('show')
        },500)
        })


        // 忘记密码按钮
        $('#forget-password').click(() => {
            $('#myModal').modal('hide')
            $('#myModal1').modal('hide')
            $('#myModal2').modal('hide')
            $('#myModal4').modal('hide')
        setTimeout(() => {
            $('#myModal3').modal('show')
        },500)

        })
        })
    </script>
</head>
<body>
<!--    导航栏-->
<nav class="navbar navbar-default navbar-static-top" id="nav">
    <div class="container-fluid" style="position: fixed;display: flex;background-color: #fff;width: 100%;min-width: 1290px;">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header" style="margin-right: 60px;">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <div style="display: flex; align-items: center;">
                <img alt="Brand" src="${pageContext.request.contextPath}/image/icon.png">
                <a class="navbar-brand">热点新闻</a>
            </div>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav" id="menu">
                <li class="active"><a href="#">要闻</a></li>
                <li><a href="#">抗疫情</a></li>
                <li><a href="#">国内</a></li>
                <li><a href="#">国际</a></li>
                <li><a href="#">军事</a></li>
                <li><a href="#">法制</a></li>
                <li><a href="#">教育</a></li>
                <li><a href="#">社会</a></li>
                <li><a href="#">娱乐</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle purple" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">关于我们 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">项目介绍</a></li>
                        <li><a href="#">技术选型</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">开发人员</a></li>

                    </ul>
                </li>
            </ul>
            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="输入你想搜索的新闻...">
                </div>
                <a class="btn btn-default">搜索</a>
            </form>
            <ul class="nav navbar-nav navbar-right" style="position: absolute;right: 20px;">
                <c:if test="${sessionScope.user == null}">
                    <li><a href="#" id="login-btn">登录</a></li>
                </c:if>
                <c:if test="${sessionScope.user != null}">
                    <li><a href="#" style="color: #09b6ff;">${sessionScope.user.username}</a></li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>

<!--轮播图-->
<div class="container-fluid" style="padding: 0px 60px;box-sizing: border-box;">
    <div style="min-width: 1200px;">
        <div style="width: 100%;height: 420px;display: flex;justify-content: flex-start;">
            <!--左边轮播图-->
            <div style="width: 50%;height: 100%;overflow: hidden;cursor: pointer;">
                <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="3500"  style="border-radius: 15px; overflow:hidden;">
                    <!-- 轮播（Carousel）指标 -->
                    <ol class="carousel-indicators" style="margin-bottom: -17px;">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                    </ol>
                    <!-- 轮播（Carousel）项目 -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img style="height: 420px;" src="https://n.sinaimg.cn/mil/transform/200/w640h360/20201013/4da8-kakmcxe5521183.jpg" alt="First slide">
                            <div style="background-color:#666;filter:Alpha(Opacity=80);opacity:0.8;width: 100%;height: 100px;position: absolute;bottom: 0px;text-align: center">
                                <a href="#" class="lead new-title btn-link" style="color: #000;">台湾问题专家：不动用军事手段 不可能实现两岸统一</a>
                            </div>
                        </div>
                        <div class="item">
                            <img style="height: 420px;" src="https://n.sinaimg.cn/news/crawl/116/w550h366/20201014/beed-kakmcxe7356856.jpg" alt="Second slide">
                            <div style="background-color:#666;filter:Alpha(Opacity=80);opacity:0.8;width: 100%;height: 100px;position: absolute;bottom: 0px;text-align: center">
                                <a href="#" class="lead new-title btn-link" style="color: #000">国民党要改党名去“中国”？国台办回应国务院台湾事务办公室举行例行新闻发布会。国台办发言人朱凤莲就两岸政党交流、两岸军事互信和两岸文化往来等热点问题回答记者提问。</a>
                            </div>
                        </div>
                        <div class="item">
                            <img style="height: 420px;" src="https://n.sinaimg.cn/news/crawl/27/w550h277/20201013/52a5-kakmcxe6189414.png" alt="Third slide">
                            <div style="background-color:#666;filter:Alpha(Opacity=80);opacity:0.8;width: 100%;height: 100px;position: absolute;bottom: 0px;text-align: center">
                                <a href="#" class="lead new-title btn-link" style="color: #000">海军陆战队首任司令员 出现在《新闻联播》头条</a>
                            </div>
                        </div>
                    </div>
                    <!-- 轮播（Carousel）导航 -->
                    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <!--右边两个小轮播图-->
            <div style="width: 25%;height: 100%; margin-left: 8px; display: flex;flex-direction: column;">
                <div style="cursor: pointer;width: 100%;height: 50%;overflow: hidden; margin-bottom: 5px;">
                    <div id="myCarousel1" class="carousel slide" data-ride="carousel" data-interval="3500"  style="border-radius: 15px; overflow:hidden;">
                        <!-- 轮播（Carousel）指标 -->
                        <ol class="carousel-indicators" style="margin-bottom: -17px;">
                            <li data-target="#myCarousel1" data-slide-to="0" class="active"></li>
                            <li data-target="#myCarousel1" data-slide-to="1"></li>
                            <li data-target="#myCarousel1" data-slide-to="2"></li>
                        </ol>
                        <!-- 轮播（Carousel）项目 -->
                        <div class="carousel-inner">
                            <div class="item active">
                                <img style="height: 210px;" src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1602651698184&di=b4a5aaae0204f65079747797742dfd84&imgtype=0&src=http%3A%2F%2Fimg3.iqilu.com%2Fdata%2Fattachment%2Fforum%2F201308%2F22%2F163938kvv4h8nh84rvrvjx.jpg" alt="First slide">
                                <div style="background-color:#666;filter:Alpha(Opacity=80);opacity:0.8;width: 100%;height: 50px;position: absolute;bottom: 0px;text-align: center">
                                    <a href="#" class="lead new-title-item btn-link" style="color: #000">海军陆战队首任司令员 出现在《新闻联播》头条</a>
                                </div>
                            </div>
                            <div style="height: 210px;" class="item">
                                <img src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1602651558043&di=68733bc17657dcb6d4f5c31fa1bb01c4&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2Ff%2F54508f8e2a0bd.jpg" alt="Second slide">
                                <div style="background-color:#666;filter:Alpha(Opacity=80);opacity:0.8;width: 100%;height: 50px;position: absolute;bottom: 0px;text-align: center">
                                    <a href="#" class="lead new-title-item btn-link" style="color: #000">海军陆战队首任司令员 出现在《新闻联播》头条</a>
                                </div>
                            </div>
                            <div style="height: 210px;" class="item">
                                <img src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1602651558044&di=195ab13e8412521372d8446ab4a04922&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fblog%2F201403%2F22%2F20140322120135_sj8GJ.jpeg" alt="Third slide">
                                <div style="background-color:#666;filter:Alpha(Opacity=80);opacity:0.8;width: 100%;height: 50px;position: absolute;bottom: 0px;text-align: center">
                                    <a href="#" class="lead new-title-item btn-link" style="color: #000">海军陆战队首任司令员 出现在《新闻联播》头条</a>
                                </div>
                            </div>
                        </div>
                        <!-- 轮播（Carousel）导航 -->
                        <a class="left carousel-control" href="#myCarousel1" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#myCarousel1" role="button" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
                <div style="cursor: pointer;width: 100%;height: 50%;overflow: hidden;">
                    <div id="myCarousel2" class="carousel slide" data-ride="carousel" data-interval="4000"  style="border-radius: 15px; overflow:hidden;">
                        <!-- 轮播（Carousel）指标 -->
                        <ol class="carousel-indicators" style="margin-bottom: -17px;">
                            <li data-target="#myCarousel2" data-slide-to="0" class="active"></li>
                            <li data-target="#myCarousel2" data-slide-to="1"></li>
                            <li data-target="#myCarousel2" data-slide-to="2"></li>
                        </ol>
                        <!-- 轮播（Carousel）项目 -->
                        <div class="carousel-inner">
                            <div class="item active">
                                <img style="height: 210px;" src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1602651698184&di=b4a5aaae0204f65079747797742dfd84&imgtype=0&src=http%3A%2F%2Fimg3.iqilu.com%2Fdata%2Fattachment%2Fforum%2F201308%2F22%2F163938kvv4h8nh84rvrvjx.jpg" alt="First slide">
                                <div style="background-color:#666;filter:Alpha(Opacity=80);opacity:0.8;width: 100%;height: 50px;position: absolute;bottom: 0px;text-align: center">
                                    <a href="#" class="lead new-title-item btn-link" style="color: #000">海军陆战队首任司令员 出现在《新闻联播》头条</a>
                                </div>
                            </div>
                            <div  class="item">
                                <img style="height: 210px;" src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1602651558043&di=68733bc17657dcb6d4f5c31fa1bb01c4&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2Ff%2F54508f8e2a0bd.jpg" alt="Second slide">
                                <div style="background-color:#666;filter:Alpha(Opacity=80);opacity:0.8;width: 100%;height: 50px;position: absolute;bottom: 0px;text-align: center">
                                    <a href="#" class="lead new-title-item btn-link" style="color: #000">海军陆战队首任司令员 出现在《新闻联播》头条</a>
                                </div>
                            </div>
                            <div class="item">
                                <img  style="height: 210px;" src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1602651558044&di=195ab13e8412521372d8446ab4a04922&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fblog%2F201403%2F22%2F20140322120135_sj8GJ.jpeg" alt="Third slide">
                                <div style="background-color:#666;filter:Alpha(Opacity=80);opacity:0.8;width: 100%;height: 50px;position: absolute;bottom: 0px;text-align: center">
                                    <a href="#" class="lead new-title-item btn-link" style="color: #000">海军陆战队首任司令员 出现在《新闻联播》头条</a>
                                </div>
                            </div>
                        </div>
                        <!-- 轮播（Carousel）导航 -->
                        <a class="left carousel-control" href="#myCarousel2" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#myCarousel2" role="button" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
            </div>
            <!--今日话题-->
            <div style="width: 25%;height: 670px; display: flex;box-sizing: border-box; margin-left: 18px;">
                <div style="width: 90%;overflow: hidden;height: 100%;padding: 20px 8px; box-sizing: border-box;" class="bg-info">
                    <div style="text-align: left; font-weight: bold;font-size: 20px; color: black;">今日话题</div>
                    <div style="font-size: 15px; box-sizing: border-box;padding: 2px 15px;">
                        <ul>
                            <li class="btn-link" style="color: black"><span class="text-li">侠客岛：美国又给咱扣了顶“大帽子”大叔墙体写字堪比印刷：月入万元 本省邀约都写不完,大叔墙体写字堪比印刷</span></li>
                            <li class="btn-link" style="color: black"><span class="text-li">侠客岛：美国又给咱扣了顶“大帽子”大叔墙体写字堪比印刷：月入万元 本省邀约都写不完,大叔墙体写字堪比印刷</span></li>
                            <li class="btn-link" style="color: black"><span class="text-li">侠客岛：美国又给咱扣了顶“大帽子”大叔墙体写字堪比印刷：月入万元 本省邀约都写不完,大叔墙体写字堪比印刷</span></li>
                            <li class="btn-link" style="color: black"><span class="text-li">侠客岛：美国又给咱扣了顶“大帽子”大叔墙体写字堪比印刷：月入万元 本省邀约都写不完,大叔墙体写字堪比印刷</span></li>
                            <li class="btn-link" style="color: black"><span class="text-li">侠客岛：美国又给咱扣了顶“大帽子”大叔墙体写字堪比印刷：月入万元 本省邀约都写不完,大叔墙体写字堪比印刷</span></li>
                            <li class="btn-link" style="color: black"><span class="text-li">侠客岛：美国又给咱扣了顶“大帽子”大叔墙体写字堪比印刷：月入万元 本省邀约都写不完,大叔墙体写字堪比印刷</span></li>
                            <li class="btn-link" style="color: black"><span class="text-li">侠客岛：美国又给咱扣了顶“大帽子”大叔墙体写字堪比印刷：月入万元 本省邀约都写不完,大叔墙体写字堪比印刷</span></li>
                            <li class="btn-link" style="color: black"><span class="text-li">侠客岛：美国又给咱扣了顶“大帽子”大叔墙体写字堪比印刷：月入万元 本省邀约都写不完,大叔墙体写字堪比印刷</span></li>
                            <li class="btn-link" style="color: black"><span class="text-li">侠客岛：美国又给咱扣了顶“大帽子”大叔墙体写字堪比印刷：月入万元 本省邀约都写不完,大叔墙体写字堪比印刷</span></li>
                            <li class="btn-link" style="color: black"><span class="text-li">侠客岛：美国又给咱扣了顶“大帽子”大叔墙体写字堪比印刷：月入万元 本省邀约都写不完,大叔墙体写字堪比印刷</span></li>
                            <li class="btn-link" style="color: black"><span class="text-li">侠客岛：美国又给咱扣了顶“大帽子”大叔墙体写字堪比印刷：月入万元 本省邀约都写不完,大叔墙体写字堪比印刷</span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--三篇推荐文章-->
    <div style="width: 75%;min-width: 900px;height: 349px;margin-top: 45px;display: flex;justify-content: space-evenly;">
        <div class="user-input-group">
            <div style="width: 100%;height: 168px;overflow: hidden;">
                <img style="width: 100%;height: 100%" class="img-rounded" src="https://dss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2534506313,1688529724&fm=26&gp=0.jpg">
            </div>
            <div class="lead text-body">
                今天，我们在这里隆重集会，庆祝深圳等经济特区建立40周年，
                总结经济特区建设经验，在更高起点上推进改革开放，动员全党全国全社会为乘势而上开启全面建设社会主义现代化国家新征程、向第二个百年奋斗目标进军而团结奋进。
            </div>
            <div style="width: 100%; display: flex;justify-content: space-evenly;">
                <!-- 转发 -->
                <div style="display: flex;align-items: center;" class="user-input">
                    <span class="glyphicon glyphicon glyphicon-share" aria-hidden="true" style="font-size: 24px;"></span>
                    <span style="font-size: 15px; font-weight: bold;">&nbsp;1254</span>
                </div>
                <!-- 评论 -->
                <div style="display: flex;align-items: center;" class="user-input">
                    <span class="glyphicon glyphicon glyphicon-comment" aria-hidden="true" style="font-size: 24px;"></span>
                    <span style="font-size: 15px; font-weight: bold;">&nbsp;1254</span>
                </div>
                <!-- 点赞 -->
                <div style="display: flex;align-items: center;" class="user-input">
                    <span class="glyphicon glyphicon-hand-right" aria-hidden="true" style="font-size: 24px;"></span>
                    <span style="font-size: 15px; font-weight: bold;">&nbsp;154</span>
                </div>
            </div>
        </div>
        <div class="user-input-group">
            <div style="width: 100%;height: 168px;overflow: hidden;">
                <img style="width: 100%;height: 100%" class="img-rounded" src="https://dss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2534506313,1688529724&fm=26&gp=0.jpg">
            </div>
            <div class="lead text-body">
                今天，我们在这里隆重集会，庆祝深圳等经济特区建立40周年，
                总结经济特区建设经验，在更高起点上推进改革开放，动员全党全国全社会为乘势而上开启全面建设社会主义现代化国家新征程、向第二个百年奋斗目标进军而团结奋进。
            </div>
            <div style="width: 100%; display: flex;justify-content: space-evenly;">
                <!-- 转发 -->
                <div style="display: flex;align-items: center;" class="user-input">
                    <span class="glyphicon glyphicon glyphicon-share" aria-hidden="true" style="font-size: 24px;"></span>
                    <span style="font-size: 15px; font-weight: bold;">&nbsp;1254</span>
                </div>
                <!-- 评论 -->
                <div style="display: flex;align-items: center;" class="user-input">
                    <span class="glyphicon glyphicon glyphicon-comment" aria-hidden="true" style="font-size: 24px;"></span>
                    <span style="font-size: 15px; font-weight: bold;">&nbsp;1254</span>
                </div>
                <!-- 点赞 -->
                <div style="display: flex;align-items: center;" class="user-input">
                    <span class="glyphicon glyphicon-hand-right" aria-hidden="true" style="font-size: 24px;"></span>
                    <span style="font-size: 15px; font-weight: bold;">&nbsp;154</span>
                </div>
            </div>
        </div>
        <div class="user-input-group">
            <div style="width: 100%;height: 168px;overflow: hidden;">
                <img style="width: 100%;height: 100%" class="img-rounded" src="https://dss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2534506313,1688529724&fm=26&gp=0.jpg">
            </div>
            <div class="lead text-body">
                今天，我们在这里隆重集会，庆祝深圳等经济特区建立40周年，
                总结经济特区建设经验，在更高起点上推进改革开放，动员全党全国全社会为乘势而上开启全面建设社会主义现代化国家新征程、向第二个百年奋斗目标进军而团结奋进。
            </div>
            <div style="width: 100%; display: flex;justify-content: space-evenly;">
                <!-- 转发 -->
                <div style="display: flex;align-items: center;" class="user-input">
                    <span class="glyphicon glyphicon glyphicon-share" aria-hidden="true" style="font-size: 24px;"></span>
                    <span style="font-size: 15px; font-weight: bold;">&nbsp;1254</span>
                </div>
                <!-- 评论 -->
                <div style="display: flex;align-items: center;" class="user-input">
                    <span class="glyphicon glyphicon glyphicon-comment" aria-hidden="true" style="font-size: 24px;"></span>
                    <span style="font-size: 15px; font-weight: bold;">&nbsp;1254</span>
                </div>
                <!-- 点赞 -->
                <div style="display: flex;align-items: center;" class="user-input">
                    <span class="glyphicon glyphicon-hand-right" aria-hidden="true" style="font-size: 24px;"></span>
                    <span style="font-size: 15px; font-weight: bold;">&nbsp;154</span>
                </div>
            </div>
        </div>
    </div>

    <!--其它文章-->
    <div class="other-news-group">
        <div class="other-news-item">
            <div class="h2">sit amet, consectetur adipiscing elit. Aenean 4</div>
            <div style="display: flex;justify-content: space-between;width: 100%;">
                <div style="width: 202px;display: flex;flex-direction: column;justify-content: space-evenly;align-items: center;">
                    <div style="width: 202px;height: 126px">
                        <img style="width: 100%;height: 100%;" class="img-rounded" src="http://n.sinaimg.cn/news/1_img/upload/c4b46437/698/w899h599/20201014/9105-kakmcxe6746740.jpg">
                    </div>
                    <div class="h5">
                        10月14日 14:15:52
                    </div>
                </div>
                <div class="lead other-body">
                    兴办经济特区，是党和国家为推进改革开放和社会主义现代化建设进行的伟大创举。1978年12月，党的十一届三中全会作出把党和国家工作中心转移到经济建设上来、实行改革开放的历史性决策，动员全党全国各族人民为社会主义现代化建设进行新的长征。1979年4月，广东省委负责人向中央领导同志提出兴办出口加工区、推进改革开放的建议。邓小平同志明确指出，还是叫特区好，中央可以给些政策，你们自己去搞，杀出一条血路来。同年7月，党中央、国务院批准广东、福建两省实行“特殊政策、灵活措施、先行一步”，并试办出口特区。1980年8月党和国家批准在深圳、珠海、汕头、厦门设置经济特区，1988年4月又批准建立海南经济特区，明确要求发挥经济特区对全国改革开放和社会主义现代化建设的重要窗口和示范带动作用。
                </div>

            </div>
            <!--转发，评论，点赞-->
            <div class="right"  style="position: absolute;right: 20px;bottom: 20px; display: flex;width: 700px;justify-content: space-evenly;">
                <div style="display: flex;" class="user-input">
                    <span class="glyphicon glyphicon glyphicon-share" aria-hidden="true" style="font-size: 24px;"></span>
                    <span style="font-size: 15px; font-weight: bold;">&nbsp;1254</span>
                </div>
                <!-- 评论 -->
                <div style="display: flex;align-items: center;" class="user-input">
                    <span class="glyphicon glyphicon glyphicon-comment" aria-hidden="true" style="font-size: 24px;"></span>
                    <span style="font-size: 15px; font-weight: bold;">&nbsp;1254</span>
                </div>
                <!-- 点赞 -->
                <div style="display: flex;align-items: center;" class="user-input">
                    <span class="glyphicon glyphicon-hand-right" aria-hidden="true" style="font-size: 24px;"></span>
                    <span style="font-size: 15px; font-weight: bold;">&nbsp;154</span>
                </div>
            </div>
        </div>
    </div>
    <div class="other-news-group">
        <div class="other-news-item">
            <div class="h2">sit amet, consectetur adipiscing elit. Aenean 4</div>
            <div style="display: flex;justify-content: space-between;width: 100%;">
                <div style="width: 202px;display: flex;flex-direction: column;justify-content: space-evenly;align-items: center;">
                    <div style="width: 202px;height: 126px">
                        <img style="width: 100%;height: 100%;" class="img-rounded" src="http://n.sinaimg.cn/news/1_img/upload/c4b46437/698/w899h599/20201014/9105-kakmcxe6746740.jpg">
                    </div>
                    <div class="h5">
                        10月14日 14:15:52
                    </div>
                </div>
                <div class="lead other-body">
                    兴办经济特区，是党和国家为推进改革开放和社会主义现代化建设进行的伟大创举。1978年12月，党的十一届三中全会作出把党和国家工作中心转移到经济建设上来、实行改革开放的历史性决策，动员全党全国各族人民为社会主义现代化建设进行新的长征。1979年4月，广东省委负责人向中央领导同志提出兴办出口加工区、推进改革开放的建议。邓小平同志明确指出，还是叫特区好，中央可以给些政策，你们自己去搞，杀出一条血路来。同年7月，党中央、国务院批准广东、福建两省实行“特殊政策、灵活措施、先行一步”，并试办出口特区。1980年8月党和国家批准在深圳、珠海、汕头、厦门设置经济特区，1988年4月又批准建立海南经济特区，明确要求发挥经济特区对全国改革开放和社会主义现代化建设的重要窗口和示范带动作用。
                </div>

            </div>
            <!--转发，评论，点赞-->
            <div class="right"  style="position: absolute;right: 20px;bottom: 20px; display: flex;width: 700px;justify-content: space-evenly;">
                <div style="display: flex;" class="user-input">
                    <span class="glyphicon glyphicon glyphicon-share" aria-hidden="true" style="font-size: 24px;"></span>
                    <span style="font-size: 15px; font-weight: bold;">&nbsp;1254</span>
                </div>
                <!-- 评论 -->
                <div style="display: flex;align-items: center;" class="user-input">
                    <span class="glyphicon glyphicon glyphicon-comment" aria-hidden="true" style="font-size: 24px;"></span>
                    <span style="font-size: 15px; font-weight: bold;">&nbsp;1254</span>
                </div>
                <!-- 点赞 -->
                <div style="display: flex;align-items: center;" class="user-input">
                    <span class="glyphicon glyphicon-hand-right" aria-hidden="true" style="font-size: 24px;"></span>
                    <span style="font-size: 15px; font-weight: bold;">&nbsp;154</span>
                </div>
            </div>
        </div>
    </div>
    <div class="other-news-group">
        <div class="other-news-item">
            <div class="h2">sit amet, consectetur adipiscing elit. Aenean 4</div>
            <div style="display: flex;justify-content: space-between;width: 100%;">
                <div style="width: 202px;display: flex;flex-direction: column;justify-content: space-evenly;align-items: center;">
                    <div style="width: 202px;height: 126px">
                        <img style="width: 100%;height: 100%;" class="img-rounded" src="http://n.sinaimg.cn/news/1_img/upload/c4b46437/698/w899h599/20201014/9105-kakmcxe6746740.jpg">
                    </div>
                    <div class="h5">
                        10月14日 14:15:52
                    </div>
                </div>
                <div class="lead other-body">
                    兴办经济特区，是党和国家为推进改革开放和社会主义现代化建设进行的伟大创举。1978年12月，党的十一届三中全会作出把党和国家工作中心转移到经济建设上来、实行改革开放的历史性决策，动员全党全国各族人民为社会主义现代化建设进行新的长征。1979年4月，广东省委负责人向中央领导同志提出兴办出口加工区、推进改革开放的建议。邓小平同志明确指出，还是叫特区好，中央可以给些政策，你们自己去搞，杀出一条血路来。同年7月，党中央、国务院批准广东、福建两省实行“特殊政策、灵活措施、先行一步”，并试办出口特区。1980年8月党和国家批准在深圳、珠海、汕头、厦门设置经济特区，1988年4月又批准建立海南经济特区，明确要求发挥经济特区对全国改革开放和社会主义现代化建设的重要窗口和示范带动作用。
                </div>

            </div>
            <!--转发，评论，点赞-->
            <div class="right"  style="position: absolute;right: 20px;bottom: 20px; display: flex;width: 700px;justify-content: space-evenly;">
                <div style="display: flex;" class="user-input">
                    <span class="glyphicon glyphicon glyphicon-share" aria-hidden="true" style="font-size: 24px;"></span>
                    <span style="font-size: 15px; font-weight: bold;">&nbsp;1254</span>
                </div>
                <!-- 评论 -->
                <div style="display: flex;align-items: center;" class="user-input">
                    <span class="glyphicon glyphicon glyphicon-comment" aria-hidden="true" style="font-size: 24px;"></span>
                    <span style="font-size: 15px; font-weight: bold;">&nbsp;1254</span>
                </div>
                <!-- 点赞 -->
                <div style="display: flex;align-items: center;" class="user-input">
                    <span class="glyphicon glyphicon-hand-right" aria-hidden="true" style="font-size: 24px;"></span>
                    <span style="font-size: 15px; font-weight: bold;">&nbsp;154</span>
                </div>
            </div>
        </div>
    </div>
</div>



<!--登录按钮模态框-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">登录你的账号</h4>
            </div>
            <div class="modal-body">
                <div class="login-page">
                    <form class="login-body"  id="login-form" method="post" action="${pageContext.request.contextPath}/userLogin">
                        <input type="hidden" value="login" name="hidden">
                        <a href="javascript:regist()" style="position: absolute; right: 20px; top: 12px;">没有账号？立即注册</a>
                        <div class="form-horizontal" style="width: 100%;display: flex;flex-direction: column;align-items: center;">
                            <!-- 用户账号或邮箱 -->
                            <div class="form-group" style="width: 90%;">
                                <div class="col-sm-12"  style="width: 100%;margin-top:30px;">
                                    <input type="text" class="form-control input-lg" id="inputEmail3" name="username" value="${requestScope.userinfo.username}" placeholder="邮箱/昵称">
                                </div>
                            </div>

                            <!-- 密码 -->
                            <div class="form-group" style="width: 90%; margin-top: 10px;">
                                <div class="col-sm-12"  style="width: 100%;">
                                    <input type="password" class="form-control input-lg" id="inputEmail4" name="password" value="${requestScope.userinfo.password}" placeholder="密码">
                                </div>
                            </div>

                            <!-- 验证码 -->
                            <div class="form-group" style="width: 90%; margin-top:10px;">
                                <div class="col-sm-12"  style="width: 100%;display: flex; justify-content: space-evenly;">
                                    <input type="text" class="form-control input-lg" style="width: 60%; margin-right: 30px;"  name="verifyCode" placeholder="验证码">
                                    <div style="width: 23%; height: 46px; margin-right: 15px; overflow:hidden;">
                                        <img class="img-code" id="loginIdentifyingCode" src="${pageContext.request.contextPath}/identifyingCode">
                                    </div>
                                    <a href="javascript:switchImg()" style="width: 12%;height: 46px;line-height: 46px;">换一张</a>
                                </div>
                            </div>

                            <div style="width:90%;text-indent: 20px;display: flex;justify-content:space-between;">
                                <a href="javascript:forget()" id="forget-password">忘记密码？</a>
                            </div>

                            <div class="form-group " style="width: 90%; margin-top: 20px;">
                                <div class="col-sm-12"  style="width: 100%; height: 50px;">
                                    <input type="submit" class="btn input-lg btn-info" value="登录" style="width: 100%;height:50px;display: flex;align-items: center;justify-content: center;font-size: 20px;"/>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!--注册按钮模态框-->
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel1">新用户注册</h4>
            </div>
            <div class="modal-body">
                <div class="login-page">
                    <div class="login-body">
                        <a href="javascript:login()" style="position: absolute; right: 20px; top: 13px;">已有账号？立即登录</a>
                        <form id="form-register" action="${pageContext.request.contextPath}/userRegister" method="post" class="form-horizontal" style="width: 100%;display: flex;flex-direction: column;align-items: center;">
                            <!-- 新用户注册表单 -->
                            <div class="form-group" style="width: 90%;">
                                <!-- 邮箱 -->
                                <div class="col-sm-12"  style="width: 100%;margin-top: 20px;">
                                    <input type="email" class="form-control input-lg" name="email" value="${requestScope.user.email}"  placeholder="邮箱">
                                </div>
                            </div>
                            <!-- 昵称 -->
                            <div class="form-group" style="width: 90%; margin-top: 10px;">
                                <div class="col-sm-12"  style="width: 100%;">
                                    <input type="text" class="form-control input-lg" name="username" value="${requestScope.user.username}" placeholder="昵称">
                                </div>
                            </div>
                            <!-- 年龄 -->
                            <div class="form-group" style="width: 90%; margin-top: 10px;">
                                <div class="col-sm-12"  style="width: 100%;">
                                    <input type="number" class="input-lg form-control" name="age" value="${requestScope.user.age}" placeholder="年龄" />
                                </div>
                            </div>

                            <!-- 密码 -->
                            <div class="form-group" style="width: 90%; margin-top: 10px;">
                                <div class="col-sm-12"  style="width: 100%;">
                                    <input type="password" class="form-control input-lg" id="password" name="password" value="${requestScope.user.password}" placeholder="密码">
                                </div>
                            </div>

                            <!-- 确认密码 -->
                            <div class="form-group" style="width: 90%; margin-top: 10px;">
                                <div class="col-sm-12"  style="width: 100%;">
                                    <input type="password" class="form-control input-lg" name="passwordVerify" id="passwordVerify" value="${requestScope.user.password}" placeholder="确认密码">
                                </div>
                            </div>


                            <!-- 性别 与 城市 -->
                            <div class="form-group" style="width: 90%; margin-top: 10px;">
                                <div class="col-sm-12"  style="width: 30%;">
                                    <select id="disabledSelect" name="gender" style="color: #9d9d9d; font-size: 18px; padding: 5px 0px;" class="form-control">
                                        <option  value="男" class="select-city" selected>小哥哥</option>
                                        <option  value="女" class="select-city">小仙女</option>
                                    </select>
                                </div>
                                <div class="col-sm-12"  style="width: 30%;">
                                    <select id="disabledSelect1" name="city" style="color: #9d9d9d; font-size: 18px; padding: 5px 0px;" class="form-control">
                                        <option selected  value="北京" class="select-city">北京</option>
                                        <option  value="上海" class="select-city">上海</option>
                                        <option  value="天津" class="select-city">天津</option>
                                        <option  value="深圳" class="select-city">深圳</option>
                                        <option  value="贵阳" class="select-city">贵阳</option>
                                        <option  value="四川" class="select-city">四川</option>
                                        <option  value="重庆" class="select-city">重庆</option>
                                        <option  value="成都" class="select-city">成都</option>
                                    </select>
                                </div>
                            </div>

                            <!-- 验证码 -->
                            <div class="form-group" style="width: 90%; margin-top:10px;">
                                <div class="col-sm-12"  style="width: 100%;display: flex; justify-content: space-evenly;">
                                    <input type="text" name="verifyCode" class="form-control input-lg" style="width: 60%; margin-right: 30px;" id="inputEmail8" placeholder="验证码">
                                    <div style="width: 23%; height: 46px; margin-right: 15px; overflow:hidden;">
                                        <img class="img-code" id="registerIdentifyingCode" src="${pageContext.request.contextPath}/identifyingCode">
                                    </div>
                                    <a href="javascript:switchImg()" style="width: 12%;height: 46px;line-height: 46px;">换一张</a>
                                </div>
                            </div>

                            <!-- 注册按钮 -->
                            <div class="form-group " style="width: 90%; margin-top: 20px;">
                                <div class="col-sm-12"  style="width: 100%; height: 50px;">
                                    <input type="submit" id="submit-btn" class="btn input-lg btn-success" value="注册"  style="width: 100%;height:50px;display: flex;align-items: center;justify-content: center;font-size: 20px;">
                                    </input>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--管理员登录按钮模态框-->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel2">管理员登录</h4>
            </div>
            <div class="modal-body">
                <div class="login-page">
                    <form class="login-body" action="userandadmin" method="post">
                        <input type="hidden" value="adminlogin" name="hidden">
                        <div class="form-horizontal" style="width: 100%;display: flex;flex-direction: column;align-items: center;">
                            <!-- 管理员账号或邮箱 -->
                            <div class="form-group" style="width: 90%;">
                                <div class="col-sm-12"  style="width: 100%;margin-top: 30px;">
                                    <input type="text" class="form-control input-lg" id="inputEmail6" name="username" placeholder="管理员ID">
                                </div>
                            </div>

                            <!-- 密码 -->
                            <div class="form-group" style="width: 90%; margin-top: 20px;">
                                <div class="col-sm-12"  style="width: 100%;">
                                    <input type="password" class="form-control input-lg" id="inputEmail7" name="password" placeholder="密码">
                                </div>
                            </div>

                            <!-- 验证码 -->
                            <div class="form-group" style="width: 90%; margin-top:20px;">
                                <div class="col-sm-12"  style="width: 100%;display: flex; justify-content: space-evenly;">
                                    <input type="text" class="form-control input-lg" style="width: 60%; margin-right: 30px;"  name="verifycode" placeholder="验证码">
                                    <div style="width: 23%; height: 46px; margin-right: 15px; overflow:hidden;">
                                        <img class="img-code" id="adminLoginIdentifyingCode" src="${pageContext.request.contextPath}/identifyingCode">
                                    </div>
                                    <a href="javascript:switchImg()" style="width: 12%;height: 46px;line-height: 46px;">换一张</a>
                                </div>
                            </div>

                            <div style="width:90%;text-indent: 20px;display: flex;justify-content:space-between;">
                                <div style="margin-left: 2px;color: brown;">账号错误</div>
                                <a href="javascript:forget()" id="forget-password1">忘记密码？</a>
                            </div>

                            <div class="form-group " style="width: 90%; margin-top: 30px;">
                                <div class="col-sm-12"  style="width: 100%; height: 50px;">
                                    <input type="submit"value="登录"class="btn input-lg btn-danger" style="width: 100%;height:50px;display: flex;align-items: center;justify-content: center;font-size: 20px;">
<%--                                    <a class="btn input-lg btn-danger" href="adminlogin" style="width: 100%;height:50px;display: flex;align-items: center;justify-content: center;font-size: 20px;">登录--%>
<%--                                    </a>--%>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!--忘记密码按钮模态框-->
<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel12">忘记密码</h4>
            </div>
            <div class="modal-body">
                <div class="login-page">
                    <form class="login-body" id="form-forget"  action="${pageContext.request.contextPath}/forgetPassword" method="post">
                        <div class="form-horizontal" style="width: 100%;display: flex;flex-direction: column;align-items: center;">
                            <!-- 账号或邮箱 -->
                            <div class="form-group" style="width: 90%;">
                                <div class="col-sm-12"  style="width: 100%;margin-top: 30px;">
                                    <input type="text" class="form-control input-lg" id="inputEmail137" name="username" placeholder="邮箱/昵称">
                                </div>
                            </div>

                            <!-- 所在城市 -->
                            <div class="form-group" style="width: 90%; margin-top: 20px;">
                                <div class="col-sm-12"  style="width: 100%;">
                                    <input type="text" class="form-control input-lg" id="inputEmail17" name="city" placeholder="所在城市">
                                </div>
                            </div>
                            <!-- 要更改的密码 -->
                            <div class="form-group" style="width: 90%; margin-top: 20px;">
                                <div class="col-sm-12"  style="width: 100%;">
                                    <input type="password" class="form-control input-lg" id="passwordf" name="password" placeholder="新密码">
                                </div>
                            </div>
                            <!-- 确定更改的密码 -->
                            <div class="form-group" style="width: 90%; margin-top: 20px;">
                                <div class="col-sm-12"  style="width: 100%;">
                                    <input type="password" class="form-control input-lg"  name="passwordVerify" placeholder="确定密码">
                                </div>
                            </div>
                            <!-- 验证码 -->
                            <div class="form-group" style="width: 90%; margin-top:20px;">
                                <div class="col-sm-12"  style="width: 100%;display: flex; justify-content: space-evenly;">
                                    <input type="text" class="form-control input-lg" style="width: 60%; margin-right: 30px;"  name="verifyCode" placeholder="验证码">
                                    <div style="width: 23%; height: 46px; margin-right: 15px; overflow:hidden;">
                                        <img class="img-code" id="forgetPasswordIdentifyingCode" src="${pageContext.request.contextPath}/identifyingCode">
                                    </div>
                                    <a href="javascript:switchImg()" style="width: 12%;height: 46px;line-height: 46px;">换一张</a>
                                </div>
                            </div>

                            <div class="form-group" style="width: 90%; margin-top:10px;">
                                <div style="width:90%;text-indent: 20px;display: flex;justify-content:space-between;">

                                </div>
                            </div>

                            <div class="form-group " style="width: 90%; margin-top: 20px;">
                                <div class="col-sm-12"  style="width: 100%; height: 50px;">
                                    <input type="submit" value="修改密码" class="btn input-lg btn-warning" href="javascript:restart()" style="width: 100%;height:50px;display: flex;align-items: center;justify-content: center;font-size: 20px;">
<%--                                    <a class="btn input-lg btn-warning" href="javascript:restart()" style="width: 100%;height:50px;display: flex;align-items: center;justify-content: center;font-size: 20px;">验证--%>
<%--                                    </a>--%>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!--重置密码按钮模态框-->
<div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel22">重置密码</h4>
            </div>
            <div class="modal-body">
                <div class="login-page">
                    <form class="login-body">
                        <div class="form-horizontal" style="width: 100%;display: flex;flex-direction: column;align-items: center;">
                            <!-- 账号或邮箱 -->
                            <div class="form-group" style="width: 90%;">
                                <div class="col-sm-12"  style="width: 100%;margin-top: 30px;">
                                    <input type="text" class="form-control input-lg" id="inputEmail16" name="username" placeholder="邮箱/昵称">
                                </div>
                            </div>

                            <!-- 所在城市 -->
                            <div class="form-group" style="width: 90%; margin-top: 20px;">
                                <div class="col-sm-12"  style="width: 100%;">
                                    <input type="text" class="form-control input-lg" id="inputEmail27" name="city" placeholder="所在城市">
                                </div>
                            </div>

                            <!-- 验证码 -->
                            <div class="form-group" style="width: 90%; margin-top:20px;">
                                <div class="col-sm-12"  style="width: 100%;display: flex; justify-content: space-evenly;">
                                    <input type="text" class="form-control input-lg" style="width: 60%; margin-right: 30px;"  name="verifycode" placeholder="验证码">
                                    <div style="width: 23%; height: 46px; margin-right: 15px; overflow:hidden;">
                                        <img class="img-code" src="${pageContext.request.contextPath}/identifyingCode">
                                    </div>
                                    <a href="javascript:switchImg()" style="width: 12%;height: 46px;line-height: 46px;">换一张</a>
                                </div>
                            </div>

                            <div class="form-group " style="width: 90%; margin-top: 30px;">
                                <div class="col-sm-12"  style="width: 100%; height: 50px;">
                                    <a class="btn input-lg btn-success" style="width: 100%;height:50px;display: flex;align-items: center;justify-content: center;font-size: 20px;">完成
                                    </a>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<button onclick="toTop()">回到顶部</button>
</body>
</html>