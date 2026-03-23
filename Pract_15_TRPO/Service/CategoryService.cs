using Pract_15_TRPO.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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

        public void Remove(Category categor)
        {
            _db.Remove<Category>(categor);
            if (Commit() > 0)
                if (Categories.Contains(categor))
                    Categories.Remove(categor);
        }
    }
}
