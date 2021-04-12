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
    public class NewsController : Controller
    {
        // GET: News
        public ActionResult NewPage()
        {
            Session["Previos"] = "/News/NewPage";
            DBIO d = new DBIO();
            List<New> list = d.loadNew();
            PagedList<New> pageNew = null;
            int index;
            if (Request["index"] == null)
            {
                index = 1;
            }
            else
            {
                index = int.Parse(Request["index"]);
            }
            int total = list.Count;
            int page = total / 4;
            if (total % 4 != 0)
            {
                page++;
            }
            ViewBag.total = page;
            ViewBag.index = index;
            pageNew = (PagedList<New>)list.ToPagedList(index, 4);
            return View(pageNew);
        }
    }
}