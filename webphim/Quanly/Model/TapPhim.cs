using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Quanly.Model
{
    class TapPhim
    {
        private int tap;
        private string idp;
        private string link;

        public TapPhim(int tap, string idp, string link)
        {
            this.tap = tap;
            this.idp = idp;
            this.link = link;
        }
        public TapPhim()
        {
        }
        public int Tap { get => tap; set => tap = value; }
        public string Idp { get => idp; set => idp = value; }
        public string Link { get => link; set => link = value; }
    }
}
