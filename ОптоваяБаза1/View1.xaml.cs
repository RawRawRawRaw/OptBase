using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using ОптоваяБаза1.Model;
using Microsoft.EntityFrameworkCore;
namespace ОптоваяБаза1
{
    /// <summary>
    /// Логика взаимодействия для View1.xaml
    /// </summary>
    public partial class View1 : Window
    {
        public View1()
        {
            InitializeComponent();
        }
        ОптоваяБазаContext _db = new ОптоваяБазаContext();
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {


            DGP.ItemsSource = _db.View1s.ToList();
        }
    }
}
