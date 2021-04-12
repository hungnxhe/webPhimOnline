using Quanly.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Quanly.Model
{
    class Phim
    {
        private string idp;
        private string ten;
        private string theloai;
        private string poster;
        private string anhmota;
        private string dienvien;
        private string timepost;
        private string mota;
        private string trailer;
        private int view;
        private int rate;
        private string anhdienvien;

        public Phim(string idp, string ten, string theloai, string poster, string anhmota, string dienvien, string timepost, string mota, string trailer, int view, int rate, string anhdienvien)
        {
            this.idp = idp;
            this.ten = ten;
            this.theloai = theloai;
            this.poster = poster;
            this.anhmota = anhmota;
            this.dienvien = dienvien;
            this.timepost = timepost;
            this.mota = mota;
            this.trailer = trailer;
            this.view = view;
            this.rate = rate;
            this.anhdienvien = anhdienvien;
        }
        public Phim()
        {          
        }
        public string Idp { get => idp; set => idp = value; }
        public string Ten { get => ten; set => ten = value; }
        public string Theloai { get => theloai; set => theloai = value; }
        public string Poster { get => poster; set => poster = value; }
        public string Anhmota { get => anhmota; set => anhmota = value; }
        public string Dienvien { get => dienvien; set => dienvien = value; }
        public string Timepost { get => timepost; set => timepost = value; }
        public string Mota { get => mota; set => mota = value; }
        public string Trailer { get => trailer; set => trailer = value; }
        public int View { get => view; set => view = value; }
        public int Rate { get => rate; set => rate = value; }
        public string Anhdienvien { get => anhdienvien; set => anhdienvien = value; }

        public static string totalView()
        {
            string a = "";
            DataTable dataTable = sql.totalView();
            foreach (DataRow dr in dataTable.Rows)
            {
                a = dr["total"].ToString();
            }
            return a;
        }
        public static string numberphim()
        {
            string a = "";
            DataTable dataTable = sql.numberPhim();
            foreach (DataRow dr in dataTable.Rows)
            {
                a = dr["total"].ToString();
            }
            return a;
        }
    }
}
