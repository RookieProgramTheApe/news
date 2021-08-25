<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
	<head>
		<%
			//    StringBuffer basePath = request.getRequestURL();
    /*
    request.getScheme()：获取http协议
    request.getServerName()：获取ip地址
    request.getServerPort()：获取端口号
    request.getContextPath();获取工程路径
     */
			String basePath = request.getScheme()
					+"://"
					+request.getServerName()
					+":"
					+request.getServerPort()
					+request.getContextPath()
					+"/";
		%>
		<meta charset="utf-8">
		<title>添加新闻</title>
		<base href="<%=basePath%>">
		<style>
			.contentOuter{
				width: 95%;
				height: 800px;
				margin: 0 auto;
				margin-top: 50px;
			}
			table{
				border-collapse: collapse;
				width: 100%;
				text-align: center;
			}
			tr{
	
				height: 40px;
			}
			td{
				border: 0.5px solid #000;
				/* font-size: 16px; */
				
				}
				input{
					width: 98%;
					height: 40px;
					border: none;
				}
		</style>
	</head>
	<body>
		<div class="contentOuter">
		      <form action="newsservlet" method="get">
				<input type="hidden" value="add" name="hidden"/>
			<table>
				<tr style="background-color: #999;">
					<td>标题</td>
					<td>类型</td>
					<td>时间</td>
					<td>作者</td>
				</tr>
				<tr>
					<td><input type="text" name="newstitle"/></td>
					<td><input type="text" name="newstype"/></td>
					<td><input type="text" name="time" placeholder="时间由系统提供" disabled="disabled" /></td>
					<td><input type="text" name="author"/></td>
				</tr>
				<tr  style="background-color: #999;">
					<td  colspan="4">内容</td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea  type="text" autofocus="autofocus" rows="3" cols="20" name="content" style="height: 500px; width: 99%;font-size: 15px;border: none;"> 
					    </textarea>
					</td>
				</tr>
				<tr><td><input type="submit" value="保存"  style="font-size: 18px; background-color: #D5D5D5;"/></td></tr>
			</table>
		</form>
		
	</body>
</html>
