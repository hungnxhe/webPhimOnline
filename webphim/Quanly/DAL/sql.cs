using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Quanly.DAL
{
    class sql
    {
        public static DataTable GetAll(string user,string pass)
        {
            string sql = "select * from Account where Username ='"+user+"' and pass='"+pass+"' and chucvu=1";
            return Database.GetDataBySQL(sql);
        }
        public static DataTable totalView()
        {
            string sql = "SELECT SUM(luotView) as total FROM Phim";
            return Database.GetDataBySQL(sql);
        }
        public static DataTable numberPhim()
        {
            string sql = "SELECT count(*) as total FROM Phim";
            return Database.GetDataBySQL(sql);
        }
        public static DataTable totalComment()
        {
            string sql = "SELECT count(*) as total FROM Comment";
            return Database.GetDataBySQL(sql);
        }
        public static DataTable totalAccount()
        {
            string sql = "SELECT count(*) as total FROM Account";
            return Database.GetDataBySQL(sql);
        }
        public static DataTable totalNew()
        {
            string sql = "SELECT count(*) as total FROM New";
            return Database.GetDataBySQL(sql);
        }
    }
}
