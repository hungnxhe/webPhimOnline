using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication1.Models;
namespace WebApplication1.Controllers
{
    public class demoController : Controller
    {
        // GET: demo
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult startchat(string name)
        {
            Session["user"] = name;
            return View("chat");
        }
        public ActionResult chat(string msg)
        {
            Messeage ms = new Messeage() { Name=Session["user"] as string,
                                           content=msg};
            return PartialView("Messeage" ,ms);
        }

    }

}