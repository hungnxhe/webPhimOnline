using DatabaseIO;
using DatabaseProvide;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HHSPHIM.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Login()
        {
            return View();
        }
        public bool login1(string username, string pass)
        {
            DBIO d = new DBIO();
            Account a = d.getDatahaveUserName(username);
            if (a == null)
            {
                Session["Error"] = "Sai Tên Tài Khoản";
                return false;
            }
            else
            {
                Account b = d.getData(username, pass);
                if (b == null)
                {
                    Session["Error"] = "Sai mật khẩu";
                    return false;
                }
                else if (b.status.Equals("off"))
                {
                    Session["Error"] = "Tài Khoản đã bị Khóa";
                    return false;
                }
                else if (b.active.Equals("unactive"))
                {
                    Session["Error"] = "Tài Khoản chưa được active vui lòng kiểm tra trong email đăng ký";
                    return false;
                }
                else
                {
                    Session["Login1"] = b;
                    Session["chucvu"] = b.ChucVu;
                    return true;
                }
                
            }
        }
        [HttpPost]
        public ActionResult LoginSystem()
        {
            DBIO d = new DBIO();
            Account a = new Account();
            string user = Request["username"];
            string pass = Request["pass"];
            if (login1(user, pass) == true)
            {
                string previos = (string)System.Web.HttpContext.Current.Session["Previos"];
                return Redirect(previos);
            }
            else
            {
                return Redirect("/Login/Login");
            }
        }
    }
}