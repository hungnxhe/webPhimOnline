using DatabaseIO;
using DatabaseProvide;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HHSPHIM.Controllers
{
    public class FavoriteController : Controller
    {
        // GET: Favorite
        public ActionResult Myfavorite()
        {
            Session["Previos"] = "/Favorite/Myfavorite";
            DBIO d = new DBIO();
            List<Uathich> uathich = new List<Uathich>();
            string idac = ((Account)System.Web.HttpContext.Current.Session["Login1"]).IDAC;
            uathich = d.uathich(idac);
            List<Phim> x = new List<Phim>();
            foreach (Uathich a in uathich)
            {
                x.Add(d.getFilm(a.IDP));
            }
            Session["favo"] = x;
            return View(x);
        }
        [HttpPost]
        public ActionResult Addfavo()
        {
            string idac = ((Account)System.Web.HttpContext.Current.Session["login1"]).IDAC;
            string idp =(string)System.Web.HttpContext.Current.Session["MaPhim"];
            DBIO d = new DBIO();
            d.Addfavo(idac,idp);
            if(d.Addfavo(idac, idp) == true)
            {
                Session["bool"] = "Add successfull";
            }
            else
            {
                Session["bool"] = "Add Fail - Film is exist in list favorite";
            }
            string previos = (string)System.Web.HttpContext.Current.Session["Previos"];
            return Redirect(previos);
        }
        [HttpPost]
        public ActionResult Deletefavo()
        {
            string idac = ((Account)System.Web.HttpContext.Current.Session["login1"]).IDAC;
            string idp = Request["idp"];
            DBIO d = new DBIO();
            d.Deletefavo(idac, idp);
            if (d.Deletefavo(idac, idp) == true)
            {
                Session["bool"] = "delete successfull";
            }
            else
            {
                Session["bool"] = "delete Fail - Film is exist in list favorite";
            }
            string previos = (string)System.Web.HttpContext.Current.Session["Previos"];
            return Redirect(previos);
        }
    }
}