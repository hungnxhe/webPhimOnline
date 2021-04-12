using DatabaseIO;
using DatabaseProvide;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HHSPHIM.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        public ActionResult ChangePass()
        {
            return View();
        }
        [HttpPost]
        public ActionResult change()
        {
            string username = Request["a"];
            string pass= Request["b"];
            string newpass= Request["c"];
            string repass= Request["d"];
            string oldpass = ((Account)System.Web.HttpContext.Current.Session["login1"]).Pass;
            if (pass.Equals(oldpass) == false)
            {
                Session["Err"] = "Pass nhập bị sai (không giống pass cũ)";
                return Redirect("/User/ChangePass");
            }
            else if (newpass.Equals(repass)==false)
            {
                Session["Err"] = "kiểm tra lại new pass và repass phải giống nhau";
                return Redirect("/User/ChangePass");
            }
            else
            {
                Session["Err"] = "ok rồi đấy";
                DBIO d = new DBIO();
                d.Changepass(username, newpass);
                Session.Abandon();
                return Redirect("/Home/Index");
            }

            
        }
    }
}