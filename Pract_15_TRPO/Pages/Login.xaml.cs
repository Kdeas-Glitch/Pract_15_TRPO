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
    /// Логика взаимодействия для Login.xaml
    /// </summary>
    public partial class Login : Page
    {
        public Login()
        {
            Window window = Application.Current.MainWindow;
            window.Title = "Логин";
            InitializeComponent();
        }

        private void Enter(object sender, RoutedEventArgs e)
        {
            if (password.Text == "1234")
            {
                NavigationService.Navigate(new ManagerPage());
            }
            else
            {
                MessageBox.Show("Неверный пароль");
            }
        }

        private void EnterLikePocet(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new UserPage());

        }
    }
}
