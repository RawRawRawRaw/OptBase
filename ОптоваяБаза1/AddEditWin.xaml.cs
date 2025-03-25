using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.ConstrainedExecution;
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
    
    public static class Data
    {
        public static База база;
    }
    public partial class AddEditWin : Window
    {
        public AddEditWin()
        {
            InitializeComponent();
        }

        ОптоваяБазаContext _db = new ОптоваяБазаContext();
        База _база;

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            //загружаем в списки таблицы для выбора
            Kl.Text = _db.Базаs.ToList().ToString();
            kod.Text = _db.Базаs.ToList().ToString();
            Nomer.Text = _db.Базаs.ToList().ToString();
            if (Data.база == null)
            {
                //создать новую запись
                _база = new База();
            }
            else
            {
                _база = _db.Базаs.Find(Data.база.Ключ);
            }
            WindowAddEdit.DataContext = _база;
        }

        private void AddEdit_click(object sender, RoutedEventArgs e)
        {
            StringBuilder error = new StringBuilder();
            if (kod.Text.Length == 0 || Nomer.Text.Length == 0 || Kl.Text.Length == 0)
            {
                error.Append("Вбейте все данные");
                
            }
            if (error.Length > 0)
            {
                MessageBox.Show(error.ToString());
                return;
            }
            try
            {
                if (Data.база == null)
                {
                    //добавляем в бд
                    _db.Базаs.Add(_база);
                    //сохраняем изменения
                    _db.SaveChanges();

                }
                else
                {
                    _db.SaveChanges();
                }
                this.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }

        }

        private void esc_click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
