using Pract_15_TRPO.Models;

using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace Pract_15_TRPO.ValidationRules
{
    public class IsNumberValidMoreThanLower : ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            var input = (value ?? "").ToString().Trim();
            if (!float.TryParse(input, out float floatValue))
            {
                return new ValidationResult(false, "Необходимо ввести число");
            }
            if (Convert.ToInt32(input) > 0)
            {
                FilterPrice.priceHigh= Convert.ToInt32(input);
                if(FilterPrice.priceHigh>FilterPrice.pricelow)
                return ValidationResult.ValidResult;
                else
                    return new ValidationResult(false, "Цена должна быть больше чем 'от'");
            }
            else
            {
                return new ValidationResult(false, "Необходимо ввести число Больше 0");
            }
        }
    }
}
