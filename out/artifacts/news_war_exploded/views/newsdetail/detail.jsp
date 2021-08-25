<%--
  Created by IntelliJ IDEA.
  @作者: search
  @创建时间:2020/12/2 下午 3:03
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新闻详情</title>
</head>
<body>
<div id="div1" style="width: 90%;height: 3000px;">
</div>


<script type="text/javascript" src="${pageContext.request.contextPath}/js/wangEditor.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/axios.min.js"></script>
<script type="text/javascript">
    $(() => {
        const E = window.wangEditor
        const editor = new E('#ddd','#div1')
        editor.create()
        if (${requestScope.newsDetail.id == 0}){
            alert("新闻详情信息获取失败")
        }else {
            // 为给定 ID 的 user 创建请求
            axios.get('${pageContext.request.contextPath}/findByIdDetail?id=${requestScope.newsDetail.id}').then((response) => {
                    console.log(response);
                    editor.txt.html(response.data)
                }).catch((error) => {
                    alert("新闻数据获取失败，请联系管理员")
                });
            editor.disable()
        }
    })
</script>
</body>
</html>
