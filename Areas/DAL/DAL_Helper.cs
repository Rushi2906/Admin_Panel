namespace Admin_Panel.Areas.DAL
{
    public class DAL_Helper
    {
        #region Connection String
        public static string ConnectionString = new ConfigurationBuilder().AddJsonFile("appsettings.json").Build().GetConnectionString("myConnectionString");
        #endregion
    }
}
