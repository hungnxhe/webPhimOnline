using DatabaseIO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HHSPHIM.Controllers
{
    public class RegisterController : Controller
    {
        // GET: Register
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public ActionResult registerAccount()
        {

            string Idac = Request["idac"];
            string user = Request["user"];
            string pass = Request["pass"];
            string repass = Request["repass"];
            Session["idac1"] = Idac;
            Session["user1"] = user;
            Session["pass1"] = pass;

            try
            {
                DBIO d = new DBIO();
                if (d.checkaccount(user) != null)
                {
                    Session["errorr1"] = "Account is exist can not register";
                    return Redirect("/Register/Register");
                }
                else
                {
                    if (pass.Equals(repass) == false)
                    {
                        Session["errorr1"] = "Repass must equal pass  check again !";
                        return Redirect("/Register/Register");
                    }
                    else
                    {
                        d.register(Idac, user, pass);
                        return Redirect("/Login/Login");
                    }
                }
            }
            catch
            {
                Session["errorr1"] = "IDac is exist can not register";
                return Redirect("/Register/Register?IDac="+Idac);
            }
        }
    }
}