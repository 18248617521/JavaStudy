<%@ page language="java" import="java.util.*" import="com.yhy.model.GoodsInfo" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>商品清单</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script>
		function addCar(){
			var flag=false;
			var eles=doucument.getElementsByName("addGoods");
			for(var i=0;i<eles.length;i++)
			{
				if(eles[i].checked)
				{
					falg=true;
					break;
				}
			}
			if(flag){
				return true;
			}else
			{
				alert("对不起，您没有选择商品！");
				return false;
			}
		}
	</script>

  </head>
  
  <body>
  	
  <form action="carServlet" method="post">
  <center>
  <input type="submit" name="submitCar" value="添加到购物车" >
  	<table width="500px" height="200px">
  		<tr>
  			<td align="center">商品编号</td>
  			<td align="center">商品名字</td>
  			<td align="center">商品类型名</td>
	  		<td align="center">商品价格</td>
	  		<td align="center">加入购物车</td>
  		</tr>
  		
  		<% 
  		List<GoodsInfo> list=new ArrayList<GoodsInfo>();
  		list=(ArrayList<GoodsInfo>)request.getAttribute("listShop");
  		for(GoodsInfo h:list)
  		{
  		%>
  	
    	<tr>
    		<td align="center"><%=h.getGoods_id().toString()%></td>
    		<td align="center"><%=h.getGoods_name()%></td>
    		<td align="center"><%=h.getGoodsType().getType_name()%></td>
    		<td align="center"><%=h.getGoods_price().toString()%></td>
    		<td> <input type="checkbox" name="addGoods" value="<%=h.getGoods_id().toString()%>"> </td>
    	</tr>
    	<%
    	}
    	 %>
    	
    </table> 
  </center>
  </form>
  </body>
</html>
