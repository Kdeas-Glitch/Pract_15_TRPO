using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace Pract_15_TRPO.ValidationRules
{
    public class IsNumberValid : ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            try
            {
                var input = (value ?? "").ToString().Trim();
                Convert.ToDouble(input.Replace('.',','));
                return ValidationResult.ValidResult;
            }
            catch
            {
                return new ValidationResult(false, $"Необходимо ввести число 1");
            }
        }
    }
}
