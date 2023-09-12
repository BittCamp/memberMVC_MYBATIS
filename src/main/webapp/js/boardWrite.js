$(function(){
	$('#boardWriteBtn').click(function(){
		$('#subjectDiv').empty();
		$('#contentDiv').empty();
		
		if($('#subject').val() == ''){
			$('#subjectDiv').text('제목 입력');
			$('#subject').focus();
			
		}else if($('#content').val() == ''){
			$('#contentDiv').text('내용 입력');
			$('#content').focus();
			
		}else{
			//$('#boardWriteForm').submit();
			
			$.ajax({
				type: 'post',
				url: 'boardWrite.jsp',
				data: {
					'subject': $('#subject').val(),
					'content': $('#content').val()
				},
				success: function(){
					alert("작성하신 글을 저장하였습니다.");
					location.href='boardList.jsp?pg=1';
				},
				error: function(e){
					console.log(e);
				}
			});
		}
	});
});












