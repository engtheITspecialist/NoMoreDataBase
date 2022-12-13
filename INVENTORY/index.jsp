
<!DOCTYPE html>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy");
request.setAttribute("year", sdf.format(new java.util.Date()));
request.setAttribute("tomcatUrl", "http://tomcat.apache.org/");
request.setAttribute("tomcatDocUrl", "/docs/");
request.setAttribute("tomcatExamplesUrl", "/examples/");
%>
<html lang="en">
    <head>
        <title><%=request.getServletContext().getServerInfo() %></title>
        <link href="favicon.ico" rel="icon" type="image/x-icon" />
        <link href="favicon.ico" rel="shortcut icon" type="image/x-icon" />
        <link href="tomcat.css" rel="stylesheet" type="text/css" />
<link href="style.css" rel="stylesheet" type="text/css" />
    </head>

    <body>
        <div id="wrapper">
          
          <%@page import="java.io.IOException" %>
          <%@page import="javax.xml.parsers.DocumentBuilder" %>
          <%@page import="javax.xml.parsers.DocumentBuilderFactory" %>
          <%@page import="javax.xml.parsers.ParserConfigurationException" %>
          <%@page import="org.w3c.dom.*" %>
          <%@page import="org.xml.sax.SAXException" %>
          
        <%  
          DocumentBuilderFactory factory= DocumentBuilderFactory.newInstance();
	      DocumentBuilder builder=factory.newDocumentBuilder();	
		org.w3c.dom.Document doc= builder.parse("C:/users.xml");
			NodeList userList=doc.getElementsByTagName("Row");
			 int fLengt=userList.getLength();
			%>
			<table border="1"><tr id="stil"><td>KULLANICI</td><td>CIHAZ</td><td>MARKA</td><td>MODEL</td><td>NATO STOK NO</td><td>SERI NO</td><td>BIM NO</td><td>MAC</td><td>IP</td><td>AG</td><td>NOT</td>
			<%
			 for(int i=0;i<fLengt;i++){
				 %><tr>
				 <%
				 Node rowI=userList.item(i);
				 if(rowI.getNodeType()==Node.ELEMENT_NODE){
					 Element row=(Element)rowI;
					 String index=row.getAttribute("index");
					 NodeList nameList=row.getChildNodes();
					 for(int j=0;j<nameList.getLength();j++){
						 Node n= nameList.item(j);
						 if(n.getNodeType()==Node.ELEMENT_NODE){
							 Element name=(Element) n;
							 
							 
							 
							 out.println("<td>"+name.getTextContent()+"</td>");
						 
						 
						 }
					 }
				 }
			 }
			
	
           %>
           </tr></table>
        </div>
    </body>

</html>
