using Admin_Panel.Areas.SEC_User.Models;
using Microsoft.AspNetCore.Mvc;
using System.Data.SqlClient;
using System.Data;
using Admin_Panel.Areas.DAL.SEC_User;

namespace Admin_Panel.Areas.SEC_User.Controllers
{
    [Area("SEC_User")]
    [Route("SEC_User/[controller]/[action]")]
    public class SEC_UserController : Controller
    {
        public IActionResult SEC_UserLogin()
        {
            return View();
        }

        #region Configuration

        private readonly IConfiguration Configuration;
        private readonly IWebHostEnvironment _webHostEnvironment;

        public SEC_UserController(IConfiguration _Configuration, IWebHostEnvironment webHostEnvironment)
        {
            Configuration = _Configuration;
            _webHostEnvironment = webHostEnvironment;
        }

        #endregion

        [HttpPost]
        public IActionResult Login(SEC_UserModel userLoginModel)
        {
            
            string ErrorMsg = string.Empty;
            if (string.IsNullOrEmpty(userLoginModel.UserName))
            {
                ErrorMsg += "User Name is Required";
            }
            if (string.IsNullOrEmpty(userLoginModel.Password))
            {
                ErrorMsg += "<br/>Password is Required";
            }
            if (ErrorMsg != string.Empty)
            {
                TempData["Error"] = ErrorMsg;
                return RedirectToAction("SEC_UserLogin",userLoginModel);
            }

            if (ModelState.IsValid)
            {
                SqlConnection conn = new SqlConnection(this.Configuration.GetConnectionString("myConnectionString"));
                conn.Open();

                SqlCommand sqlCommand = conn.CreateCommand();
                sqlCommand.CommandType = CommandType.StoredProcedure;
                sqlCommand.CommandText = "PR_User_SelectAll";
                sqlCommand.Parameters.AddWithValue("@UserName", userLoginModel.UserName);
                sqlCommand.Parameters.AddWithValue("@Password", userLoginModel.Password);

                SqlDataReader objSDR = sqlCommand.ExecuteReader();

                DataTable dtLogin = new DataTable();

                if (!objSDR.HasRows)
                {
                    TempData["Error"] = "Invalid Username or Password";
                    return RedirectToAction("SEC_UserLogin", "SEC_User");
                }
                else
                {
                    dtLogin.Load(objSDR);
                    if (dtLogin.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dtLogin.Rows)
                        {
                            HttpContext.Session.SetString("UserID", dr["UserID"].ToString());
                            HttpContext.Session.SetString("UserName", dr["UserName"].ToString());
                            HttpContext.Session.SetString("PhotoPath", dr["PhotoPath"].ToString());
                            HttpContext.Session.SetString("Email", dr["Email"].ToString());
                            HttpContext.Session.SetString("Password", dr["Password"].ToString());
                            break;
                        }

                    }
                    //else
                    //{

                    //    TempData["Error"] = ErrorMsg;
                    //    return RedirectToAction("Login_Page", "SEC_User");
                    //}
                    if (HttpContext.Session.GetString("UserName") != null && HttpContext.Session.GetString("Password") != null)
                    {
                        Console.WriteLine("Login Success");
                        return RedirectToAction("Index", "Home");
                    }
                    Console.WriteLine("Login Fail");

                    return RedirectToAction("SEC_UserLogin", "SEC_User");
                }


            }
            return RedirectToAction("Index","Home");


        }

        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("SEC_UserLogin","SEC_User");
        }

        public IActionResult SEC_UserRegister()
        {
            return View();
        }

        #region  Register
        public IActionResult Register(SEC_UserModel sEC_UserModel)
        {
            SEC_UserDAL sEC_UserDAL = new SEC_UserDAL(_webHostEnvironment);
            bool IsSuccess = sEC_UserDAL.dbo_PR_SEC_User_Insert(sEC_UserModel);
            Console.WriteLine(IsSuccess);
            if (IsSuccess)
            {
                return RedirectToAction("SEC_UserLogin");
            }
            else
            {
                return RedirectToAction("SEC_UserRegister");
            }
        }
        #endregion
    }
}
