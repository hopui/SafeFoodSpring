<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.io.*,java.net.*" %>
<%
	URL url = new URL(request.getParameter("getUrl"));
	URLConnection connection = url.openConnection();
	connection.setRequestProperty("CONTENT-TYPE","text/html"); 
    BufferedReader in = new BufferedReader(new InputStreamReader(url.openStream(),"utf-8"));
    String inputLine;
    String buffer = "";
    while ((inputLine = in.readLine()) != null){
     	buffer += inputLine.trim();
    }
    in.close();
%><%=buffer%>