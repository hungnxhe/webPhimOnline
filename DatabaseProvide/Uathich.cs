namespace DatabaseProvide
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Uathich")]
    public partial class Uathich
    {
        [Key]
        [StringLength(50)]
        public string IDP { get; set; }

        [Required]
        [StringLength(50)]
        public string IDAC { get; set; }
    }
}
