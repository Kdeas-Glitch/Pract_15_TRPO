using Microsoft.EntityFrameworkCore.Query;
using Pract_12.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pract_15_TRPO.Models
{
    public class ProductTag : ObservableObject
    {

        public int _productId;

        public int ProductId {
            get => _productId;
            set => SetProperty(ref _productId, value);
        }

        public int _tagId;
        public int TagId {
            get => _tagId;
            set => SetProperty(ref _tagId, value);
        }

        public Product _product;
        public Product Product {
            get => _product;
            set => SetProperty(ref _product, value);
        }

        public Tag _tag;
        public Tag Tag
        {
            get => _tag;
            set => SetProperty(ref _tag, value);
        }
    }
}
