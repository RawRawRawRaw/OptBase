using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using ОптоваяБаза1.Model;
using Microsoft.EntityFrameworkCore;

namespace ОптоваяБаза1
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            //загружаем и отображаем инфу 
            LoadDBInDataGrid();
        }
        void LoadDBInDataGrid()
        {
            //созд короткоживущий контекст
            using (ОптоваяБазаContext _db = new ОптоваяБазаContext())
            {
                //получаем номер выделенной строки
                int selectedIndex = DG.SelectedIndex;
                //загружаем связанные таблицы
                _db.Поставщикиs.Load();
                _db.Товарыs.Load();
                //привязываем таблицу в датагрид
                DG.ItemsSource = _db.Базаs.ToList();

                DG.Focus();
            }
        }
        private void add_click(object sender, RoutedEventArgs e)
        {
            //добавление товара
            Data.база = null;
            AddEditWin f = new AddEditWin();
            f.Owner = this;
            f.ShowDialog();
            LoadDBInDataGrid();
        }

        private void edit_click(object sender, RoutedEventArgs e)
        {
            if (DG.SelectedItem != null)
            {
                Data.база = (База)DG.SelectedItem;
                AddEditWin f = new AddEditWin();
                f.Owner = this;
                f.ShowDialog();
                LoadDBInDataGrid();
            }
        }

        private void delete_click(object sender, RoutedEventArgs e)
        {
            MessageBoxResult result;
            result = MessageBox.Show("Удалить запись?", "Удаление записи",
                MessageBoxButton.YesNo, MessageBoxImage.Warning);
            if (result == MessageBoxResult.Yes)
            {
                //Получаем текущую запись
                База row = (База)DG.SelectedItem;
                if (row != null)
                {
                    using (ОптоваяБазаContext _db = new ОптоваяБазаContext())
                    {
                        //удаляем запись
                        _db.Базаs.Remove(row);
                        _db.SaveChanges();
                    }
                    LoadDBInDataGrid();
                }
            }
            else DG.Focus();
        }

        private void Poisk_TextChanged(object sender, TextChangedEventArgs e)
        {
            //реализация поиска по названию
            List<База> listItem = (List<База>)DG.ItemsSource;
            string searchText = Poisk.Text.ToLower();
            if (string.IsNullOrWhiteSpace(searchText))
            {
                //обновление таблицы в реальном времени
                LoadDBInDataGrid();
            }
            else
            {
                //поиск по названию
                var filteredUsers = listItem
                    .Where(u => u.КодТовараNavigation.Название != null 
                    && u.КодТовараNavigation.Название.ToLower().Contains(searchText)).ToList();
                DG.ItemsSource = filteredUsers;
            }
        }

        private void V1_click(object sender, RoutedEventArgs e)
        {
            View1 f = new View1();
            f.Owner = this;
            f.ShowDialog();
        }

        private void V2_click(object sender, RoutedEventArgs e)
        {
            View2 f = new View2();
            f.Owner = this;
            f.ShowDialog();
        }

        private void V3_click(object sender, RoutedEventArgs e)
        {
            View3 f = new View3();
            f.Owner = this;
            f.ShowDialog();
        }
    }
}