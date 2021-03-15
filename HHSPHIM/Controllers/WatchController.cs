using DatabaseIO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DatabaseProvide;

namespace HHSPHIM.Controllers
{
    public class WatchController : Controller
    {
        // GET: Watch
        public ActionResult WatchPage()
        {
            Session["Previos"] = "/Watch/WatchPage?id="+ System.Web.HttpContext.Current.Session["MaPhim"] + "&tap=1";
            DBIO d = new DBIO();
            string id = Request["id"];
            List<cacTap> model1 = d.getvideo(id);
            string tap = Request["tap"];

            if(Session["tapso"] == null)
            {
                Session["tapso"] = d.gettap(id, "1");
            }
            else
            {
                Session["tapso"] = d.gettap(id, tap);
            }
            int tim = d.countfavo(id);
            ViewBag.count = tim;
            List<Comment> list = d.loadcomment(id);
            Session["ListComment"] = list;
            int com = d.countComment(id);
            ViewBag.countComment = com;
            return View(model1);
        }
        [HttpPost]
        public ActionResult Addcomment()
        {
            DBIO d = new DBIO();
            string idp = (string)System.Web.HttpContext.Current.Session["MaPhim"];
            string idac = ((Account)System.Web.HttpContext.Current.Session["login1"]).IDAC;
            string txt = Request["txtcomment"];
            d.addcomment(idp, idac, txt);
            string back = Session["Previos"].ToString();
            return Redirect(back);
        }
        public ActionResult Ajax()
        {
            DBIO d = new DBIO();
            string idp = (string)System.Web.HttpContext.Current.Session["MaPhim"];
            string idac = ((Account)System.Web.HttpContext.Current.Session["login1"]).IDAC;
            string txt = Request["txtcomment"];
            d.addcomment(idp, idac, txt);
            List<Comment> list = d.loadcomment(idp);
            Comment a = new Comment();
            List<Comment> list1 = new List<Comment>();
            foreach(var item in list)
            {
                a = item;
            }
            list1.Add(a);
            return PartialView("Ajax",list1);
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