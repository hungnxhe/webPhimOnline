using DatabaseIO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;

namespace HHSPHIM.Controllers
{
    public class RegisterController : Controller
    {
        // GET: Register
        public ActionResult Register()
        {
            Random rnd = new Random();
            int idrandom = rnd.Next(1, 1000);
            string id = "U" + idrandom.ToString();
            string user = Request["user"];
            string pass = Request["pass"];
            string repass = Request["repass"];
            string code= rnd.Next(1, 100000).ToString();
            if (user != null)
            {
                try
                {
                    DBIO d = new DBIO();
                    if (d.checkaccount(user) != null)
                    {
                        ViewBag.mes1 = "Account Tồn tại Không thể Đăng Ký";
                        ViewBag.user = user;
                        ViewBag.pass = pass;
                    }
                    else
                    {
                        if (pass.Equals(repass) == false)
                        {
                            ViewBag.mes1 = "Repass Phải Giống Với Pass";
                            ViewBag.user = user;
                            ViewBag.pass = pass;
                        }
                        else
                        {
                            try 
                            {
                                d.register(id, user, pass,code);
                                ViewBag.mes1 = "Đăng ký Thành công vui lòng kích hoạt tài khoản (trong email)";
                                string to = user;
                                string from = user;
                                string subject = "Kích Hoạt Tài Khoản Để Xem Nhiều Phim Hay Hơn";
                                string body = "Mã Kích Hoạt tài khoản : "+code+".    => kích hoạt Tài khoản tại đây https://localhost:44381/Active/activeAccount";
                                MailMessage message = new MailMessage(to, from, subject, body);
                                message.IsBodyHtml = true;
                                SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                                client.EnableSsl = true;
                                client.Credentials = new System.Net.NetworkCredential("hung6nuh@gmail.com", "hung120720");
                                client.Send(message);
                            }
                            catch(Exception e)
                            {
                                ViewBag.mes1 = e.Message;
                            }
                        }
                    }
                }
                catch
                {
                    ViewBag.mes1 = "Lỗi Đăng Ký Tài Khoản Vui lòng quay lại sau";
                    ViewBag.user = user;
                    ViewBag.pass = pass;
                }
            }
            else
            {
                ViewBag.mes1 = "Chú Ý Phải điền đầy đủ tất cả thông tin để đăng ký tài khoản";
            }
            return View();
        }
    }
}