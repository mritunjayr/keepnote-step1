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
   #table th,#table td,#table tr{
        background-color: lightyellow;

        padding: 10px;

        border: 3px solid lightblue;

        align-items: center;

        align-content: center;
        text-align:center;
        width: 18%;
    }
    #form{
    margin: 0 auto;

    width: 70%;

    display: flex;

    flex-direction: column;

    flex-wrap: wrap;

    justify-content: space-around;

    align-items: center;

    align-content: space-around;

    background-color: #41bccb;

    box-shadow: 12px -12px 15.3px slateblue;
    }
    .item{
	width: 80%;
    }
    #table{
    width: 70%;

    border: 1px solid black;

    box-shadow: 5px 6px 10px cadetblue;

    background-color: floralwhite;

    margin: 0 auto;

    margin-top: 18px;
    }
</style>
</head>
<body>

    <center><H1 style="background: aquamarine;">KeepNote</H1>
    <c:if test="${error ne null}">
        <p style="color:red;">${error}</p>
    </c:if>
    </center>

	<!-- Create a form which will have text boxes for Note ID, title, content and status along with a Send 
		 button. Handle errors like empty fields -->
		 <form action="/saveNote" id="form">
		 	<table>
			 	<tr>
				<td> Note ID: </td><td><input type="number" name="noteId" required min="1" pattern="[0-9]{1,}" /></td>
				</tr>
				<tr>
				 <td>Title :</td> <td><input type="text" name="noteTitle" required></td>
				</tr>
				 <tr>
				<td>
				 Content :</td> <td><input type="text" name="noteContent" required></td>
				</tr>
				<tr>
				<td>
				 Status :</td><td> <input type="text" name="noteStatus" required></td></tr>
				 <tr>
			    <td>
				 <input type="submit" value="add a new Note"></td>
				</tr>
			</table>
	 </form>
	 <c:if test = "${list.size() > 0}">
	<table id="table">
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
	                <td>${noteVar.createdAt}<a href="/deleteNote?noteId=${noteVar.noteId}"><button>delete</button></a></td>
	            </tr>
      		</c:forEach>
        </tbody>
    </table>
    </c:if>
	<!-- display all existing notes in a tabular structure with Id, Title,Content,Status, Created Date and Action -->
</body>
</html>