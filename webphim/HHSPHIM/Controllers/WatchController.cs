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
            ViewBag.tapso = d.gettap(id, tap);
            int tim = d.countfavo(id);
            ViewBag.count = tim;
            List<Comment> list = d.loadcomment(id);
            Session["ListComment"] = list;
            int com = d.countComment(id);
            ViewBag.countComment = com;
            d.UpdateView(id);
            return View(model1);
        }
        public ActionResult Ajax()
        {
            DBIO d = new DBIO();
            string idp = (string)System.Web.HttpContext.Current.Session["MaPhim"];
            string idac = ((Account)System.Web.HttpContext.Current.Session["login1"]).IDAC;
            string username = ((Account)System.Web.HttpContext.Current.Session["login1"]).Username;
            string txt = Request["txtcomment"];
            d.addcomment(idp, idac, txt,username);
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
    }
}