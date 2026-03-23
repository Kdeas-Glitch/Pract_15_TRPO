using Pract_15_TRPO.Models;
using Pract_15_TRPO.Service;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Pract_15_TRPO.Pages
{
    /// <summary>
    /// Логика взаимодействия для BranchPage.xaml
    /// </summary>
    public partial class BranchPage : Page
    {
        public BrandService cc { get; set; } = new();
        public Brand? choseedpr { get; set; } = null;
        public TagService ts { get; set; } = new();
        public ObservableCollection<Brand> brands { get; set; } = new();
        public ICollectionView brandView { get; set; }
        public string searchQuery { get; set; } = null!;
        public BranchPage()
        {
            Window window = Application.Current.MainWindow;
            window.Title = "Страница Бренда";
            brandView = CollectionViewSource.GetDefaultView(brands);
            brandView.Filter = FilterForms;
            InitializeComponent();
        }

        private void addCategory(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new BrandAddEditPage(null));
        }

        public void LoadList()
        {
            brands.Clear();
            foreach (var form in cc.Brands)
            {
                brands.Add(form);
            }
        }

        public bool FilterForms(object obj)
        {
            try
            {
                if (obj is not Brand)
                    return false;
                var form = (Brand)obj;
                if (searchQuery != null && !form.Name.Contains(searchQuery, StringComparison.CurrentCultureIgnoreCase))
                    return false;
                return true;
            }
            catch
            {
                return false;
            }
        }

        private void Button_Loaded(object sender, RoutedEventArgs e)
        {

        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            cc.GetAll();
            LoadList();
        }

        private void Changebrand(object sender, RoutedEventArgs e)
        {
            if (choseedpr != null)
                NavigationService.Navigate(new BrandAddEditPage(choseedpr));
            else
                MessageBox.Show("Выберите Бренд");
        }

        private void deletebrand(object sender, RoutedEventArgs e)
        {
            if (choseedpr != null)
            {
                MessageBoxResult res = MessageBox.Show("Вы действительно хотите удалить этот бренд?",
                            "Подтверждение удаления",
                            MessageBoxButton.YesNo,
                            MessageBoxImage.Question);
                if (res == MessageBoxResult.Yes)
                {
                    cc.Remove(choseedpr);
                    brands.Remove(choseedpr);
                }
            }
            else
                MessageBox.Show("Выберите Бренд");
        }

        private void Back(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void TextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            brandView.Refresh();
        }
    }
}
