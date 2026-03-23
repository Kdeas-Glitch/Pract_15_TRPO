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
    /// Логика взаимодействия для TagPage.xaml
    /// </summary>
    public partial class TagPage : Page
    {
        public CategoryService cc { get; set; } = new();
        public Tag? choseedpr { get; set; } = null;
        public TagService ts { get; set; } = new();
        public ObservableCollection<Tag> tags { get; set; } = new();
        public ICollectionView tagsView { get; set; }
        public string searchQuery { get; set; } = null!;
        public TagPage()
        {
            Window window = Application.Current.MainWindow;
            window.Title = "Управление Тегами";
            tagsView = CollectionViewSource.GetDefaultView(tags);
            tagsView.Filter = FilterForms;
            InitializeComponent();
            LoadList();
        }
        public void LoadList()
        {
            tags.Clear();
            foreach (var form in ts.Tags)
            {
                tags.Add(form);
            }
        }

        public bool FilterForms(object obj)
        {
            try
            {
                if (obj is not Models.Tag)
                    return false;
                var form = (Tag)obj;
                if (searchQuery != null && !form.Name.Contains(searchQuery, StringComparison.CurrentCultureIgnoreCase))
                    return false;
                return true;
            }
            catch
            {
                return false;
            }
        }
        private void Back(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack(); 
        }

        private void addTag(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new TegAddEditPage(null));
        }

        private void ChangeTag(object sender, RoutedEventArgs e)
        {
            if(choseedpr!=null)
            NavigationService.Navigate(new TegAddEditPage(choseedpr));
            else
            {
                MessageBox.Show("Выберите Тег");
            }

        }

        private void deleteTag(object sender, RoutedEventArgs e)
        {
            if (choseedpr != null)
            {
                MessageBoxResult res = MessageBox.Show("Вы действительно хотите удалить этот Тэг?",
                            "Подтверждение удаления",
                            MessageBoxButton.YesNo,
                            MessageBoxImage.Question);
                if (res == MessageBoxResult.Yes)
                {
                    ts.Remove(choseedpr);
                    tags.Remove(choseedpr);
                }
            }
            else
                MessageBox.Show("Выберите Тег");
        }

        private void TextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            tagsView.Refresh();
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            ts.GetAll();
            LoadList();
        }
    }
}
