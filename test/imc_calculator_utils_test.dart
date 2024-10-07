import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_imc_calculator/utils/imc_calculator.dart';
import 'package:flutter_imc_calculator/model/pessoa_model.dart';

void main() {
  test('Calcula o valor do IMC', () {
    Pessoa pessoa = Pessoa("", 50, 1.75);
    double imc = ImcCalculator.calcularIMC(pessoa);
    expect(imc, closeTo(16.33, 0.01));
  });

  test('Determina a categoria do IMC: Abaixo do peso', () {
    Pessoa pessoa = Pessoa("", 50, 1.75);
    double imc = ImcCalculator.calcularIMC(pessoa);
    String categoria = ImcCalculator.obterCategoriaIMC(imc);
    expect(categoria, 'Abaixo do peso');
  });

  group('Determina a categoria do IMC', () {
    var valuesToTest = {
      {'nome': "", 'peso': 50, 'altura': 1.75}: 'Abaixo do peso',
      {'nome': "", 'peso': 75, 'altura': 1.75}: 'Peso normal',
      {'nome': "", 'peso': 90, 'altura': 1.75}: 'Sobrepeso',
      {'nome': "", 'peso': 110, 'altura': 1.75}: 'Obesidade',
    };
    valuesToTest.forEach((values, expected) {
      test('Entrada: $values Esperado: $expected', () {
        expect(
          ImcCalculator.obterCategoriaIMC(
            ImcCalculator.calcularIMC(
              Pessoa(
                values["nome"] = "",
                double.parse(values["peso"].toString()),
                double.parse(values["altura"].toString()),
              ),
            ),
          ),
          equals(expected),
        );
      });
    });
  });
}
