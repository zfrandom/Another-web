using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
         {
             //读取保存的Cookie信息
             HttpCookie cookies = Request.Cookies["USER_COOKIE"];
             if (cookies != null)
            {
                 //如果Cookie不为空，则将Cookie里面的用户名和密码读取出来赋值给前台的文本框。
                 this.userName_input.Value = cookies["UserName"];
                 getDept_click(sender, e);
                 this.dept_ddl.SelectedIndex = int.Parse(cookies["indx"]);
                 this.pwd_input.Attributes.Add("Value", cookies["UserPassword"]);
                //这里依然把记住密码的选项给选中。
                 this.rmb_pwd.Checked = true;
             }
         }
           
        }
        protected void sub_click(object sender, EventArgs e)
        {
            
            string user = userName_input.Value;
            
            string pwd = pwd_input.Value;
            Hospital.Service1SoapClient ss = new Hospital.Service1SoapClient();
            string s = ss.GetSQLConnect();
            Hospital.Staff2Entity res = ss.UserLogin(user, pwd, int.Parse(dept_ddl.SelectedValue));
            if (res.Id!=0)
            {
                HttpCookie cookie = new HttpCookie("USER_COOKIE");
                if (rmb_pwd.Checked)
                {
                    cookie.Values.Add("UserName", this.userName_input.Value.Trim());
                    cookie.Values.Add("UserPassword", this.pwd_input.Value.Trim());
                    cookie.Values.Add("indx", this.dept_ddl.SelectedIndex.ToString());
                    //这里是设置Cookie的过期时间，这里设置一个星期的时间，过了一个星期之后状态保持自动清空。
                    cookie.Expires = System.DateTime.Now.AddDays(7.0);
                    HttpContext.Current.Response.Cookies.Add(cookie);

                }
                else
                {
                    if (cookie != null)
                    {
                        Response.Cookies["USER_COOKIE"].Expires = DateTime.Now;
                    }
                }
                _Default a = new _Default();
                string url = "http://192.168.1.139:31/Default.aspx?user=";
                Session["dept"] = dept_ddl.SelectedItem.Text;
                url += userName_input.Value;
                url += "index=" + dept_ddl.SelectedIndex;
                Response.Redirect(url);
                
            }
            else
            {
                wrong.Visible = true;
            }

        }
        protected void getDept_click(object sender, EventArgs e)
        {
            Hospital.Service1SoapClient ss = new Hospital.Service1SoapClient();
            string s = ss.GetSQLConnect();
            Hospital.DeptEntity[] de = ss.GetUserDept(userName_input.Value);
            if (de.Length == 0)
            {
                wrong.Visible = true;
                dept_ddl.Items.Clear();
            }
            foreach (Hospital.DeptEntity d in de)
            {
                ListItem li = new ListItem(d.Name, d.Id.ToString());
                dept_ddl.Items.Add(li);
                wrong.Visible = false;
            }

        }
        protected void userName_input_onclick(object sender, EventArgs e)
        {
            Hospital.Service1SoapClient ss = new Hospital.Service1SoapClient();
            string s = ss.GetSQLConnect();
            Hospital.DeptEntity[] de = ss.GetUserDept(userName_input.Value);
            if (de.Length == 0)
            {
                wrong.Visible = true;
                dept_ddl.Items.Clear();
            }
            foreach (Hospital.DeptEntity d in de)
            {
                ListItem li = new ListItem(d.Name, d.Id.ToString());
                dept_ddl.Items.Add(li);
                wrong.Visible = false;
            }

        }

 
    }
}
