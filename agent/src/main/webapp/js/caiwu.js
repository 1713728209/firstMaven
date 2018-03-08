$(document).ready(function(){
    userid = -1;
    $("#searchUerText").keyup(function(){
        loadUsers();
    });
    $("#searchUerText").click(function(){
        loadUsers();
    });

    $("#caiwuok").click(function(){
        if(userid <= 0){
            alert("对不起，您还没有选择用户，请搜索进行用户的选择。");
            $("#searchUerText").focus();
        }else if($("#zijintype").val() == '0'){
            alert("对不起，您还没有选择操作类型，请选择操作类型。");
            $("#zijintype").focus();
        }else if($("#zijin").val() == '' || $("#zijin").val().length <=0){
            alert("对不起，您还没有输入需要操作的自己数目，请输入。");
            $("#zijin").focus();
        }else{
            if(confirm("您确定要执行当前财务操作吗？")){
                $.post('opeaccount',
                    {
                        'userid':userid,
                        'userCode':$("#searchUerText").val(),
                        'money':$("#zijin").val(),
                        'systemconfigid':$("#zijintype").val(),
                        'memo':$("#memo").val()
                    },function(result){
                        if(result == 'success'){
                            alert("恭喜您，财务操作成功。");
                            $("#systemtip").html("恭喜您，财务操作成功。");
                            $("#zijintype").val(null);
                            $("#zijin").val(null);
                            $("#searchUerText").val(null);
                            $("#memo").val(null);
                        }else{
                            alert("对不起，当前财务操作失败。");
                            $("#systemtip").html("对不起，当前财务操作失败。");
                        }
                    },'html');
            }
        }

    });
    mover(4);
});
function confirmUser(uid,ucode){
    userid = uid;
    $("#searchUerText").val(ucode);
    $("#serachresult").html("");
}

function loadUsers(){
    $.post("/searchuser",{},function(result){
        var userList = "<ul>";
        for(var i=0;i< result.length;i++){
            userList = userList + "<li onclick=\"confirmUser("+result[i].id+",'"+result[i].usercode+"');\"><a>"+result[i].usercode+"</a></li>";
        }
        userlist = userList +"</ul>";
        $("#serachresult").html(userList);
    },'json');
}