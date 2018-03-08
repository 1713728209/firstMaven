function validateLoginUserFunc(){
	var flag = false;
	
	var usercode = $.trim($("#usercode").val());
	var userpassword = $.trim($("#userpassword").val());
	
	if(usercode == "" || usercode == null){
		 $("#usercode").focus();
		 alert("对不起，登录账号不能为空。");
	}else if(userpassword == "" || userpassword == null){
		 $("#userpassword").focus();
		 alert("对不起，登录密码不能为空。");
	}else{
		$.ajax({
			url: '/login',
			type: 'POST',
			data:{'userCode':usercode,'userPassword':userpassword},
			timeout: 5000,
			dataType:'html',
			error: function(){
				alert("服务器连接失败.....");
			},
			success: function(obj){
					if(obj=="success"){
						flag=true;
					}else{
						flag=false;
						alert("用户名或者密码错误!")
					}
				}
			});
	}
	return flag;
}

