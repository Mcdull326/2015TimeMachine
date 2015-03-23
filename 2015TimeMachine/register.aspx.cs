using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using Common;
using Entity;
using BADL;

namespace _2015TimeMachine
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        [WebMethod]
        public static string uNumPost(string uNum)
        {
            string UNum = RegularExpressions.MyEncodeInputString(uNum.Trim());

            if (!BADL_User.IsStunumExsit(UNum))
            {
                return "0";
            }
            else
            {
                return "1";//学号存在
            }
        }

        [WebMethod]
        public static string uNumPwdPost(string uNum, string uNumPwd)
        {
            string UNum = RegularExpressions.MyEncodeInputString(uNum.Trim());
            string UNumPwd = RegularExpressions.MyEncodeInputString(uNumPwd.Trim());

            if (CheckNum.CheckUserNum(UNum, uNumPwd))
            {
                return "2";
            }
            else
            {
                return "3";//学号验证失败
            }
        }

        [WebMethod]
        public static string uNamePost(string uName)
        {
            string UName = RegularExpressions.MyEncodeInputString(uName.Trim());
            if (!BADL_User.IsNameExsit(UName))
            {
                return "4";
            }
            else
                return "5";//昵称存在
        }

        [WebMethod]
        public static string uMailPost(string uMail)
        {
            string UMail = RegularExpressions.MyEncodeInputString(uMail.Trim());
            if (!BADL_User.IsMailExsit(UMail))
            {
                return "6";
            }
            else
                return "7";//邮箱存在
        }

        [WebMethod]
        public static string uCheckPost(string uCheck)
        {
            string ucheck = RegularExpressions.MyEncodeInputString(uCheck.Trim());
            if (HttpContext.Current.Session["check"] != null)
            {
                string check = HttpContext.Current.Session["check"].ToString();
                if (check.ToUpper().Equals(ucheck.ToUpper()))
                {
                    return "8";
                }
                else
                {
                    return "9";//验证码输入错误
                }
            }
            else return "10";//验证码生成错误
        }

        protected void uRegister(object sender, EventArgs e)
        {
            string unum = RegularExpressions.MyEncodeInputString(uNum.Value.Trim());
            string unumpwd = RegularExpressions.MyEncodeInputString(uNumPwd.Value.Trim());
            string uname = RegularExpressions.MyEncodeInputString(uName.Value.Trim());
            string upwd = RegularExpressions.MyEncodeInputString(pwd.Value.Trim());
            string upwd1 = RegularExpressions.MyEncodeInputString(pwd1.Value.Trim());
            string umail = RegularExpressions.MyEncodeInputString(uMail.Value.Trim());
            string ucheck = RegularExpressions.MyEncodeInputString(uCheck.Value.Trim());
            string check = HttpContext.Current.Session["check"].ToString();

            if (HttpContext.Current.Session["check"] == null)//判断验证码
            {
                Response.Write("<script>alert('验证码生成错误')</script>");
            }
            else if (!CheckNum.CheckUserNum(unum, unumpwd))
            {
                Response.Write("<script>alert('学号或上网密码错误')</script>");
            }
            else if (!upwd.Equals(upwd1))
            {
                Response.Write("<script>alert('密码不一致')</script>");
            }
            else if (!check.ToUpper().Equals(ucheck.ToUpper()))
            {
                Response.Write("<script>alert('验证码输入错误')</script>");
            }
            else
            {
                En_User eu = new En_User();
                eu.UNum = unum;
                eu.UName = uname;
                eu.UPwd = Md5.MD5_encrypt(upwd1);
                eu.UMail = umail;
                eu.RegisterTime = DateTime.Now;
                eu.LastLogin = DateTime.Now;
                eu.State = 0;

                int blank = BADL_User.IsBlankReg(eu);//判断字段长度
                if (blank != 5)
                {
                    Response.Write("<script>alert('字段长度不符')</script>");
                }
                else if (BADL_User.IsStunumExsit(unum))
                {
                    Response.Write("<script>alert('学号存在')</script>");
                }
                else if (BADL_User.IsNameExsit(uname))
                {
                    Response.Write("<script>alert('昵称存在')</script>");
                }
                else if (BADL_User.InsertUser(eu))
                {
                    Response.Redirect("login.aspx");//注册成功,跳转到登录界面
                }
                else
                {
                    Response.Write("<script>alert('注册异常')</script>");
                }
            }
        }
    }
}