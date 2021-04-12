using DatabaseIO;
using DatabaseProvide;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HHSPHIM.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            Session["Previos"] = "/Home/Index";
            DBIO d = new DBIO();
            List<Phim> model = d.getAllFilm();
            PagedList<Phim> ph = null;
            int index;
            if (Request["index"] == null){
                index = 1;
            }
            else
            {
                index = int.Parse(Request["index"]);
            }
            int total= model.Count;
            int page = total / 18;
            if (total % 18 != 0)
            {
                page++;
            }
            ViewBag.total = page;
            ViewBag.index = index;
            ph = (PagedList<Phim>)model.ToPagedList(index,18);
            List<Phim> topview = d.ListTopView();
            Session["topView"] = topview;
            return View(ph);
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