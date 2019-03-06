<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>KeepNote</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<style>
    table,th,td,form{
        border:1px solid black;
    }
</style>
</head>
<body>
	<!-- Create a form which will have text boxes for Note ID, title, content and status along with a Send 
		 button. Handle errors like empty fields -->
		 <form action="/saveNote">
			 Note ID: <input type="number" name="noteId"/><br>
			 Title : <input type="text" name="noteTitle"><br>
			 Content : <input type="text" name="noteContent"><br>
			 Status : <input type="text" name="noteStatus"><br>
			 <input type="submit" value="add a new Note">
	 </form>
	<table>
        <tbody>
            <tr><th>ID</th><th>Title</th><th>Content</th>
				<th>Status</th><th>Create At</th>
            </tr>
             <c:forEach items="${list}" var="noteVar">
	            <tr>
	       			<td>${noteVar.noteId}</td>
	                <td>${noteVar.noteTitle}</td>
	                <td>${noteVar.noteContent}</td>
	                <td>${noteVar.noteStatus}</td>
	                <td>${noteVar.createdAt}</td>
	            </tr>
      		</c:forEach>
        </tbody>
    </table>
	<!-- display all existing notes in a tabular structure with Id, Title,Content,Status, Created Date and Action -->
</body>
</html>