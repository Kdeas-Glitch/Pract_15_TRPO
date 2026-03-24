using Pract_15_TRPO.Models;
using Pract_15_TRPO.Service;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;

namespace Pract_15_TRPO.Converters
{
    public class ProductTagsToStringConverter : IValueConverter
    {
        public TagService ts { get; set; } = new();
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value is ICollection<ProductTag> productTags && productTags.Any())
            {

                var tags = productTags.Select(pt => ts.Tags.FirstOrDefault(t => t.Id == pt.TagId)?.Name ?? "")
                    .Where(t=>!string.IsNullOrEmpty(t));
                string result = tags.Any() ? "#" + string.Join(" #", tags):"";
                return result;

            }
            return string.Empty;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }

    }
}
