﻿using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Admin_Panel.Areas.SEC_User.Models
{
    public class SEC_UserModel
    {
        public int? UserId { get; set; }
        [Required]
        [DisplayName("User Name")]
        public string UserName { get; set; }
        [Required]
        public string Password { get; set; }
        public string? FirstName { get; set; }
        public string? LastName { get; set; }
        public string? MobileNo { get; set; }
        public string? Email { get; set; }
        public string? PhotoPath { get; set; }
        public DateTime Created { get; set; }
        public DateTime Modified { get; set; }

        public IFormFile? CoverPhoto { get; set; }

    }
}
