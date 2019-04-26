<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	var bno = 1;
	
	function getAllList(){
		$.getJSON("replies/all/" + bno, function(data){
			
			var str = "";
			console.log(data.length);
			
			$(data).each(function(){
				str += "<li data-rno='" + this.rno + "' class='replyLi'>"
					+ this.rno + ":" + this.replytext
					+ "<button>MOD</button></li>";
			});
			
			$("#replies").html(str);
			
		});
	}//getAllList()

	function getPageList(page){
		
		$.getJSON("/replies/"+bno+"/"+page, function(data){
			
			console.log(data.list.length);
			var str = "";
			
			$(data.list).each(function(){
				str += "<li data-rno='" + this.rno + "' class='replyLi'>"
					+ this.rno + ":" + this.replytext
					+ "<button>MOD</button></li>";
			});
			
			$("#replies").html(str);
			
			printPaging(data.pageMaker);
			
		});
	}//getPageList()
	
	function printPaging(pageMaker){
		var str = "";
		
		if(pageMaker.prev)
			str += "<a href='"+(pageMaker.startPage-1)+"'>pre</a>";
			
		for(var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++){
			if(pageMaker.cri.page == i)
				str += "<b>"
			str += "<a href='"+i+"'>"+"&nbsp "+i+"</a>";
			if(pageMaker.cri.page == i)
				str += "</b>"
		}
			
		if(pageMaker.next)
			str += "<a href='"+(pageMaker.endPage+1)+"'>&nbsp next</a>";
		$(".pagination").html(str);
	}
	
	
	$(document).ready(function(){
		
		getPageList(1);
		
		$("#replyAddBtn").on("click", function(){
			var replyer = $("#newReplyWriter").val();
			var replytext = $("#newReplyText").val();
			
			
			$.ajax({
				type : "post",
				url : "/replies",
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : "text",
				data : JSON.stringify({
					bno : bno,
					replyer : replyer,
					replytext : replytext
				}),
				success : function(result){
					if(result=="SUCCESS")
						alert("RRRREEEEGGIISSTERR");
					getAllList();
				}
			}); //$.ajax
			
		});//$("#replyAddBtn")
		
		$("#replies").on("click", ".replyLi button", function(){

			var reply = $(this).parent();
			var rno = reply.attr("data-rno");
			var replytext = reply.text();
			
			$(".modal-title").html(rno);
			$("#replytext").val(replytext);
			$("#modDiv").show("slow");
			
		});//$("#replies")
		
		$("#replyDelBtn").on("click", function(){
			
			var rno = $(".modal-title").html();
			var replytext = $("#replytext").val();
			
			$.ajax({
				type: "delete",
				url: "/replies/"+rno,
				header: {
					"Content-Type": "application/json",
					"X-HTTP-Method-Override": "DELETE"
				},
				dataType: "text",
				success: function(result){
					console.log("result: " + result);
					if(result == "SUCCESS"){
						alert("deleted");
						$("#modDiv").hide("slow");
						getAllList();
					}
				}
			});//$.ajax
		});//$("#replyDelBtn")
		
		$("#replyModBtn").on("click", function(){
			var rno = $(".modal-title").html();
			var replytext = $("#replytext").val();
			
			$.ajax({
				type: 'put',
				url: '/replies/'+rno,
				headers:{
					"Content-Type": "application/json",
					"X-HTTP-Method-Override": "PUT"
				},
				data: JSON.stringify({replytext:replytext}),
				dataType: 'text',
				success: function(result){
					console.log("result: "+result);
					if(result == 'SUCCESS'){
						alert("modified");
						$("#modDiv").hide("slow");
						getAllList();
					}
				}
			});//$.ajax
		});//$("replyModBtn")
		
		$("#closeBtn").on("click", function(){
			$("#modDiv").hide("slow");
		});//closeBtn
		
		
		$(".pagination").on("click", "a", function(event){
			event.preventDefault();
			var replyPage = 1;
			replyPage = $(this).attr("href");
			getPageList(replyPage);
		});
		
	});
	
</script>
<style>
	
	#modDiv{
		width: 300px;
		height: 100px;
		background-color: gray;
		position: absolute;
		top: 50%;
		left: 50%;
		margin-top: -50px;
		margin-left: -150px;
		padding: 10px;
		z-index: 1000;
	}
	
</style>
</head>

<body>
	
	<h2>Ajax Test Page</h2>
	
	<ul id="replies">
	</ul>
	
	<div class="pagination">
	
	</div>
	
		
	<div>
		<div>
			REPLYER <input type="text" name="replyer" id="newReplyWriter">	
		</div>
		<div>
			REPLY TEXT <input type="text" name="replytext" id="newReplyText">
		</div>
		<button id="replyAddBtn">ADD REPLY</button>
	</div>
	
	<div id="modDiv" style="display: none;">
		<div class="modal-title"></div>
		<div>
			<input type="text" id="replytext">
		</div>
		<div>
			<button type="button" id="replyModBtn">Modify</button>
			<button type="button" id="replyDelBtn">Delete</button>
			<button type="button" id="closeBtn">Close</button>
		</div>
	</div>

	
</body>
</html>