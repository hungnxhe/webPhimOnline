using DatabaseIO;
using DatabaseProvide;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HHSPHIM.Controllers
{
    public class ADControlController : Controller
    {

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
        // GET: ADControl
        public ActionResult AdminHomePage()
        {
            DBIO d = new DBIO();
            List<Phim> list = d.getAllFilm();
            int totalFilm = list.Count();
            List<Account> list1 = d.getAllAccounts();
            int totalAccount = list1.Count();
            int totalView = 0;
            foreach (Phim item in list)
            {
                totalView += item.luotView;
            }
            List<Comment> list2 = d.getAllComments();
            int totalComment = list2.Count();
            List<int> list3 = new List<int>();
            list3.Add(totalView);
            list3.Add(totalAccount);
            list3.Add(totalFilm);
            list3.Add(totalComment);
            return View(list3);
        }
        public ActionResult AddPhim()
        {
            Random rnd = new Random();
            int idrandom = rnd.Next(1, 500);
            string idp = "P" + idrandom.ToString();
            DBIO d = new DBIO();
            string imdb = Request["a2"];
            string tenphim = Request["b2"];
            string theloai = Request["c2"];
            string poster = Request["d2"];
            string image = Request["g2"]; ;
            string dienvien = Request["e2"];
            string timepost = Request["f2"];
            string mota = Request["h2"];
            string trailer = Request["i2"];
            string anhdv = Request["k2"];
            if (tenphim == null)
            {
                ViewBag.messeage1 = "Ảnh Mô tả là link từ google drive...";
            }
            else
            {
                try
                {
                    d.addPhim(idp, tenphim, theloai, driveControl(poster), dienvien, timepost, driveControl(image), mota, youtubeControl(trailer), driveControl(anhdv), imdb);
                    ViewBag.messeage1 = " Them Phim Thanh Cong ... Them tap Phim di ";
                }
                catch
                {
                    ViewBag.messeage1 = " Them Phim That Bai ... Thu Lai Sau ";
                }
            }
            return View();
        }
        public ActionResult AddTap()
        {
            return View();
        }
        public ActionResult SearchPhim()
        {
            string txt = Request["txtsearch"];
            DBIO d = new DBIO();
            List<Phim> list = d.ListSearch(txt);
            return PartialView("ListPhim",list);
        }
        public ActionResult GetPhim()
        {
            string txt = Request["idp"];
            DBIO d = new DBIO();
            Phim p = d.getFilm(txt);
            return PartialView("DataPhim", p);
        }
        public ActionResult addTapMoi()
        {
            string txt = Request["idp"];
            string link = Request["link"];
            DBIO d = new DBIO();
            List<cacTap> c = d.getvideo(txt);
            int tap = 0;
            if (c.Count == 0)
            {
                tap = 1;
            }
            else
            {
                foreach (var item in c)
                {
                    tap = Int32.Parse(item.tap);                   
                }
                tap = tap + 1;
            }
            try
            {
                d.addTap(txt, tap, driveControl(link));
                ViewBag.messeage = "Add success";
            }
            catch
            {
                ViewBag.messeage = "Add Fail!!";
            }
            Phim p = d.getFilm(txt);    
            return PartialView("DataPhim", p);
        }



        public ActionResult AddNew()
        {
                string title = Request["title"];
                string content = Request["content"];
                string image = Request["link"];
            if (title!=null)
            {
                try
                {
                    DBIO d = new DBIO();
                    d.addNew(title, content, driveControl(image));
                    ViewBag.messeage = "Thêm Tin tức Thành Công...";
                }
                catch(Exception e)
                {
                    ViewBag.messeage = e.Message;
                }
            }
            else
            {
                ViewBag.messeage = "Ảnh Mô tả là link từ google drive...";
            }

            return View();
        }
        public ActionResult ManagerComment()
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
            return PartialView("list", list);
        }

        public ActionResult removeComment()
        {
            DBIO d = new DBIO();
            string binhluan = Request["binhluan"];
            string idp = (string)System.Web.HttpContext.Current.Session["idpForRm"];
            d.removeComment(binhluan, idp);
            List<Comment> list = d.loadcomment(idp);
            return PartialView("list", list);
        }
        public ActionResult ManagerPhim()
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
        public ActionResult updateDetail()
        {
            DBIO d = new DBIO();
            string id = Request["a2"];
            string tenphim = Request["b2"];
            string theloai = Request["c2"];
            string poster = Request["d2"];
            string image = Request["g2"]; ;
            string dienvien = Request["e2"];
            string timepost = Request["f2"];
            string mota = Request["h2"];
            string trailer = Request["i2"];
            string anhdv = Request["k2"];
            d.updatephim(id, tenphim, theloai, driveControl(poster), dienvien, timepost, driveControl(image), mota, youtubeControl(trailer), driveControl(anhdv));
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
        public ActionResult deleteTap()
        {
            DBIO d = new DBIO();
            string idp = "P31";
            string[] value = Request["value"].Split(' ');
            d.deleteTap(value[0], value[1]);
            List<cacTap> list = d.getvideo(idp);
            Session["idpForRm"] = idp;
            return PartialView("tapphim", list);
        }
        public ActionResult deletePhim()
        {
            DBIO d = new DBIO();
            string idp = Request["IDPForCm"];
            d.deletePhim(idp);
            return Redirect("/ADControl/ManagerPhim");
        }
        public ActionResult ManagerNew()
        {
            return View();
        }
        public ActionResult ProfilePage()
        {
            DBIO d = new DBIO();
            string username=((Account)System.Web.HttpContext.Current.Session["login1"]).Username;
            Account a = d.checkaccount(username);
            string pass = Request["old"];
            string newpass = Request["new"];
            string repass = Request["renew"];
            string oldpass = ((Account)System.Web.HttpContext.Current.Session["login1"]).Pass;
            if (pass == null || newpass == null || repass == null)
            {
                ViewBag.mess = "Chú Ý phải điền đầy đủ tất cả mấy cái text box kia";
                return View(a);
            }
            else
            {
                if (pass.Equals(oldpass) == false)
                {
                    ViewBag.mess = "Nhập Mật Khẩu cũ bị sai";
                    return View(a);
                }
                else if (newpass.Equals(repass) == false)
                {
                    ViewBag.mess = "Re-password và password Không khớp nhau";
                    return View(a);
                }
                else
                {
                    d.Changepass(username, newpass);
                    Session.Abandon();
                    return Redirect("/ADControl/AdminHomePage");
                }
            }           
        }
        public ActionResult BlockAccount()
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
            d.Lock("off", idac);
            return Redirect("/ADControl/BlockAccount");
        }
        [HttpPost]
        public ActionResult UnLock()
        {
            DBIO d = new DBIO();
            string idac = Request["idac"];
            d.Lock("on", idac);
            return Redirect("/ADControl/BlockAccount");
        }
    }
}