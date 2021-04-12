using Quanly.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Quanly.Model
{
    class Account
    {
        private string idac;
        private string name;
        private string pass;
        private int chucvu;
        private string status;

        public Account(string idac, string name, string pass, int chucvu, string status)
        {
            this.idac = idac;
            this.name = name;
            this.pass = pass;
            this.chucvu = chucvu;
            this.status = status;
        }
        public Account()
        {
        }

        public string Idac { get => idac; set => idac = value; }
        public string Name { get => name; set => name = value; }
        public string Pass { get => pass; set => pass = value; }
        public int Chucvu { get => chucvu; set => chucvu = value; }
        public string Status { get => status; set => status = value; }
        public static bool login(string user, string pass)
        { 
            List<Account> list = new List<Account>();
            DataTable dataTable = sql.GetAll(user,pass);
            foreach (DataRow dr in dataTable.Rows)
            {
                string a = dr["IDAC"].ToString();
                string b = dr["Username"].ToString();
                string c = dr["Pass"].ToString();
                string d = dr["ChucVu"].ToString();
                string f = dr["status"].ToString();
                Account p = new Account(a,b,c,int.Parse(d),f);
                list.Add(p);
            }
            if (list.Count == 0)
            {
                return false;
            }
            else return true;
        }
        public static string totalAccount()
        {
            string a = "";
            DataTable dataTable = sql.totalAccount();
            foreach (DataRow dr in dataTable.Rows)
            {
                 a = dr["total"].ToString();

            }
            return a;
        }
    }
}
