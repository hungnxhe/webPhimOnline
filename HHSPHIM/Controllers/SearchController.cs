using DatabaseIO;
using DatabaseProvide;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HHSPHIM.Controllers
{
    public class SearchController : Controller
    {
        // GET: Search
        public ActionResult ResultSearch()
        {
            string tenphim = Request["txt"];
            Session["Previos"] = "/Search/ResultSearch?txt="+tenphim;
            DBIO d = new DBIO();    
            List<Phim> model2 = d.ListSearch(tenphim);
            ViewBag.txt = tenphim;
            return View(model2);        
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