using Microsoft.EntityFrameworkCore;
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
    public  class ProductService
    {
        private readonly DeminPract15Context _db = BaseDbService.Instance.Context;
        public ObservableCollection<Product> Products { get; set; } = new();
        public ProductService()
        {
            GetAll();
        }
        public void Add(Product productes)
        {
            var prod = new Product
            {
                Name = productes.Name,
                Brand = productes.Brand,
                BrandId = productes.BrandId,
                Category = productes.Category,
                CategoryId = productes.CategoryId,
                CreatedAt = productes.CreatedAt,
                Description = productes.Description,
                Price = productes.Price,
                Rating = productes.Rating,
                Stock = productes.Stock,

            };
            _db.Add<Product>(prod);
            Commit();
            Products.Add(prod);
        }
        public int Commit() => _db.SaveChanges();

        public void GetAll()
        {
            var products = _db.Products
                .Include(s => s.ProductTags)
                .Include(s => s.Brand)
                .Include(s => s.Category)
                .ToList();
            Products.Clear();
            foreach (var prod in products)
            {
                Products.Add(prod);
            }
        }

        //public void Remove(Product product)
        //{
        //    _db.Remove<Product>(product);
        //    if (Commit() > 0)
        //        if (Products.Contains(product))
        //            Products.Remove(product);
        //}
        public void Remove(Product product)
        {
            try
            {
                var productTags = _db.ProductTags.Where(pt => pt.ProductId == product.Id).ToList();

                if (productTags.Any())
                {
                    _db.ProductTags.RemoveRange(productTags);
                }

                _db.Products.Remove(product);

                if (Commit() > 0)
                {
                    if (Products.Contains(product))
                        Products.Remove(product);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка при удалении: {ex.Message}", "Ошибка",
                    MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
