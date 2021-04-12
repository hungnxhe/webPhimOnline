namespace Quanly
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Account")]
    public partial class Account
    {
        [Key]
        [StringLength(50)]
        public string IDAC { get; set; }

        [Required]
        [StringLength(50)]
        public string Username { get; set; }

        [Required]
        [StringLength(50)]
        public string Pass { get; set; }

        [Required]
        [StringLength(50)]
        public string ChucVu { get; set; }

        [StringLength(50)]
        public string status { get; set; }

        [Column(TypeName = "text")]
        public string code { get; set; }

        [Column(TypeName = "text")]
        public string active { get; set; }
    }
}
