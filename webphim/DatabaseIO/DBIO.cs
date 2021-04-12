using DatabaseProvide;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DatabaseIO
{
    public class DBIO
    {
        Model1 mydb = new Model1();
        Model2 mydb2 = new Model2();
        Model3 mydb3 = new Model3();
        Model4 mydb4 = new Model4();
        Model5 mydb5 = new Model5();
        Model6 mydb6 = new Model6();

        //manager account 
        public Account getData(string name,string pass)
        {
            string sql = "select * from Account where username='"+name+"' and pass='"+pass+"'";
            return mydb.Database.SqlQuery<Account>(sql).FirstOrDefault();
        }
        public Account getDatahaveUserName(string name)
        {
            string sql = "select * from Account where username='"+name+"'";
            return mydb.Database.SqlQuery<Account>(sql).FirstOrDefault();
        }
        public List<Account> getAllAccounts()
        {
            string sql = "select * from Account";
            return mydb.Database.SqlQuery<Account>(sql).ToList();
        }
        public void Lock(string status,string idac)
        {
            string sql = "UPDATE Account SET status = '"+status+"' WHERE IDAC = '"+idac+"'";
                mydb.Database.ExecuteSqlCommand(sql);
        }
        public void Changepass(string username, string newpass)
        {
            string sql = "update Account set Pass='"+newpass+"' where Username='"+username+"'";
            mydb.Database.ExecuteSqlCommand(sql);
        }
        public void register(string idac, string user, string pass,string code)
        {
            string sql = "insert into Account(IDAC,Username,pass,ChucVu,status,code,active) values ('" + idac + "','" + user + "','" + pass + "','2','on','"+code+"','unactive')";
            mydb.Database.ExecuteSqlCommand(sql);
        }
        public Account checkaccount(string user)
        {
            string sql = "select * from Account where username='" + user + "'";
            return mydb.Database.SqlQuery<Account>(sql).FirstOrDefault();
        }
        public void activeAccount(string code)
        {
            string sql = "update Account set active='active' where code like'"+ code + "'";
            mydb.Database.ExecuteSqlCommand(sql);
        }


        //get phim data
        public void UpdateView(string idp)
        {
            string sql = "update Phim set luotView= luotView+1 where IDP ='"+idp+"'";
            mydb2.Database.ExecuteSqlCommand(sql);
        }
        public List<Phim> getAllFilm()
        {
            string sql = "select * from Phim order by timePost DESC";
            return mydb2.Database.SqlQuery<Phim>(sql).ToList();
        }
        public Phim getFilm(string id)
        {
            string sql = "select * from Phim where IDP='"+id+"'";
            return mydb2.Database.SqlQuery<Phim>(sql).FirstOrDefault();
        }
        public List<cacTap> getvideo(string id)
        {
            string sql = "select * from cacTap where IDP = '"+id+"'";
            return mydb3.Database.SqlQuery<cacTap>(sql).ToList();
        }
        public cacTap gettap(string id,string tap)
        {
            string sql = "select * from cacTap where IDP ='"+id+"' and tap="+tap+"";
            return mydb3.Database.SqlQuery<cacTap>(sql).FirstOrDefault();
        }
        public List<Phim> ListSearch(string tenphim)
        {
            string sql = "select * from Phim where TenPhim like '%"+tenphim+"%'";
            return mydb2.Database.SqlQuery<Phim>(sql).ToList();
        }
        public List<Phim> ListTheLoai(string theloai)
        {
            string sql = "select * from Phim where TheLoai like '" + theloai + "'";
            return mydb2.Database.SqlQuery<Phim>(sql).ToList();
        }
        public List<Phim> ListByActor(string actor)
        {
            string sql = "select * from Phim where dienvien like '" + actor + "'";
            return mydb2.Database.SqlQuery<Phim>(sql).ToList();
        }
        public List<Phim> ListTopView()
        {
            string sql = "select top(7)* from Phim order by luotView DESC";
            return mydb2.Database.SqlQuery<Phim>(sql).ToList();
        }



        // manager ua thich
        public List<Uathich> uathich(string idac)
        {
            string sql = "Select * from Uathich where IDAC = '"+idac+"'";
            return mydb4.Database.SqlQuery<Uathich>(sql).ToList();
        }
        public Uathich checkexistfavo (string idac,string idp)
        {
            string sql = "Select * from Uathich where IDAC = '" + idac + "' and IDP = '" + idp + "'";
            return mydb4.Database.SqlQuery<Uathich>(sql).FirstOrDefault();
        }
        public bool Addfavo(string idac,string idp)
        {
            Uathich a = new Uathich();
            string sql = "Select * from Uathich where IDAC = '" + idac + "' and IDP = '"+idp+"'";
            mydb4.Database.SqlQuery<Uathich>(sql).ToList();
            a = mydb4.Database.SqlQuery<Uathich>(sql).FirstOrDefault();
            if (a == null)
            {
                mydb4.Database.ExecuteSqlCommand("insert into Uathich(IDP,IDAC) values('"+idp+"','"+idac+"')");
                return true;
            }
            else
            {
                return false;
            } 
        }
        public bool Deletefavo(string idac, string idp)
        {
            Uathich a = new Uathich();
            string sql = "Select * from Uathich where IDAC = '" + idac + "' and IDP = '" + idp + "'";
            mydb4.Database.SqlQuery<Uathich>(sql).ToList();
            a = mydb4.Database.SqlQuery<Uathich>(sql).FirstOrDefault();
            if (a != null)
            {
                mydb4.Database.ExecuteSqlCommand("DELETE FROM Uathich WHERE IDAC='"+idac+"'and IDP='"+idp+"'");
                return true;
            }
            else
            {
                return false;
            }
        }
        public int countfavo(string idp)
        {
            string sql = "Select * from Uathich where IDP = '" + idp + "'";
            List<Uathich>list= mydb4.Database.SqlQuery<Uathich>(sql).ToList();
            int count;
            if (list == null)
            {
                count = 0;
            }
            else
            {
                count = list.Count;
            }
            return count;
        }




        //manager comment
        public List<Comment> loadcomment(string idp)
        {
            string sql = "select * from Comment where IDP ='"+idp+"'";
           // string sql1 = "select a.Username,c.IDP,a.IDAC,c.BinhLuan from Comment c,Account a where a.IDAC=c.IDAC and c.IDP='"+idp+"'";
            return mydb5.Database.SqlQuery<Comment>(sql).ToList();
        }
        public List<Comment> getAllComments()
        {
            string sql = "select * from Comment";
            return mydb5.Database.SqlQuery<Comment>(sql).ToList();
        }
        public void addcomment(string idp,string idac,string txt,string username)
        {
            string sql = "insert into Comment (IDP,IDAC,BinhLuan,name) values('"+idp+"','"+idac+"','"+txt+"','"+username+"')";
            mydb5.Database.ExecuteSqlCommand(sql);
        }
        public void removeComment(string binhluan,string idp)
        {
            string sql = "delete from Comment where binhluan like '"+binhluan+"' and IDP='"+idp+"'";
            mydb5.Database.ExecuteSqlCommand(sql);
        }
        public int countComment(string idp)
        {
            string sql = "Select * from Comment where IDP = '" + idp + "'";
            List<Comment> list = mydb5.Database.SqlQuery<Comment>(sql).ToList();
            int count;
            if (list == null)
            {
                count = 0;
            }
            else
            {
                count = list.Count;
            }
            return count;
        }




        // manager phim
        public void addPhim(string idphim,string tenphim,string theloai,string poster,string dienvien,string time,string anhmota,string mota,string trailer,string imageactor,string imdb)
        {
            string sql = "insert into Phim values('" + idphim + "','" + tenphim + "','" + theloai + "','" + poster + "','" + anhmota + "','" + dienvien + "','" + time + "','" + mota + "','" + trailer + "',0,'"+imdb+"','" + imageactor + "')";
            mydb.Database.ExecuteSqlCommand(sql);
        }
        public  void addTap(string idp,int tap ,string link)
        {
            string sql = "insert into cacTap  values("+tap+",'"+idp+"','"+link+"')";
            mydb3.Database.ExecuteSqlCommand(sql);
        }
        public void deletePhim(string idp)
        {
            string sql = "delete from Comment where IDP like '"+idp+"' " +
                "delete from cacTap where IDP like '" + idp + "' " +
                "delete from Uathich where IDP like '" + idp + "' " +
                "delete from phim where IDP like '" + idp + "'";
            mydb.Database.ExecuteSqlCommand(sql);
        }
        public void updatephim(string idphim, string tenphim, string theloai, string poster, string dienvien, string time, string anhmota, string mota, string trailer, string imageactor)
        {
            string sql = "UPDATE Phim SET TenPhim = @tenphim , TheLoai = @theloai , Poster= @poster ,[Image]= @anhmota ,DienVien= @dienvien ,Anhdienvien= @imageactor ,timePost= @time ,MoTa= @mota ,Trailer= @trailer WHERE IDP= @idphim ";
            SqlParameter[] par = new SqlParameter[] {
                new SqlParameter("@tenphim",SqlDbType.Text),
                new SqlParameter("@theloai",SqlDbType.Text),
                new SqlParameter("@poster",SqlDbType.Text),
                new SqlParameter("@anhmota",SqlDbType.Text),
                new SqlParameter("@dienvien",SqlDbType.NVarChar),
                new SqlParameter("@imageactor",SqlDbType.Text),
                new SqlParameter("@time",SqlDbType.Date),
                new SqlParameter("@mota",SqlDbType.Text),
                new SqlParameter("@trailer",SqlDbType.Text),
                new SqlParameter("@idphim",SqlDbType.NVarChar)
            };
            par[0].Value = tenphim;
            par[1].Value = theloai;
            par[2].Value = poster;
            par[3].Value = anhmota;
            par[4].Value = dienvien;
            par[5].Value = imageactor;
            par[6].Value = time;
            par[7].Value = mota;
            par[8].Value = trailer;
            par[9].Value = idphim;
            mydb.Database.ExecuteSqlCommand(sql,par);
        }

        public void deleteTap(string tap, string idp)
        {
            string sql = "delete from cacTap where IDP=@idp and tap=@tap ";
            SqlParameter[] par = new SqlParameter[] {
                new SqlParameter("@tap",SqlDbType.NVarChar),
                new SqlParameter("@idp",SqlDbType.NVarChar) };
            par[0].Value = tap;
            par[1].Value = idp;
            mydb3.Database.ExecuteSqlCommand(sql,par);
        }
        //manager New
        public List<New> loadNew()
        {
            string sql = "select * from New";
            return mydb6.Database.SqlQuery<New>(sql).ToList();
        }
        public void addNew(string title ,string content ,  string link)
        {
            string sql = "insert into New values ('"+link+"','"+content+"','"+title+"')";
            mydb6.Database.ExecuteSqlCommand(sql);
        }


    }
}
