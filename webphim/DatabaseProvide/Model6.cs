using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace DatabaseProvide
{
    public partial class Model6 : DbContext
    {
        public Model6()
            : base("name=Model6")
        {
        }

        public virtual DbSet<New> News { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<New>()
                .Property(e => e.Image)
                .IsUnicode(false);

            modelBuilder.Entity<New>()
                .Property(e => e.Content)
                .IsUnicode(false);
        }
    }
}
