using Microsoft.IdentityModel.Tokens;
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
    /// Логика взаимодействия для ManagerPage.xaml
    /// </summary>
    public partial class ManagerPage : Page
    {
        public ProductService pc { get; set; } = new();
        public TagService ts { get; set; } = new();
        public ObservableCollection<Product> products { get; set; } = new();
        public ICollectionView productView { get; set; }
        public string searchQuery { get; set; } = null!;
        public string searchQueryBrand { get; set; } = null!;
        public string searchQueryCategory { get; set; } = null!;
        public string filterPriceFrom { get; set; } = null!;
        public string filterPriceTo { get; set; } = null!;
        public ManagerPage()
        {
            Window window = Application.Current.MainWindow;
            window.Title = "Каталог товаров Manager";
            productView = CollectionViewSource.GetDefaultView(products);
            productView.Filter = FilterForms;
            pc.GetAll();
            InitializeComponent();
            LoadList();
        }

        public void LoadList()
        {
            products.Clear();
            foreach (var form in pc.Products)
            {
                products.Add(form);
            }
        }
        public bool FilterForms(object obj)
        {
            try
            {
                /*if (!string.IsNullOrEmpty(filterPriceFrom) && !string.IsNullOrEmpty(filterPriceTo))
                {
                    if(Convert.ToInt32(filterPriceFrom) > Convert.ToInt32(filterPriceTo))
                    {
                        string temp = filterPriceFrom;
                        filterPriceFrom = filterPriceTo;
                        filterPriceTo = filterPriceFrom;

                    }

                }*/
                if (obj is not Product)
                    return false;
                var form = (Product)obj;
                if (searchQuery != null && !form.Name.Contains(searchQuery, StringComparison.CurrentCultureIgnoreCase))
                    return false;
                if (searchQueryBrand != null && !form.Brand.Name.ToString().IsNullOrEmpty()&&!form.Brand.Name.Contains(searchQueryBrand, StringComparison.CurrentCultureIgnoreCase))
                    return false;
                if (searchQueryCategory != null && form.Category!=null&& !form.Category.Name.Contains(searchQueryCategory, StringComparison.CurrentCultureIgnoreCase))
                    return false;
                if (!string.IsNullOrEmpty(filterPriceFrom) && Convert.ToInt32(filterPriceFrom) > form.Price)
                    return false;
                if (!string.IsNullOrEmpty(filterPriceTo) && Convert.ToInt32(filterPriceTo) < form.Price)
                    return false;
                return true;
            }
            catch(Exception ex)
            {
                return false;
            }
        }
        private void ComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            productView.SortDescriptions.Clear();
            var cb = (ComboBox)sender;
            var selected = (ComboBoxItem)cb.SelectedItem;
            switch (selected.Tag)
            {
                case "Name":
                    productView.SortDescriptions.Add(new SortDescription("Name", ListSortDirection.Ascending));
                    break;
                case "PriceDown":
                    productView.SortDescriptions.Add(new SortDescription("Price", ListSortDirection.Descending));
                    break;
                case "PriceUp":
                    productView.SortDescriptions.Add(new SortDescription("Price", ListSortDirection.Ascending));
                    break;
                case "CountDown":
                    productView.SortDescriptions.Add(new SortDescription("Stock", ListSortDirection.Descending));
                    break;
                case "CountUp":
                    productView.SortDescriptions.Add(new SortDescription("Stock", ListSortDirection.Ascending));
                    break;
                case "All":
                    productView.SortDescriptions.Clear();
                    break;
            }
            productView.Refresh();
        }

        private void TextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            productView.Refresh();
        }

        private void ProductControll(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new ProductPage());
        }

        private void CategoryControll(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new CategoryPage());
        }

        private void TagControll(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new TagPage());

        }

        private void BrandControll(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new BranchPage());
        }
    }
}
