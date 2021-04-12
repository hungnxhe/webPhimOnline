using Quanly.DAL;
using Quanly.Model;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Quanly
{
    public partial class DangNhap : Form
    {
        public DangNhap()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void Login_Click(object sender, EventArgs e)
        {
            string user = textBox1.Text;
            string pass = textBox2.Text;
            if (user.Trim().Length == 0)
            {
                MessageBox.Show("User Name Không được để Trống");
            }
            else
            {
                if (pass.Trim().Length == 0)
                {
                    MessageBox.Show("User Name Không được để Trống");
                }
                else
                {
                    if (Account.login(user,pass)==true)
                    {
                        MessageBox.Show("Đăng Nhập Thành Công");
                        this.Hide();
                        var form2 = new QuanLyMenu();
                        form2.Closed += (s, args) => this.Close();
                        form2.Show();
                    }
                    else
                    {
                        MessageBox.Show("Đăng Nhập Thất Bại");
                    }
                }
            }
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
