using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace Pract_15_TRPO.ValidationRules
{
    class IsNumberValidMoreZero : ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            var input = (value ?? "").ToString().Trim();
            input = input.Replace('.', ',');
            if (!double.TryParse(input, out double floatValue))
            {
                return new ValidationResult(false, "Необходимо ввести число");
            }
            if (Convert.ToDouble(input) >= 0)
                return ValidationResult.ValidResult;
            else
            {
                return new ValidationResult(false, "Необходимо ввести число Больше 0");
            }
        }
    }
}
