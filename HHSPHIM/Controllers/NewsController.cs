using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HHSPHIM.Controllers
{
    public class NewsController : Controller
    {
        // GET: News
        public ActionResult NewPage()
        {
            Session["Previos"] = "/News/NewPage";
            return View();
        }
        [HttpPost]
        public ActionResult LogoutSystem()
        {
            if (System.Web.HttpContext.Current.Session["login1"] != null)
            {
                Session.Abandon();
            }
            return Redirect("/Home/Index");
        }
    }
}