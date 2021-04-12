using Quanly.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Quanly.Model
{
    class TinTuc
    {
        private string title;
        private string image;
        private string content;

        public TinTuc(string title, string image, string content)
        {
            this.title = title;
            this.image = image;
            this.content = content;
        }
        public TinTuc()
        {
        }
        public string Title { get => title; set => title = value; }
        public string Image { get => image; set => image = value; }
        public string Content { get => content; set => content = value; }
        public static string totalNew()
        {
            string a = "";
            DataTable dataTable = sql.totalNew();
            foreach (DataRow dr in dataTable.Rows)
            {
                a = dr["total"].ToString();
            }
            return a;
        }
    }
}
