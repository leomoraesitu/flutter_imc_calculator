import 'package:flutter_imc_calculator/model/pessoa_model.dart';

class ImcCalculator {
  ImcCalculator(Pessoa pessoa);

  static double calcularIMC(Pessoa pessoa) {
    if (pessoa.getPeso() <= 0) {
      throw ArgumentError('O peso deve ser maior que zero');
    } else if (pessoa.getAltura() <= 0) {
      throw ArgumentError('A altura deve ser maior que zero');
    }
    return pessoa.getPeso() / (pessoa.getAltura() * pessoa.getAltura());
  }

  static String obterCategoriaIMC(double imc) {
    if (imc < 18.5) {
      return 'Abaixo do peso';
    } else if (imc >= 18.5 && imc < 24.9) {
      return 'Peso normal';
    } else if (imc >= 25 && imc < 29.9) {
      return 'Sobrepeso';
    } else {
      return 'Obesidade';
    }
  }
}
