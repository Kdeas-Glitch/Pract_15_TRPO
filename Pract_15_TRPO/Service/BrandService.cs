using Azure;

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
    public class BrandService
    {
        private readonly DeminPract15Context _db = BaseDbService.Instance.Context;
        public ObservableCollection<Brand> Brands { get; set; } = new();
        public BrandService()
        {
            GetAll();
        }

        public void Add(Brand brand)
        {
            var bran = new Brand
            {
                Name = brand.Name,

            };
            _db.Add<Brand>(bran);
            Commit();
            Brands.Add(bran);
        }

        public int Commit() => _db.SaveChanges();

        public void GetAll()
        {
            var products = _db.Brands
                .ToList();
            Brands.Clear();
            foreach (var prod in products)
            {
                Brands.Add(prod);
            }
        }
        ProductService ps = new();
        public void Remove(Brand brand)
        {
            if (brand.Products != null && brand.Products.Any())
            {
                for(int i = 0; i < brand.Products.Count; i++)
                {
                    ps.Remove(brand.Products[i]);
                }
            }
            _db.Brands.Remove(brand);

            int rowsAffected = Commit();

            if (rowsAffected > 0)
            {

                if (Brands.Contains(brand))
                    Brands.Remove(brand);

            }
            else
            {
                MessageBox.Show("Не удалось удалить тег.", "Ошибка",
                    MessageBoxButton.OK, MessageBoxImage.Error);
            }
            //_db.Remove<Brand>(brand);
            //if (Commit() > 0)
            //    if (Brands.Contains(brand))
            //        Brands.Remove(brand);
        }
    }
}
