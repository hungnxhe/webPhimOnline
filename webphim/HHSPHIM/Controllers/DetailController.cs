using DatabaseIO;
using DatabaseProvide;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HHSPHIM.Controllers
{
    public class DetailController : Controller
    {
        // GET: Detail
        public ActionResult DetailPage()
        {
            DBIO d = new DBIO();
            string id = Request.Params["idone"];
            Phim p = d.getFilm(id);
            Session["phimten"] = p;
            Session["MaPhim"] = id;
            Session["tapdang xem"] = 1;
            Session["Previos"] = "/Detail/DetailPage?idone="+ System.Web.HttpContext.Current.Session["MaPhim"];
            string [] words = p.TenPhim.Split(' ');
            List<Phim> md2 = d.ListSearch(words[0]);
            Session["mostcommented"] = md2;
            Uathich a = new Uathich();
            string idac;
            if (System.Web.HttpContext.Current.Session["login1"] == null)
            {
                idac = ".";
            }
            else
            {
                idac = ((Account)System.Web.HttpContext.Current.Session["login1"]).IDAC;
            }
            a = d.checkexistfavo(idac,id);
            if (a==null)
                ViewBag.check = true;
            else
                ViewBag.check = false;
            int com = d.countComment(id);
            ViewBag.countComment = com;
            int tim = d.countfavo(id);
            ViewBag.count = tim;
            return View(p);
            
        }
    }
}