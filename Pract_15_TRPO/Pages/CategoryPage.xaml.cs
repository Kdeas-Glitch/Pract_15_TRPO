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
    /// Логика взаимодействия для CategoryPage.xaml
    /// </summary>
    public partial class CategoryPage : Page
    {
        public CategoryService cc { get; set; } = new();
        public Category? choseedpr { get; set; } = null;
        public TagService ts { get; set; } = new();
        public ObservableCollection<Category> categories { get; set; } = new();
        public ICollectionView categoryView { get; set; }
        public string searchQuery { get; set; } = null!;
        public CategoryPage()
        {
            Window window = Application.Current.MainWindow;
            window.Title = "Страница Категорий";
            categoryView = CollectionViewSource.GetDefaultView(categories);
            categoryView.Filter = FilterForms;
            cc.GetAll();
            InitializeComponent();
            LoadList();
        }
        public void LoadList()
        {
            categories.Clear();
            foreach (var form in cc.Categories)
            {
                categories.Add(form);
            }
        }
        public bool FilterForms(object obj)
        {
            try
            {
                if (obj is not Category)
                    return false;
                var form = (Category)obj;
                if (searchQuery != null && !form.Name.Contains(searchQuery, StringComparison.CurrentCultureIgnoreCase))
                    return false;
                return true;
            }
            catch
            {
                return false;
            }
        }
        private void addCategory(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new CategoryAddEdit(null));
        }

        private void ChangeCategory(object sender, RoutedEventArgs e)
        {
            if(choseedpr!=null)
            NavigationService.Navigate(new CategoryAddEdit(choseedpr));
            else
            {
                MessageBox.Show("Выберите Категорию");
            }
        }

        private void deleteCategory(object sender, RoutedEventArgs e)
        {
            if (choseedpr != null)
            {
                MessageBoxResult res = MessageBox.Show("Вы действительно хотите удалить эту Категорю?",
                            "Подтверждение удаления",
                            MessageBoxButton.YesNo,
                            MessageBoxImage.Question);
                if (res == MessageBoxResult.Yes)
                {
                    cc.Remove(choseedpr);
                    categories.Remove(choseedpr);
                }
            }
            else
                MessageBox.Show("Выберите категорию");
        }

        private void TextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            categoryView.Refresh();
        }

        private void Load(object sender, RoutedEventArgs e)
        {
            cc.GetAll();
            LoadList();
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            cc.GetAll();
            LoadList();
        }

        private void Back(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
