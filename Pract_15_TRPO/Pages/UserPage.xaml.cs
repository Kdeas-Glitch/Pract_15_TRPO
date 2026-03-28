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
using Pract_15_TRPO.Service;
using Pract_15_TRPO.ValidationRules;

namespace Pract_15_TRPO.Pages
{
    /// <summary>
    /// Логика взаимодействия для UserPage.xaml
    /// </summary>
    public partial class UserPage : Page
    {
        public ProductService pc { get; set; } = new();
        public TagService ts { get; set; } = new();
        public ObservableCollection<Product> products { get; set; } = new();
        public ICollectionView productView { get; set; }
        public string searchQuery { get; set; } = null!;
        public string searchQueryBrand { get; set; } = null!;
        public string searchQueryCategory { get; set; } = null!;
         public string filterPrice { get; set; } = "";
        public string filterPriceFrom { get; set; } = null!;
        public string filterPriceTo { get; set; } = null!;

        public UserPage()
        {
            Window window = Application.Current.MainWindow;
            window.Title = "Каталог товаров";
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
                for(int i=0;i<form.ProductTags.Count;i++)
                    form.ProductTags[i].Tag.Name = ts.Tags[form.ProductTags[i].TagId-1].Name;
                products.Add(form);
            }
        }
        public bool FilterForms(object obj)
        {
            try
            {
                if (filterPrice.Split(' ').Length > 1)
                {
                    filterPriceFrom = filterPrice.Split(' ')[0];
                    filterPriceTo = filterPrice.Split(' ')[1];
                }
                else
                {
                    filterPriceFrom = "";
                    filterPriceTo = "";
                }
                if (obj is not Product)
                    return false;
                var form = (Product)obj;
                if (searchQuery != null && !form.Name.Contains(searchQuery, StringComparison.CurrentCultureIgnoreCase))
                    return false;
                if (searchQueryBrand != null && !form.Brand.Name.Contains(searchQueryBrand, StringComparison.CurrentCultureIgnoreCase))
                    return false;
                if (searchQueryCategory != null && !form.Category.Name.Contains(searchQueryCategory, StringComparison.CurrentCultureIgnoreCase))
                    return false;
                if (!string.IsNullOrEmpty(filterPriceFrom) && Convert.ToInt32(filterPriceFrom) > form.Price)
                    return false;
                if (!string.IsNullOrEmpty(filterPriceTo) && Convert.ToInt32(filterPriceTo) < form.Price)
                    return false;
                return true;
            }
            catch
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

        private void TextBox_TextChanged1(object sender, TextChangedEventArgs e)
        {
            productView.Refresh();
        }
    }
}
