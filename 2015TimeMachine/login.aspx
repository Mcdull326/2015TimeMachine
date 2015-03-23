<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="_2015TimeMachine.login" %>

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
    <title>用户登录 - 九时一刻 | 西南财经大学第八届影像大赛</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/common.css">
</head>
<body>
    <div class="container">
        <!--Main-->
        <div class="row">
            <div id="reg-main">
                <h3>用户登录</h3>
                <div class="center">
                    <form class="form-horizontal" runat="server">
                        <div class="form-group">
                            <label class="col-md-4 control-label">昵称/邮箱</label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" id="uInfo" runat="server" maxlength="50" required />
                                <p class="help-block"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label">密码</label>
                            <div class="col-md-8">
                                <input type="password" class="form-control" name="pwd" id="uPwd" runat="server" maxlength="50" required />
                                <p class="help-block"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-4 col-sm-6 col-xs-6 col-md-offset-4">
                                <div class="checkbox" style="margin-left:20px">
                                    <input type="checkbox" id="savePwd" runat="server" />
                                    记住密码
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-6 col-xs-6 control-label">
                                <a href="checkNum.aspx" title="忘记密码">忘记密码</a>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <button type="submit" class="btn btn-warning btn-lg btn-block" onserverclick="Log" runat="server">登录</button>
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
</body>
</html>