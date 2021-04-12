using DatabaseIO;
using DatabaseProvide;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HHSPHIM.Controllers
{
    public class SearchByActorController : Controller
    {
        // GET: SearchByActor
        public ActionResult Actor()
        {
            string actor = Request["name"];
            Session["Previos"] = "/SearchByActor/Actor?name=" + actor;
            DBIO d = new DBIO();
            List<Phim> model4 = d.ListByActor(actor);
            return View(model4);
        }
    }
}