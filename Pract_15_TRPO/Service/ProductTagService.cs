using Microsoft.EntityFrameworkCore;
using Pract_15_TRPO.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pract_15_TRPO.Service
{
    public class ProductTagService
    {
        private readonly DeminPract15Context _db = BaseDbService.Instance.Context;
        public ObservableCollection<ProductTag> ProductTags { get; set; } = new();
        public int Commit() => _db.SaveChanges();
        public ProductTagService() {
            GetAll();
            }
        public void Add(ProductTag prodTag)
        {
            var _producttag = new ProductTag
            {
                ProductId = prodTag.ProductId,
                Product = prodTag.Product,
                TagId = prodTag.TagId,
                Tag = prodTag.Tag,
                

            };
            _db.Add(_producttag);
            _db.SaveChanges();
        }
        public void GetAll()
        {
            var interestGroups = _db.ProductTags
                                        .Include(i => i.Tag)
                                        .Include(ui => ui.Product)
                                        .ToList();
            ProductTags.Clear();
            foreach (var interestGroup in interestGroups)
            {
                ProductTags.Add(interestGroup);
            }
        }

        public void Remove(ProductTag prodTag)
        {
            _db.Remove<ProductTag>(prodTag);
            if (Commit() > 0)
            {
                if(ProductTags.Contains(prodTag))
                    ProductTags.Remove(prodTag);
            }
        }
    }
}
