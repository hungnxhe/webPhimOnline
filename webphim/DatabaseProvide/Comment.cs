namespace DatabaseProvide
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Comment")]
    public partial class Comment
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(50)]
        public string IDP { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(50)]
        public string IDAC { get; set; }

        [Key]
        [Column(Order = 2, TypeName = "text")]
        public string BinhLuan { get; set; }

        public string name { get; set; }

    }
}
