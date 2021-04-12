namespace DatabaseProvide
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("cacTap")]
    public partial class cacTap
    {
        [StringLength(50)]
        public string tap { get; set; }

        [Key]
        [Column(Order = 0)]
        [StringLength(50)]
        public string IDP { get; set; }

        [Key]
        [Column(Order = 1, TypeName = "text")]
        public string Link { get; set; }
    }
}
