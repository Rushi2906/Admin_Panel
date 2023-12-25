using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System.Data.Common;
using System.Data;
using Admin_Panel.Areas.SEC_User.Models;

namespace Admin_Panel.Areas.DAL.SEC_User
{
    public class SEC_UserDALBase : DAL_Helper
    {

        #region PhotoFile Upload

        private readonly IWebHostEnvironment _webHostEnvironment;
        public SEC_UserDALBase(IWebHostEnvironment webHostEnvironment)
        {
            _webHostEnvironment = webHostEnvironment;
        }

        #endregion

        #region Method: dbo_PR_SEC_User_SelectByPK
        public DataTable dbo_PR_SEC_User_SelectByUserNamePassword(string UserName, string Password)
        {
            try
            {
                SqlDatabase sqlDB = new SqlDatabase(ConnectionString);
                DbCommand dbCMD = sqlDB.GetStoredProcCommand("PR_User_SelectAll");
                sqlDB.AddInParameter(dbCMD, "UserName", SqlDbType.VarChar, UserName);
                sqlDB.AddInParameter(dbCMD, "Password", SqlDbType.VarChar, Password);

                DataTable dt = new DataTable();
                using (IDataReader dr = sqlDB.ExecuteReader(dbCMD))
                {
                    dt.Load(dr);
                }

                return dt;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        #endregion

        #region Method: dbo_PR_SEC_User_Insert
        public bool dbo_PR_SEC_User_Insert(SEC_UserModel userModel)
        {
            try
            {
                SqlDatabase sqlDatabase = new SqlDatabase(ConnectionString);
                DbCommand db = sqlDatabase.GetStoredProcCommand("PR_USER_SELECTBYUSERNAME");
                sqlDatabase.AddInParameter(db,"USERNAME",SqlDbType.VarChar, userModel.UserName);
                DataTable dt = new DataTable();
                using (IDataReader dataReader = sqlDatabase.ExecuteReader(db))
                {
                    dt.Load(dataReader);
                }
                if (dt.Rows.Count > 0)
                {
                    return false;
                }
                else
                {
                    // For Upload and get Photo into Database
                    if (userModel.CoverPhoto != null)
                    {
                        string folder = "user/photos/";
                        folder += Guid.NewGuid().ToString()+"_"+userModel.CoverPhoto.FileName;  // Guid.NewGuid().ToString() for making file name unique
                        
                        userModel.PhotoPath = "/"+folder;

                        string serverfolder = Path.Combine(_webHostEnvironment.WebRootPath,folder);

                        userModel.CoverPhoto.CopyToAsync(new FileStream(serverfolder,FileMode.Create));
                    }
                    DbCommand dbCmd = sqlDatabase.GetStoredProcCommand("PR_USER_INSERT");
                    sqlDatabase.AddInParameter(dbCmd, "@UserName", SqlDbType.NVarChar, userModel.UserName);
                    sqlDatabase.AddInParameter(dbCmd, "@Password", SqlDbType.NVarChar, userModel.Password);
                    sqlDatabase.AddInParameter(dbCmd, "@FirstName", SqlDbType.NVarChar, userModel.FirstName);
                    sqlDatabase.AddInParameter(dbCmd, "@LastName", SqlDbType.NVarChar, userModel.LastName);
                    sqlDatabase.AddInParameter(dbCmd, "@Email", SqlDbType.NVarChar, userModel.Email);
                    sqlDatabase.AddInParameter(dbCmd, "@PhotoPath", SqlDbType.NVarChar, userModel.PhotoPath);
                    if (Convert.ToBoolean(sqlDatabase.ExecuteNonQuery(dbCmd)))
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
            catch(Exception ex)
            {
                return false;
            }
            

        }
        #endregion
    }
}
