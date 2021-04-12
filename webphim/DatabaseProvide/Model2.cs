using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace DatabaseProvide
{
    public partial class Model2 : DbContext
    {
        public Model2()
            : base("name=Model22")
        {
        }

        public virtual DbSet<Phim> Phims { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Phim>()
                .Property(e => e.TenPhim)
                .IsUnicode(false);

            modelBuilder.Entity<Phim>()
                .Property(e => e.TheLoai)
                .IsUnicode(false);

            modelBuilder.Entity<Phim>()
                .Property(e => e.Poster)
                .IsUnicode(false);

            modelBuilder.Entity<Phim>()
                .Property(e => e.Image)
                .IsUnicode(false);

            modelBuilder.Entity<Phim>()
                .Property(e => e.MoTa)
                .IsUnicode(false);

            modelBuilder.Entity<Phim>()
                .Property(e => e.Trailer)
                .IsUnicode(false);

            modelBuilder.Entity<Phim>()
                .Property(e => e.Anhdienvien)
                .IsUnicode(false);
        }
    }
}
