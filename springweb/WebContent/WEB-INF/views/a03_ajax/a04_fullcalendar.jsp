<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="UTF-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css">
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css">
<link href='${path}/a00_com/lib/main.css' rel='stylesheet' />
<link href='https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.css' rel='stylesheet' />
<link href='https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.1/css/all.css' rel='stylesheet'>
<style>
	body {
		margin: 40px 10px;
		padding: 0;
		font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
		font-size: 14px;
	}
	
	#calendar {
		max-width: 1100px;
		margin: 0 auto;
	}
	
	input[type=text], select, label, textarea{
		margin-bottom:12px; 
		padding:.4em;
		width:95%;
	}
	.input-group-text{
		width:100%;
		text-align:center;
		background-color:linen;
		color:black;
		font-weight:bolder;
	}
	.input-group-prepend{
		width:35%;
	}
</style>
<script src='${path}/a00_com/lib/main.js'></script>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script type="text/javascript">	
// 전역변수로 날짜 데이터를 가져오기 위한 선언
var date = {};
	// document.addEventListener("DOMContentLoaded")
	// 전체 DOM에 로딩되었을 때, JQuery $(document).ready(); 와 동일
	document.addEventListener('DOMContentLoaded', function() {
		var opts={
				autoOpen:false, // 초기에 로딩하지 않게 처리
				width:"350px",
				modal:true
		}
		$("#schDialog").dialog(opts); // dialogue를 사용할 준비
		
		var calendarEl = document.getElementById('calendar');
		// new FullCalendar.Calendar(대상 DOM객체, {속성:속성값, 속성2:속성값2...}
//		alert(new Date().toISOString());
		var calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar : {
				left : 'prevYear prev today next nextYear',
				center : 'title',
				right : 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
			},
			themeSystem: 'bootstrap',
			initialDate : new Date().toISOString(), // 초기 로딩 날짜(현재 날짜)
			navLinks : true, // can click day/week names to navigate views
			selectable : true,
			selectMirror : true,
			// 이벤트명:function(){}: 각 날짜에 대한 이벤트를 통해 처리할 내용
			// 등록처리할 때, 등록 버튼이 추가된 dialogue 설정 및 open
			select : function(arg) {
				// 등록 시, 기존 내용 로딩 방지 및 초기화
				$("#schDialog>form")[0].reset();
				// 화면에 보이는 형식 설정
				// 클릭한 날짜를 전역변수에 할당 / 시작일과 마지막날을 date형식으로 할당
				date.start = arg.start;
				date.end = arg.end;
				opts.buttons={
					"등록":function(){
						var sch = callSch(); // 리턴값이 입력된 객체데이터
						/* 데이터 확인 */
						console.log("### 등록할 데이터 ###");
						console.log(sch);
						
						/* 화면에 출력 */
						if(sch.title){
							// 화면에 처리할 이벤트 할당 
							calendar.addEvent(sch);
							calendar.unselect();
						}
						// ajax 처리(DB등록)
						$.ajax({
							type:"post",
							url:"${path}/calendar.do?method=insert",
							dataType:"json",
							data:sch, // 요청값을 json객체로 전달 가능
							success:function(data){
								// data.모델명
								if(data.success=="Y"){
									alert("등록 성공");
								}
							},
							error:function(err){
								console.log(err);
							}
						});
						$("#schDialog").dialog("close"); // dialogue 창닫기
					}
				};
				
				// console.log("# 매개변수 arg의 속성 #");
				// console.log(arg); // console을 통해 해당 속성 확인
				// alert("시작일: "+arg.start.toISOString());
				// $("#btn01").click();
				
				// 화면에 보이는 날짜를 한국 표현식으로 처리
				$("[name=start]").val(arg.start.toLocaleString());
				$("[name=end]").val(arg.end.toLocaleString());
				// allDay는 boolean값이므로 select의 형식에 맞게 처리하려면 ""+형식으로 문자열 처리가 필요
				$("[name=allDay]").val(""+arg.allDay);
				$("#schDialog").dialog(opts);
				$("#schDialog").dialog("open");
			},
			eventDrop:function(arg){
				//alert("드랍 이벤트");
				//console.log("## 드랍 이벤트 ##");
				//console.log(arg.event);
				eventUpt(arg.event);
			},
			eventResize:function(arg){
				//alert("날짜크기조절 이벤트");
				//console.log("## 날짜크기조절 이벤트 ##");
				//console.log(arg.event);
				eventUpt(arg.event);
			},
			eventClick : function(arg) {
				/* event의 날짜 저장 */
				date.start = arg.event.start;
				date.end = arg.event.end;
				// 있는 일정을 클릭 시, 상세 화면 보이기(등록되어 있는 데이터 출력)
				// ajax를 통해서 데이터 수정/삭제
				console.log("# 등록된 일정 클릭 #");
				console.log(arg.event);
				// arg.event: 해당 상세 정보를 가지고 있다.
				
				/* 각 form에 값 추가 */
				// 1. 화면 로딩
				// 2번 이상 중복된 함수 사용이 필요한 부분은 모듈로 분리 처리
				detail(arg.event);				
				// 2. 각 기능 별 버튼에 대한 처리
				opts.buttons={
					"수정":function(){
						/* 수정 후 json데이터 가져오기 */
						// 화면에 form 하위에 있는 요소객체의 값을 가져오는 부분
						var sch = callSch();
						console.log("# 수정할 값 #");
						console.log(sch);
						
						/* 1. 화면단 변경 */
						/* 현재 캘린더 api 속성 변경 */
						var event = calendar.getEventById(sch.id);
						/* 속성값 변경 setProp */
						event.setProp("title", sch.title);			
						event.setProp("textColor", sch.textColor);			
						event.setProp("backgroundColor", sch.backgroundColor);			
						event.setProp("borderColor", sch.borderColor);		
						/* 확장 속성: writer, content */
						event.setExtendedProp("writer", sch.writer);
						event.setExtendedProp("content", sch.content);
						event.setAllDay(sch.allDay);
						
						/* 2. DB 변경 */
						updateCall(sch);
						
						$("#schDialog").dialog("close");
					},
					"삭제":function(){
						var idVal = $("[name=id]").val();
						// 화면에서 삭제
						var event = calendar.getEventById(idVal);
						event.remove();
						// DB에서 삭제
						$.ajax({
							type:"post",
							uri:"calendar.do?method=delete",
							data:{id:idVal},
							dataType:"json",
							success:function(data){
								if(data.success=="Y"){
									alert("삭제 성공");
								}
							},
							error:function(err){
								alert("에러 발생");
								console.log(err);
							}
						});
						$("#schDialog").dialog("close");
					}
				}
				$("#schDialog").dialog(opts);
				$("#schDialog").dialog("open"); // dialogue 로딩				
/* 				if (confirm('일정을 삭제하시겠습니까?')) {
					arg.event.remove()
				} */
			},
			editable : true,
			dayMaxEvents : true, // allow "more" link when too many events
			events :function(info, successCallback, failureCallback){
				// ajax처리로 데이터 로딩
				// 화면에 나타날 일정들을 ajax를 통해 호출하고,
				// success함수를 통해서 서버에서 받은 데이터를 가져오고,
				// successCallback이라는 매개변수를 받은 함수에 일정내용을 전달하면 전체 화면에서 일정이 반영된다.
				$.ajax({
					type:"get",
					url:"${path}/calendar.do?method=data",
					dataType:"json",
					success:function(data){
						console.log(data.list);
						successCallback(data.list);
					},
					error:function(err){
						console.log(err);
					}
				});
			}
		});

		calendar.render();
	});

	// form 하위 요소 객체에서 사용할 데이터를 json형식으로 만들어준다.
	function callSch(){
		var sch={};
		sch.id = $("[name=id]").val();
		sch.title=$("[name=title]").val();
		sch.writer=$("[name=writer]").val();
		sch.content=$("[name=content]").val();
		/* Date타입은 화면에서 사용되는 형식으로 설정하여야한다.
		   전역변수에 할당한 data.start/date.end에 ISO형태로 속성 할당
		   calendar api에서 사용되는 날짜처리방식이 ISO문자열 형식이기 때문
		   
		   ex) Date ==> toISOString() 형식 */
		sch.start=date.start.toISOString();
		sch.end=date.end.toISOString();
		// sch.allDay: calendar화면에 처리할 데이터를 boolean형식으로 true/false로 처리해야 하는데, 화면에 보이는 내용은 문자열로 돼있다.
		// option value="true"이 선택됐을 때는 비교연산자(==)를 통해 true로 boolean값을 넘기고, 그 외에는 false값을 넘긴다.
		sch.allDay = $("[name=allDay]").val()=="true"; // 문자열이 "true"일 때, 그 외는 false
		sch.backgroundColor=$("[name=backgroundColor]").val();
		sch.textColor=$("[name=textColor]").val();
		sch.borderColor=$("[name=borderColor]").val();
		
		return sch;
	}
	
	function detail(event){
		// event 안에 기본 속성 값을 초기에 데이터 로딩 시 가지고 있음
		/* form 하위 객체에 할당 */
		$("[name=id]").val(event.id);
		$("[name=title]").val(event.title);
		/* calendar에서 추가된 속성들 */
		var exProps = event.extendedProps;
		$("[name=writer]").val(exProps.writer);
		$("[name=content]").val(exProps.content);
		$("[name=start]").val(event.start.toLocaleString());
		$("[name=end]").val(event.end.toLocaleString());
		$("[name=allDay]").val(""+event.allDay);
		
		$("[name=backgroundColor]").val(event.backgroundColor);
		$("[name=textColor]").val(event.textColor);
		$("[name=borderColor]").val(event.borderColor);
	}
	
	// 수정 ajax
	function updateCall(sch){
		// callSch(): 입력한 수정데이터를 요청값으로 전달.
		$.ajax({
			type:"post",
			url:"calendar.do?method=update",
			data:sch,
			dataType:"json",
			success:function(data){
				if(data.success=="Y"){
					alert("수정완료");
				} else {
					console.log("실패");
				}
			},
			error:function(err){
				alert("에러발생: "+err);
				console.log(err);
			}
		});
	}
	
	function eventUpt(event){
		var sch = {};
		sch.id = event.id;
		sch.title = event.title;
		sch.start = event.start.toISOString();
		sch.end = event.end.toISOString();
		sch.content = event.extendedProps.content;
		sch.textColor = event.textColor;
		sch.backgroundColor = event.backgroundColor;
		sch.borderColor = event.borderColor;
		sch.allDay = event.allDay;		
		console.log("# 이벤트에 의한 수정 #");
		console.log(sch);
		updateCall(sch);
	}
</script>
</head>
<body>
	<div id='calendar'></div>
	
	<div id="schDialog" title="일정"> 
		<form id="frm">
			<input name="id" type="hidden" value="0"/>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">제목</span>
				</div>
				<input class="form-control" name="title" type="text"/>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">작성자</span>
				</div>
				<input class="form-control" name="writer" type="text"/>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">내용</span>
				</div>
				<textarea rows="5" class="form-control" cols="20" name="content"></textarea>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">종일여부</span>
				</div>
				<select name="allDay" class="form-control">
					<option value="true"> 종 일 </option>
					<option value="false"> 시 간 </option>
				</select>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">시작일</span>
				</div>
				<input class="form-control" name="start" type="text"/>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">종료일</span>
				</div>
				<input class="form-control" name="end" type="text"/>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">배경색상</span>
				</div>
				<input name="backgroundColor" class="form-control" type="color" value="#0099cc"/>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">보드색상</span>
				</div>
				<input name="borderColor" class="form-control" type="color" value="#0099ff"/>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">글자색상</span>
				</div>
				<input name="textColor" class="form-control" type="color" value="#ccffff"/>
			</div>
		</form>
	</div>
<%--
bootstrap 형식

  <button type="button"
     id="btn01" style="display:none;"  class="btn btn-primary" 
     data-toggle="modal" data-target="#myModal">
    Open modal(boot strap)
  </button>
  <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">일정</h4>
          <button type="button" class="close" 
             data-dismiss="modal">&times;</button>
        </div>
        <!-- Modal body -->
        <div class="modal-body">
         <form id="frm2">
            <input name="id" type="hidden" value="0"/>
            <div class="input-group">   
               <div class="input-group-prepend">
                  <span class="input-group-text">제목</span>
               </div>      
               <input class="form-control"  
                  name="title" type="text"/>
            </div>
            <div class="input-group">   
               <div class="input-group-prepend">
                  <span class="input-group-text">작성자</span>
               </div>      
               <input class="form-control"  name="writer" type="text"/>
            </div>         
            <div class="input-group">   
               <div class="input-group-prepend">
                  <span class="input-group-text">내용</span>
               </div>      
               <textarea rows="5"  class="form-control"  cols="20" name="content"></textarea>
            </div>      
            <div class="input-group">   
               <div class="input-group-prepend">
                  <span class="input-group-text">종일여부</span>
               </div>      
               <select name="allDay"  class="form-control" >
                  <option value="true"> 종 일 </option>
                  <option value="false"> 시 간 </option>
               </select>   
            </div>
            <div class="input-group">   
               <div class="input-group-prepend">
                  <span class="input-group-text">시작일</span>
               </div>      
               <input class="form-control"  name="start" type="text"/>
            </div>
            <div class="input-group">   
               <div class="input-group-prepend">
                  <span class="input-group-text">종료일</span>
               </div>      
               <input class="form-control"  name="end" type="text"/>
            </div>
            <div class="input-group">   
               <div class="input-group-prepend">
                  <span class="input-group-text">배경색상</span>
               </div>      
               <input name="color"  class="form-control"  type="color" value="#0099cc"/>
            </div>
            <div class="input-group">   
               <div class="input-group-prepend">
                  <span class="input-group-text">글자색상</span>
               </div>      
               <input name="textColor"  class="form-control"  type="color" value="#ccffff"/>
            </div>
         </form>
      
        </div>
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-info">등록</button>
        </div>
      </div>
    </div>
  </div>
--%>
</body>
</html>