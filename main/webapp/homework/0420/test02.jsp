<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style></style>
    <script>
    	'use strict';
    	function check() {
    		if ('' == $("#num").val()) {
    			alert("숫자를 입력하세요");
    			return false;
    		}
    		confirm("거듭제곱값을 구합니다");
    		form.submit();
    	}
    </script>
</head>
<body>
<p><br></p>
<div class="container">
<pre>
	문제1. 수를 입력받아 입력받은 수의 거듭제곱값을 출력하시오?(서블릿으로 구현)
	서블릿파일명 : t0420.Test02
	컨트롤러경로명 : tt02Ok
</pre>
<form name="form" method="post" action="<%=request.getContextPath()%>/tt02Ok">
	<label for="num" class="col m-2">숫자를 입력하세요</label>
	<input type="number" name="num" id="num" min="0" max="100000"  class="form-control m-2"/>
	<input type="button" value="전송" onclick="check()" class="btn btn-success form-control m-2"/>
	<input type="reset" value="취소"  class="btn btn-success form-control m-2"/>
</form>
</div>
</body>
</html>