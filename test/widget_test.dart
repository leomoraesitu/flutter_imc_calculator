import 'package:flutter/material.dart';
import 'package:flutter_imc_calculator/screens/input_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Teste da tela de entrada e cálculo de IMC', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const InputScreen());

    // Verifica se os campos de texto e o botão estão presentes.
    expect(find.byType(TextField), findsNWidgets(3));
    expect(find.text('Informe seu nome'), findsOneWidget);
    expect(find.text('Informe seu peso (kg)'), findsOneWidget);
    expect(find.text('Informe sua altura (cm)'), findsOneWidget);
    expect(find.text('Calcular IMC'), findsOneWidget);

    // Simula a entrada do usuário.
    await tester.enterText(find.byType(TextField).at(0), 'John Doe');
    await tester.enterText(find.byType(TextField).at(1), '70');
    await tester.enterText(find.byType(TextField).at(2), '1.75');

    // Toca no botão de calcular.
    await tester.tap(find.text('Calcular IMC'));
    await tester.pump(); // Aguarda o próximo frame.

    // Aguarda a abertura do diálogo
    await tester.pumpAndSettle();

    // Verifica se o diálogo é exibido com os valores corretos.
    expect(find.textContaining('Nome: John Doe'), findsOneWidget);
    expect(find.textContaining('IMC: 22.86'), findsOneWidget);
    expect(find.textContaining('Categoria: Peso normal'), findsOneWidget);
  });


  testWidgets('Teste de erro quando peso é 0', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const InputScreen());

    // Simula a entrada do usuário com peso 0.
    await tester.enterText(find.byType(TextField).at(0), 'John Doe');
    await tester.enterText(find.byType(TextField).at(1), '0');
    await tester.enterText(find.byType(TextField).at(2), '175');

    // Toca no botão de calcular.
    await tester.tap(find.text('Calcular IMC'));
    await tester.pumpAndSettle(); // Aguarda até que todas as animações sejam concluídas.

    // Verifica se o diálogo de erro é exibido com a mensagem correta.
    expect(find.textContaining('O peso deve ser maior que zero'), findsOneWidget);
  });

  testWidgets('Teste de erro quando altura é 0', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const InputScreen());

    // Simula a entrada do usuário com altura 0.
    await tester.enterText(find.byType(TextField).at(0), 'John Doe');
    await tester.enterText(find.byType(TextField).at(1), '70');
    await tester.enterText(find.byType(TextField).at(2), '0');

    // Toca no botão de calcular.
    await tester.tap(find.text('Calcular IMC'));
    await tester.pumpAndSettle(); // Aguarda até que todas as animações sejam concluídas.

    // Verifica se o diálogo de erro é exibido com a mensagem correta.
    expect(find.textContaining('A altura deve ser maior que zero'), findsOneWidget);
  });
}

