using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using Quanly.Model;
namespace Quanly
{
    public partial class QuanLyMenu : Form
    {
        public QuanLyMenu()
        {
            InitializeComponent();
        }

        private void dataGridView2_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void QuanLyMenu_Load(object sender, EventArgs e)
        {
            textBox1.Text = Phim.totalView();
            textBox2.Text = Phim.numberphim();
            textBox4.Text = BinhLuan.totalComment();
            textBox5.Text = Account.totalAccount();
            textBox6.Text = TinTuc.totalNew();
        }
        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
            var form2 = new AddPhim();
            form2.Closed += (s, args) => this.Close();
            form2.Show();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            this.Hide();
            var form2 = new AddTap();
            form2.Closed += (s, args) => this.Close();
            form2.Show();

        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            var form2 = new BlockAccount();
            form2.Closed += (s, args) => this.Close();
            form2.Show();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            this.Hide();
            var form2 = new QuanLyPhim();
            form2.Closed += (s, args) => this.Close();
            form2.Show();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            this.Hide();
            var form2 = new QuanLyNew();
            form2.Closed += (s, args) => this.Close();
            form2.Show();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            this.Hide();
            var form2 = new QuanLyComment();
            form2.Closed += (s, args) => this.Close();
            form2.Show();
        }
    }
}
