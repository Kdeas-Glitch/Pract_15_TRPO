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
            try
            {
                var input = (value ?? "").ToString().Trim();
                if (input != "")
                {
                    string[] strings = input.Split(' ');
                    if (strings.Length < 2)
                        return new ValidationResult(false, "Необходимо ввести два числа");

                    if (!float.TryParse(strings[0], out float floatValue) || !float.TryParse(strings[1], out float floatValue1))
                    {
                        return new ValidationResult(false, "Необходимо ввести числа");
                    }

                    if (Convert.ToDouble(strings[0]) > 0 && Convert.ToDouble(strings[1]) > 0)
                    {
                        if (Convert.ToDouble(strings[0]) < Convert.ToDouble(strings[1]))
                            return ValidationResult.ValidResult;
                        else
                            return new ValidationResult(false, "Цена 'от' должна быть больше чем 'до'");
                    }
                    else
                    {
                        return new ValidationResult(false, "Необходимо ввести числа Больше 0");
                    }
                }
                else
                {
                    return ValidationResult.ValidResult;
                }
            }
            catch
            {
                return new ValidationResult(false, "Необходимо ввести числа");
            }
        }
    }
}
