<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>sungjuk2.jsp</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
  <script>
  	'use strict';
    function fCheck() {
    	let name = myForm.name.value;
    	let gender = myForm.gender.value;
    	let languages = myForm.language;
    	let languageChecked = 0;
    	for (let i=0; i<languages.length; i++) {
    		if (languages[i].checked == true) languageChecked++;
    	}
    	let no = myForm.no.value;
    	let hakyun = myForm.hakyun.value;
    	let hakyunOption = myForm.hakyunOption.value;
    	let kor = myForm.kor.value;
    	let eng = myForm.eng.value;
    	let mat = myForm.mat.value;
    	let sports = myForm.sports.value;
    	let otherSports = myForm.otherSports.value;
    	
    	if(name == "") {
    		alert("성명을 입력하세요!");
    		myForm.name.focus();
    	}
    	else if(languageChecked == 0) {
    		alert("사용가능 컴퓨터언어를 입력하세요!");
    		myForm.language[0].focus();
    		//document.getElementById("language1").focus();
    	}
    	else if(no == "") {
    		alert("학생 번호를 입력하세요!");
    		myForm.no.focus();
    	}
    	else if(hakyun == "" && hakyunOption == "") {
    		alert("학년을 입력하세요!");
    		myForm.hakyun.focus();
    	}
    	else if(hakyun == "" && (5 > hakyunOption || 6 < hakyunOption)) {
    		alert("학년은 6학년까지 입력가능합니다");
    		myForm.hakyunOption.value = '';
    		myForm.hakyunOption.focus();
    	}
    	else if(kor == "") {
    		alert("국어 점수를 입력하세요!");
    		myForm.no.focus();
    	}
    	else if(eng == "") {
    		alert("영어 점수를 입력하세요!");
    		myForm.no.focus();
    	}
    	else if(mat == "") {
    		alert("수학 점수를 입력하세요!");
    		myForm.no.focus();
    	}
    	else if(sports == "") {
    		alert("좋아하는 스포츠를 1개이상 선택 하세요!");
    		myForm.sports.focus();
    	}
    	else if(sports == "기타" && otherSports == "") {
    		alert("좋아하는 스포츠를 1개이상 입력하세요");
    		myForm.otherSports.focus();
    	}
    	else {
    		myForm.submit();
    	}
    }
    
    function changeHakyun() {
    	let options = myForm.hakyun.options;
    	//sports가 '기타' 선택이면, 기타스포츠 항목으로 포커스 설정
    	if(options[0].selected == true && myForm.hakyunOption.value == '' ) {
    		myForm.hakyunOption.focus();
    	} else {
    		options[0].selected = false;
    		myForm.hakyunOption.value = '';
    	}
    }
    
    function changeHakyunOption() {
    	let options = myForm.hakyun.options;
    	for (let i=0; i<options.length; i++) {
    		options[i].selected = false;
    	}
    	myForm.hakyun.options[0].selected = true; 
    }
    
    function changeSports() {
    	let options = myForm.sports.options;
    	//sports가 '기타' 선택이면, 기타스포츠 항목으로 포커스 설정
    	if(options[11].selected == true && myForm.otherSports.value == '' ) {
    		myForm.otherSports.focus();
    	} else {
    		options[11].selected = false;
    		myForm.otherSports.value = '';
    	}
    }
    
    function changeOtherSport() {
    	let options = myForm.sports.options;
    	for (let i=0; i<options.length; i++) {
    		options[i].selected = false;
    	}
    	//sports는 '기타'로 설정
    	myForm.sports.options[11].selected = true;
    }
  </script>
</head>
<body>
<p><br/></p>
<div  class="container" align="left">
문제3: 성적평가표 만들기<br>
입력사항 : 성명(name : text), 성별(gender : radio), 학생번호(no : number), 학년(hakyun:콤보상자), 국어(kor:number), 영어(eng:number), 수학(mat:number), 전송버튼(button), 취소(reset)<br>
자바스크립트를 이용한 유효성체크(공백)<br>
전송받을 주소? /sungjukOk2 (컨트롤러 어노테이션 이용)<br>
출력사항 : 입력사항 모두 + 총점/평균/학점<br>
</div>
<br/>
<hr/>
<div class="container" align="center">
	<form name="myForm" method="get" action='<%=request.getContextPath()%>/sungjukOk2' >
	  <caption><h2>성 적 입 력</h2></caption>
	  <table class="table">
	    <tr>
	      <th>성명</th>
	      <td><input type="text" name="name" value="테스터" class="form-control" autofocus /></td>
	    </tr>
	    <tr>
	      <th>성별</th>
	      <td>
	        <input type="radio" name="gender" value="남"/>남 &nbsp;&nbsp;
		      <input type="radio" name="gender" value="여" checked>여
		    </td>
		  </tr>
	    <tr>
	      <th>사용가능컴퓨터언어</th>
	      <td>
	        <input type="checkbox" name="language" id="language1" value="JAVA" checked/>JAVA &nbsp;
	        <input type="checkbox" name="language" value="Database"  checked />Database &nbsp;
	        <input type="checkbox" name="language" value="HTML5"  checked />HTML5 &nbsp;
	        <input type="checkbox" name="language" value="CSS3"/>CSS3 &nbsp;
	        <input type="checkbox" name="language" value="Javascript"  checked />Javascript &nbsp;
	        <input type="checkbox" name="language" value="jQuery"  checked />jQuery &nbsp;
	        <input type="checkbox" name="language" value="JSP"  checked />JSP &nbsp;
	        <input type="checkbox" name="language" value="aJax"/>aJax &nbsp;
	        <input type="checkbox" name="language" value="SpringFramework"/>SpringFramework &nbsp;
		    </td>
		  </tr>
		  <tr>
		    <th>학생번호</th>
		    <td><input type="number" name="no" value="220231" class="form-control"/></td>
		  </tr>
		  <tr>
		    <th>학년</th>
		    <td>
		      <div class="row">
		        <div class="col">
			      <select name="hakyun" class="form-control" onchange="changeHakyun()">
					<option value="">학년을 선택하세요</option> 		
					<option value="1">1학년</option> 		
					<option value="2">2학년</option> 		
					<option value="3">3학년</option> 		
					<option value="4" selected>4학년</option> 		
				  </select> &nbsp;&nbsp;
				</div>
				<div class="col">
				  기타 : <input type="number" name="hakyunOption" min="5" max="6" onclick="changeHakyunOption()"/>
				</div>
			  </div>
			</td>
		</tr>
		<tr>
		  <th>국어</th>
		  <td><input type="number" name="kor" value="98" min="0" max="100" class="form-control"/></td>
		</tr>
		<tr>
		  <th>영어</th>
		  <td><input type="number" name="eng" value="89" min="0" max="100" class="form-control"/></td>
		</tr>
		<tr>
		  <th>수학</th>
		  <td><input type="number" name="mat" value="78" min="0" max="100" class="form-control"/></td>
		</tr>
		<tr>
		  <th>좋아하는스포츠</th>
		  <td>
		    <select name="sports" size="5" multiple  onchange="changeSports()">
		      <option value="축구">축구</option>
		      <option value="야구">야구</option>
		      <option value="농구">농구</option>
		      <option value="탁구">탁구</option>
		      <option value="배구">배구</option>
		      <option value="수영" selected>수영</option>
		      <option value="마라톤">마라톤</option>
		      <option value="멀리뛰기">멀리뛰기</option>
		      <option value="등산">등산</option>
		      <option value="볼링" selected>볼링</option>
		      <option value="태권도">태권도</option>
		      <option value="기타">기타</option>
		    </select> &nbsp;&nbsp;
		    기타 <input type="text" name="otherSports" onclick="changeOtherSport()"/>
		  </td>
		</tr>
		<tr>
		  <td colspan="2" align="center">
		  	<input type="button" value="전송" onclick="fCheck()" class="btn btn-success m-2"/>
		    <input type="reset" value="취소" class="btn btn-success m-2"/>
		  </td>
		</tr>
	  </table>
	</form>
</div>
<p><br/></p>
</body>
</html>