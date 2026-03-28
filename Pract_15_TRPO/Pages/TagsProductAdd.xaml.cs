using Pract_15_TRPO.Models;
using Pract_15_TRPO.Service;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
    /// Логика взаимодействия для TagsProductAdd.xaml
    /// </summary>
    public partial class TagsProductAdd : Page
    {
        public Product Product { get; set; }
        public ObservableCollection<Tag> Tags { get; set; }
        private TagService _tagService=new TagService();
        public Tag? SelectedTag { get; set; } = new();
        public ProductTag? SelectedProdTag { get; set; } = null;
        public ProductTag ProductTag { get; set; } = new();
        private ProductTagService _productTagService=new ProductTagService();
        public ObservableCollection<ProductTag> ProductTags { get; set; }

        public TagsProductAdd(Product product)
        {
            Window window = Application.Current.MainWindow;
            window.Title = "Страница Добавления Тега к Продукту";
            InitializeComponent();
            Product = product;
            Tags = _tagService.Tags;
            if (Product.ProductTags == null)
                Product.ProductTags = new();
            ProductTags = Product.ProductTags;
            SelectedTag = Tags[0];
            DataContext = this;
        }

        private void Add_Click(object sender, RoutedEventArgs e)
        {
            if(SelectedTag != null)
            {
                for(int i=0;i<ProductTags.Count;i++)
                {
                    if(ProductTags[i].Tag == SelectedTag)
                    {
                        MessageBox.Show("Выберите новый тэг");
                        return;
                    }
                }
                ProductTag.Tag = SelectedTag;
                ProductTag.TagId = SelectedTag.Id;
                ProductTag.Product = Product;
                ProductTag.ProductId = Product.Id;
                _productTagService.Add(ProductTag);
            }
            else
            {
                MessageBox.Show("Выберите тэг!");
            }

        }
        private void Back_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void Remove_Click(object sender, RoutedEventArgs e)
        {
            if (SelectedProdTag != null)
            {
                _productTagService.Remove(SelectedProdTag);
            }
            else
            {
                MessageBox.Show("Выберите тэг!");
            }
        }
    }
}
