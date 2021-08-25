<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>新闻详情</title>
		<style>
			.contentOuter{
				width: 80%;
				height: 800px;

				margin: 0 auto;
			}
			.contentMain{
				width: 80%;
				height: 800px;
				/* border: 1px solid #122B40; */
				margin: 0 auto;
				line-height: 1.5;
				box-sizing: border-box;
				padding: 0 15px;
			
			}
			table{
				width: 80%;
				height: 20px;
				/* border: 1px solid #122B40; */
				margin: 10px auto;
				text-align: center;
				
			}
			
		</style>
	</head>
	<body>
		<div class="contentOuter">
<%--			新闻标题--%>
			<h3 style="text-align: center;">${requestScope.contents.newstitle}</h3>
			<div>
				<table >
					<tr >
<%--						新闻类型--%>
						<td>类型：${requestScope.contents.newstype}</td>
<%--	发布时间--%>
						<td>发布时间:${requestScope.contents.time}</td>
						<td>作者：${requestScope.contents.author}</td>
					</tr>
				</table>
			</div>
			<div class="contentMain">
				正文：&nbsp &nbsp ${requestScope.contents.content}
		</div>
	</body>
</html>
