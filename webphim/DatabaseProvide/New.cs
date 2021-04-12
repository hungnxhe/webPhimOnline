namespace DatabaseProvide
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("New")]
    public partial class New
    {
        public int ID { get; set; }

        [Column(TypeName = "text")]
        [Required]
        public string Image { get; set; }

        [Column(TypeName = "text")]
        [Required]
        public string Content { get; set; }

        [StringLength(500)]
        public string title { get; set; }
    }
}
