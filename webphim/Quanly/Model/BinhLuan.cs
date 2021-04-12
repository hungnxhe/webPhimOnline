using Quanly.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Quanly.Model
{
    class BinhLuan
    {
        private string idp;
        private string idac;
        private string binhluan;
        private string name;

        public BinhLuan(string idp, string idac, string binhluan, string name)
        {
            this.idp = idp;
            this.idac = idac;
            this.binhluan = binhluan;
            this.name = name;
        }
        public BinhLuan()
        {
        }
        public string Idp { get => idp; set => idp = value; }
        public string Idac { get => idac; set => idac = value; }
        public string Binhluan { get => binhluan; set => binhluan = value; }
        public string Name { get => name; set => name = value; }
        public static string totalComment()
        {
            string a = "";
            DataTable dataTable = sql.totalComment();
            foreach (DataRow dr in dataTable.Rows)
            {
                a = dr["total"].ToString();
            }
            return a;
        }
    }
}
