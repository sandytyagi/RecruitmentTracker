using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using RecruitmentTracker.Models;

namespace RecruitmentTracker.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult CheckUserLogin(User model)
        {

            RecruitmentTrackerEntities db = new RecruitmentTrackerEntities();
            var userDetails = db.Users.Where(x => x.User_name.Equals(model.User_name, StringComparison.OrdinalIgnoreCase) && x.Password.Equals(model.Password)).FirstOrDefault();
            if (userDetails != null)
            {
                FormsAuthentication.SetAuthCookie(userDetails.User_name, true);

                var authTicket = new FormsAuthenticationTicket(1, userDetails.User_name, DateTime.Now, DateTime.Now.AddMinutes(20), false, userDetails.User_Type);
                string encryptedTicket = FormsAuthentication.Encrypt(authTicket);
                var authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);
                HttpContext.Response.Cookies.Add(authCookie);
            return RedirectToAction("Index", "Home");

            }
            else
            {
                model.LoginErrorMessage = "Invalid user name or password.";
                return View("Index", model);
            }

        }
    }
}