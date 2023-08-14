namespace Admin_Panel.Areas.LOC_City.Models
{
    public class LOC_CityModel
    {
        public int? CityID { get; set; }
        public string? CityName { get; set; }
        public string? CityCode { get; set; }
        public int? CountryID { get; set; }
        public string? CountryName { get; set; }
        public int? StateID { get; set; }
        public string? StateName { get; set; }
        public DateTime CreationDate { get; set; }
        public DateTime Modified { get; set; }

    }
}
