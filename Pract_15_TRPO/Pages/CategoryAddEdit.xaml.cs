using Pract_15_TRPO.Models;
using Pract_15_TRPO.Service;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Pract_15_TRPO.Pages
{
    /// <summary>
    /// Логика взаимодействия для CategoryAddEdit.xaml
    /// </summary>
    public partial class CategoryAddEdit : Page
    {
        public BrandService bs { get; set; } = new();
        public CategoryService cs { get; set; } = new();
        public ProductService ps { get; set; } = new();
        public TagService ts { get; set; } = new();
        public Category currentcategory { get; set; } = new Category();
        public bool isEdit = false;
        public CategoryAddEdit(Category? category)
        {
            if (category != null)
            {
                isEdit = true;
                currentcategory = category;
            }
            InitializeComponent();
            DataContext = currentcategory;
            Window window = Application.Current.MainWindow;
            window.Title = "Страница добавления/изменения категории";
        }

        private void Save(object sender, RoutedEventArgs e)
        {
            if (isEdit)
            {
                cs.Commit();
            }
            else
            {
                cs.Add(currentcategory);
            }
            NavigationService.GoBack();
        }

        private void Back(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
