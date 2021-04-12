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
    public partial class QuanLyPhim : Form
    {
        public QuanLyPhim()
        {
            InitializeComponent();
            this.ControlBox = false;
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            DialogResult dialogResult = MessageBox.Show("Are you Sure to Exit", "notice !!", MessageBoxButtons.YesNo);
            if (dialogResult == DialogResult.Yes)
            {
                this.Hide();
                var form2 = new QuanLyMenu();
                form2.Closed += (s, args) => this.Close();
                form2.Show();
            }
        }
    }
}
