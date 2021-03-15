using DatabaseIO;
using DatabaseProvide;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HHSPHIM.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        public ActionResult AddPhim()
        {
            return View();
        }
        public ActionResult AddLink()
        {
            return View();
        }
        public ActionResult AddNews()
        {
            return View();
        }
        public ActionResult managerPhim()
        {
            DBIO d = new DBIO();
            List<Phim> model = d.getAllFilm();
            return View(model);
        }
        public ActionResult phimdetail()
        {
            DBIO d = new DBIO();
            string idp = Request["IDPForCm"];
            Phim p = d.getFilm(idp);
            Session["idpForRm"] = idp;
            return PartialView("detailphim", p);
        }
        public ActionResult tapphim()
        {
            DBIO d = new DBIO();
            string idp = Request["IDPForCm"];
            List<cacTap> list = d.getvideo(idp);
            Session["idpForRm"] = idp;
            return PartialView("tapphim", list);
        }
        public ActionResult deletePhim()
        {
            DBIO d = new DBIO();
            string idp = Request["IDPForCm"];
            d.deletePhim(idp);
            return Redirect("/Admin/managerPhim");
        }
        public ActionResult managerComment()
        {
            DBIO d = new DBIO();
            List<Phim> model = d.getAllFilm();
            return View(model);
        }
        public ActionResult listcomment()
        {
            DBIO d = new DBIO();
            string idp = Request["IDPForCm"];
            List<Comment> list = d.loadcomment(idp);
            Session["idpForRm"] = idp;
            return PartialView("alo", list);
        }

        public ActionResult removeComment()
        {
            DBIO d = new DBIO();
            string binhluan = Request["binhluan"];
            string idp = (string)System.Web.HttpContext.Current.Session["idpForRm"];
            d.removeComment(binhluan,idp);
            List<Comment> list = d.loadcomment(idp);
            return PartialView("alo", list);
        }
        public ActionResult blockAccount()
        {
            DBIO d = new DBIO();
            List<Account> list = d.getAllAccounts();
            return View(list);
        }
        [HttpPost]
        public ActionResult Lock()
        {
            DBIO d = new DBIO();
            string idac = Request["idac"];
            d.Lock("off",idac);
            return Redirect("/Admin/blockAccount");
        }
        [HttpPost]
        public ActionResult UnLock()
        {
            DBIO d = new DBIO();
            string idac = Request["idac"];
            d.Lock("on", idac);
            return Redirect("/Admin/blockAccount");
        }
        public string driveControl(string link)
        {
            String[] arr = link.Split('/');
            String id = arr[5];
            String newlinkString = "https://drive.google.com/uc?id=" + id;
            return newlinkString;
        }
        public string youtubeControl(string link)
        {
            String[] arr = link.Split('/');
            String id = arr[3];
            String newlinkString = "https://www.youtube.com/embed/" + id;
            return newlinkString;
        }
        [HttpPost]
        public ActionResult add()
        {
            DBIO d = new DBIO();
            string idp = Request["a2"];
            string tenphim = Request["b2"];
            string theloai = Request["c2"];
            string poster= Request["d2"];
            string image= Request["g2"]; ;
            string dienvien= Request["e2"];
            string timepost= Request["f2"];
            string mota= Request["h2"]; 
            string trailer= Request["i2"];
            string anhdv= Request["k2"];
            try
            {
                d.addPhim(idp, tenphim, theloai, driveControl(poster), dienvien, timepost, driveControl(image), mota, youtubeControl(trailer), driveControl(anhdv));
                return Redirect("/Admin/AddPhim?messeage=Add success");
            }
            catch
            {
                string messeage = "Add Fail Check Id phim is Exist or all textField not Empty";
                return Redirect("/Admin/AddPhim?messeage="+messeage);
            }
            
        }
        [HttpPost]
        public ActionResult addTap()
        {
            string idp = Request["a3"];
            string tap= Request["b3"];
            string link= Request["c3"];
            try 
            {
                int t;
                try
                {
                   t = int.Parse(tap);
                }
                catch
                {
                    return Redirect("/Admin/AddLink?messeage=tap is integer number");
                }
                DBIO d = new DBIO();
                d.addTap(idp, t, driveControl(link));
                return Redirect("/Admin/AddLink?messeage=Success");
            }
            catch
            {
                return Redirect("/Admin/AddLink?messeage=Idp is not exist");
            }          
        }
    }
}