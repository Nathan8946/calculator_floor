const kRequiredField = 'Campo obrigatório';
const kNonNegative = 'Campo deve conter valores positivos';
const kNonzero = 'Campo deve ser diferente de ZERO';

class ValidatorHelper {
  static String isNotEmpityNumber(String text) {
    if (text.isEmpty)
    {
      return kRequiredField;
    } else 
    {
      double value = double.parse(text);
      if (value == 0 ) 
      {
        return kNonzero;
      } else if (value <0) 
      {
        return kNonNegative;
      }
    }
    return null;
  }
}