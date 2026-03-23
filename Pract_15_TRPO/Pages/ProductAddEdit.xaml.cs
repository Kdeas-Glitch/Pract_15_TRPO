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
    /// Логика взаимодействия для ProductAddEdit.xaml
    /// </summary>
    public partial class ProductAddEdit : Page
    {
        public BrandService bs { get; set; } = new();
        public CategoryService cs { get; set; } = new();
        public ProductService ps { get; set; } = new();
        public TagService ts { get; set; } = new();
        public Product currentproduct { get; set; }=new Product();
        public bool isEdit = false;
        public ProductAddEdit(Product product)
        {
            Window window = Application.Current.MainWindow;
            window.Title = "Добавление редактирование товара";
            if (product != null)
            {
                isEdit = true;
                currentproduct = product;

                //if (product.ProductTags.Count < 3)
                //{
                //    for(int i= product.ProductTags.Count-1; i < 3; i++)
                //    {

                //        product.ProductTags.Add();
                //    }
                //}
            }
            InitializeComponent();
            Brand.ItemsSource = bs.Brands.ToList();
            Brand.SelectedIndex = 0;
            Categories.ItemsSource = cs.Categories;
            Categories.SelectedIndex = 0;
            DataContext = currentproduct;
        }

        private void back(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void Save(object sender, RoutedEventArgs e)
        {

            if (isEdit)
            {
                ps.Commit();
            }
            else
            {
                ps.Add(currentproduct);
            }
                NavigationService.GoBack();
        }

        private void Tegs(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new TagsProductAdd(currentproduct));
        }
    }
}
