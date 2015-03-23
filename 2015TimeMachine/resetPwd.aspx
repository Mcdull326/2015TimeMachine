<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="resetPwd.aspx.cs" Inherits="_2015TimeMachine.resetPwd" %>

<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="js/respond.min.js"></script>
    <![endif]-->
    <title>用户重置密码 - 九时一刻 | 西南财经大学第八届影像大赛</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/common.css">
</head>
<body>
    <div class="container">
        <!--Main-->
        <div class="row">
            <div id="reg-main" style="margin-top:30px">
                <h3>用户重置密码</h3>
                <h4 id="uName"></h4>
                <h4 id="uMail" style="margin-bottom:40px"></h4>
                <div class="center">
                    <form class="form-horizontal" runat="server">
                        <div class="form-group">
                            <label class="col-sm-4 control-label">新密码</label>
                            <div class="col-sm-8">
                                <input type="password" class="form-control" id="pwd" runat="server" required />
                                <p class="help-block"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">确认密码</label>
                            <div class="col-sm-8">
                                <input type="password" class="form-control" id="pwd1" runat="server" required />
                                <p class="help-block"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <button type="submit" class="btn btn-warning btn-lg btn-block" onserverclick="rePwd" runat="server">确定</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jqBootstrapValidation.js"></script>
    <script>
        if (document.cookie.length > 0) {
            var uname = document.cookie.split("+")[0].substring(8);
            var umail = document.cookie.split("+")[1];
            document.getElementById('uName').innerText = "您的昵称：" + uname;
            document.getElementById('uMail').innerHTML = "您的邮箱：" + umail;
        }
    </script>
</body>
</html>