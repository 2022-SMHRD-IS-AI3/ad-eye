<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
	<form role="form" action="/member" method="post">
          <div class="form-group">
            <label>Title</label> <input class="form-control" name="mem_id">
          </div>

          <div class="form-group">
            <label>Writer</label> <input class="form-control" name="mem_pw">
          </div>
          <button type="submit" class="btn btn-default">Submit
            Button</button>
          <button type="reset" class="btn btn-default">Reset Button</button>
        </form>
</body>
</html>
