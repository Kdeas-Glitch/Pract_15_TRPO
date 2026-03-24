using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace Pract_15_TRPO.ValidationRules
{
    public class IsNumberValidMoreThan0 : ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            var input = (value ?? "").ToString().Trim();
            if (!float.TryParse(input, out float floatValue))
            {
                return new ValidationResult(false, "Необходимо ввести число");
            }
            if(Convert.ToInt32(input)>0)
            return ValidationResult.ValidResult;
            else
            {
                return new ValidationResult(false, "Необходимо ввести число Больше 0");
            }
        }
    }
}
