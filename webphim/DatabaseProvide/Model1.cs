using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace DatabaseProvide
{
    public partial class Model1 : DbContext
    {
        public Model1()
            : base("name=Account")
        {
        }

        public virtual DbSet<Account> Accounts { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Account>()
    .Property(e => e.status)
    .IsUnicode(false);

            modelBuilder.Entity<Account>()
                .Property(e => e.code)
                .IsUnicode(false);

            modelBuilder.Entity<Account>()
                .Property(e => e.active)
                .IsUnicode(false);
        }
    }
}
