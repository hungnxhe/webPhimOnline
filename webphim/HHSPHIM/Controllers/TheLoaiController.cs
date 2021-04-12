using DatabaseIO;
using DatabaseProvide;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HHSPHIM.Controllers
{
    public class TheLoaiController : Controller
    {
        // GET: TheLoai
        public ActionResult TheLoai()
        {
            string theloai = Request["txttheloai"];
            Session["Previos"] = "/TheLoai/TheLoai?txttheloai=" + theloai;
            DBIO d = new DBIO();
            List<Phim> model = d.ListTheLoai(theloai);
            return View(model);
        }
    }
}