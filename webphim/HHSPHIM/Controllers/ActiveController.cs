using DatabaseIO;
using DatabaseProvide;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HHSPHIM.Controllers
{
    public class ActiveController : Controller
    {
        // GET: Active
        public ActionResult activeAccount()
        {
            string code = Request["code"];
            string user= Request["user"];
            DBIO d = new DBIO();
            Account a = d.checkaccount(user);
            if (code == null)
            {
                ViewBag.mess2 = "Điền đúng code với username nhé";
            }
            else
            {
                ViewBag.user = user;
                try
                {
                    if (a==null)
                    {
                        ViewBag.mess2 = "Tài khoản không tồn tại";
                    }
                    else
                    {
                        if(a.code.Equals(code)==false)
                        {
                            ViewBag.mess2 = "code nhập bị sai nhập lại !!";
                        }
                        else
                        {
                            d.activeAccount(code);
                            ViewBag.mess2 = "Tài khoản đã được active";
                        }
                    }
                }
                catch(Exception e)
                {
                    ViewBag.mess2 = e.Message;
                }
            }
            return View();
        }
    }
}