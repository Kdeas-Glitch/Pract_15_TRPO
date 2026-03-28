using Pract_15_TRPO.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace Pract_15_TRPO.Service
{
    public class CategoryService
    {
        private readonly DeminPract15Context _db = BaseDbService.Instance.Context;
        public ObservableCollection<Category> Categories { get; set; } = new();

        public CategoryService()
        {
            GetAll();
        }

        public void Add(Category cater)
        {
            var cat = new Category
            {
                Name = cater.Name,

            };
            _db.Add<Category>(cat);
            Commit();
            Categories.Add(cat);
        }
        public int Commit() => _db.SaveChanges();

        public void GetAll()
        {
            var products = _db.Categories
                .ToList();
            Categories.Clear();
            foreach (var prod in products)
            {
                Categories.Add(prod);
            }
        }
        ProductService ps = new();
        public void Remove(Category categor)
        {
           /* _db.Remove<Category>(categor);
            if (Commit() > 0)
                if (Categories.Contains(categor))
                    Categories.Remove(categor);*/

            if (categor.Products != null && categor.Products.Any())
            {
                categor.Products.ToList().ForEach(p => ps.Remove(p));
            }
            _db.Categories.Remove(categor);

            int rowsAffected = Commit();

            if (rowsAffected > 0)
            {

                if (Categories.Contains(categor))
                    Categories.Remove(categor);

            }
            else
            {
                MessageBox.Show("Не удалось удалить тег.", "Ошибка",
                    MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
