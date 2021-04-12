namespace DatabaseProvide
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Phim")]
    public partial class Phim
    {
        [Key]
        [StringLength(50)]
        public string IDP { get; set; }

        [Column(TypeName = "text")]
        [Required]
        public string TenPhim { get; set; }

        [Column(TypeName = "text")]
        [Required]
        public string TheLoai { get; set; }

        [Column(TypeName = "text")]
        [Required]
        public string Poster { get; set; }

        [Column(TypeName = "text")]
        [Required]
        public string Image { get; set; }

        [Required]
        [StringLength(50)]
        public string DienVien { get; set; }

        [Column(TypeName = "date")]
        public DateTime timePost { get; set; }

        [Column(TypeName = "text")]
        [Required]
        public string MoTa { get; set; }

        [Column(TypeName = "text")]
        [Required]
        public string Trailer { get; set; }

        public int luotView { get; set; }

        public int Rate { get; set; }

        [Column(TypeName = "text")]
        public string Anhdienvien { get; set; }
    }
}
