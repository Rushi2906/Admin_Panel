namespace Admin_Panel.Areas.MST_Branch.Models
{
    public class MSt_BranchModel
    {
        public int? BranchID { get; set; }

        public string BranchName { get; set; }

        public string BranchCode { get; set; }
    }
    public class MSt_BranchDropDownModel
    {
        public int BranchID { get; set; }
        public string BranchName { get; set; }
    }
}
