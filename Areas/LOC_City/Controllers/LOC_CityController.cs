using Microsoft.AspNetCore.Mvc;
using System.Data.SqlClient;
using System.Data;
using Admin_Panel.Areas.LOC_City.Models;
using Admin_Panel.Areas.LOC_State.Models;
using Admin_Panel.Areas.LOC_Country.Models;

namespace Admin_Panel.Areas.LOC_City.Controllers
{
    [Area("LOC_City")]
    [Route("LOC_City/[controller]/[action]")]
    public class LOC_CityController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        private readonly IConfiguration Configuration;

        public LOC_CityController(IConfiguration _Configuration)
        {
            Configuration = _Configuration;
        }

        #region City List

        public IActionResult LOC_CityList()
        {
            string connectionStr = this.Configuration.GetConnectionString("myConnectionString");
            DataTable dt = new DataTable();
            SqlConnection connection = new SqlConnection(connectionStr);
            connection.Open();
            SqlCommand objCmd = connection.CreateCommand();
            objCmd.CommandType = CommandType.StoredProcedure;
            objCmd.CommandText = "PR_City_SelectAll";
            SqlDataReader objSDR = objCmd.ExecuteReader();
            dt.Load(objSDR);
            return View("LOC_CityList", dt);
        }

        #endregion

        #region City Delete

        public IActionResult LOC_CityDelete(int CityID)
        {
            string connectionStr = this.Configuration.GetConnectionString("myConnectionString");
            SqlConnection connection = new SqlConnection(connectionStr);
            connection.Open();
            SqlCommand objCmd = connection.CreateCommand();
            objCmd.CommandType = CommandType.StoredProcedure;
            objCmd.CommandText = "PR_City_DeleteByPK";
            objCmd.Parameters.AddWithValue("@CityID", CityID);
            objCmd.ExecuteNonQuery();
            return RedirectToAction("LOC_CityList");
        }

        #endregion

        #region City Add / Update

        public IActionResult Save(LOC_CityModel model)
        {
            string connectionStr = this.Configuration.GetConnectionString("myConnectionString");
            SqlConnection connection = new SqlConnection(connectionStr);
            connection.Open();
            SqlCommand objCmd = connection.CreateCommand();
            objCmd.CommandType = CommandType.StoredProcedure;

            if (model.CityID == null)
            {
                objCmd.CommandText = "PR_City_Insert";
            }
            else
            {
                objCmd.CommandText = "PR_City_UpdateByPK";
                objCmd.Parameters.AddWithValue("@CityID", model.CityID);
            }

            objCmd.Parameters.AddWithValue("@CityName", model.CityName);
            objCmd.Parameters.AddWithValue("@CityCode", model.CityCode);
            objCmd.Parameters.AddWithValue("@CountryID", model.CountryID);
            objCmd.Parameters.AddWithValue("@StateID", model.StateID);
            objCmd.ExecuteNonQuery();
            connection.Close();
            return RedirectToAction("LOC_CityList");
        }

        public IActionResult LOC_CityAdd(int? CityID)
        {
            string connectionStr = this.Configuration.GetConnectionString("myConnectionString");

            #region Country DropDown

            SqlConnection connection1 = new SqlConnection(connectionStr);
            connection1.Open();
            SqlCommand objCmd1 = connection1.CreateCommand();
            objCmd1.CommandType = CommandType.StoredProcedure;
            objCmd1.CommandText = "PR_Country_ComboBox";
            SqlDataReader reader1 = objCmd1.ExecuteReader();
            DataTable dt1 = new DataTable();
            dt1.Load(reader1);
            connection1.Close();

            List<LOC_CountryModel> list = new List<LOC_CountryModel>();

            foreach (DataRow dr in dt1.Rows)
            {
                LOC_CountryModel countryModel = new LOC_CountryModel();
                countryModel.CountryID = Convert.ToInt32(dr["CountryID"]);
                countryModel.CountryName = dr["CountryName"].ToString();
                list.Add(countryModel);
            }
            ViewBag.CountryList = list;

            #endregion

            #region State DropDown

            SqlConnection connection2 = new SqlConnection(connectionStr);
            connection2.Open();
            SqlCommand objCmd2 = connection2.CreateCommand();
            objCmd2.CommandType = CommandType.StoredProcedure;
            objCmd2.CommandText = "PR_State_ComboBox";
            SqlDataReader reader2 = objCmd2.ExecuteReader();
            DataTable dt2 = new DataTable();
            dt2.Load(reader2);
            connection2.Close();

            List<LOC_StateModel> list2 = new List<LOC_StateModel>();

            foreach (DataRow dr in dt2.Rows)
            {
                LOC_StateModel stateModel = new LOC_StateModel();
                stateModel.StateID = Convert.ToInt32(dr["StateID"]);
                stateModel.StateName = dr["StateName"].ToString();
                list2.Add(stateModel);
            }
            ViewBag.StateList = list2;

            #endregion

            if (CityID != null)
            {
                SqlConnection connection = new SqlConnection(connectionStr);
                connection.Open();
                SqlCommand objCmd = connection.CreateCommand();
                objCmd.CommandType = CommandType.StoredProcedure;
                objCmd.CommandText = "PR_City_SelectByPk";
                objCmd.Parameters.AddWithValue("@CityID", CityID);
                DataTable dt = new DataTable();
                SqlDataReader objSDR = objCmd.ExecuteReader();

                dt.Load(objSDR);
                LOC_CityModel model = new LOC_CityModel();
                foreach (DataRow dr in dt.Rows)
                {
                    model.CityID = Convert.ToInt32(dr["CityID"]);
                    model.CityName = (string)dr["CityName"];
                    model.CityCode = (string)dr["CityCode"];
                    model.CountryID = Convert.ToInt32(dr["CountryID"]);
                    model.CountryName = (string)dr["CountryName"];
                    model.StateID = Convert.ToInt32(dr["StateID"]);
                    model.StateName = (string)dr["StateName"];
                }
                return View("LOC_CityAdd", model);
            }
            else
            {
                return View("LOC_CityAdd");
            }
        }

        #endregion

        #region City Search By Name

        public IActionResult LOC_CitySearchByName(string CityName)
        {
            string connectionStr = this.Configuration.GetConnectionString("myConnectionString");
            DataTable dt = new DataTable();
            SqlConnection connection = new SqlConnection(connectionStr);
            connection.Open();
            SqlCommand objCmd = connection.CreateCommand();
            objCmd.CommandType = CommandType.StoredProcedure;
            objCmd.CommandText = "PR_City_SelectByCityName";
            objCmd.Parameters.AddWithValue("@CName", CityName);
            SqlDataReader objSDR = objCmd.ExecuteReader();
            dt.Load(objSDR);
            return View("LOC_CityList", dt);
        }

        #endregion
    }
}
