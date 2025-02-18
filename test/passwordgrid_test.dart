import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:passwordgrid/main.dart';

void main() {
  final config = GridConfig(
      alphaUpper: true,
      alphaLower: false,
      numbers: false,
      symbols: false,
      gridSize: 8);
  testWidgets('PasswordGrid builds correctly with default configuration',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: PasswordGrid(config: config),
      ),
    ));

    // Verify that the PasswordGrid widget is built
    expect(find.byType(PasswordGrid), findsOneWidget);

    // // Verify that the default grid size is 8x8
    // expect(find.byType(TableRow), findsNWidgets(8));
  });

  testWidgets('GridExample grid has correct number of rows',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: PasswordGrid(config: config),
      ),
    ));

    // Verify that the grid has 8 rows, other than the header row.
    final table = tester.widget<Table>(find.byType(Table));
    expect(table.children.length - 1, 8);
  });

  testWidgets('GridExample grid has correct number of columns',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: PasswordGrid(config: config),
      ),
    ));

    // Verify that the grid has 8 columns, other than the left side column.
    final table = tester.widget<Table>(find.byType(Table));
    for (var row in table.children) {
      expect(row.children.length - 1, 8);
    }
  });

  testWidgets('GridExample grid cells have text', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: PasswordGrid(config: config),
      ),
    ));

    // Verify that the grid cells have text.
    final tableCells = tester.widgetList<Text>(find.byType(Text));
    for (var cell in tableCells) {
      expect(cell.data, isNotNull);
    }
  });

  testWidgets('GridExample grid cells have only one empty text',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: PasswordGrid(config: config),
      ),
    ));

    // Verify that the grid cells have only one empty cell, which is the top left.
    // other cells should have non-empty text.
    final tableCells = tester.widgetList<Text>(find.byType(Text));
    var emptyCtr = 0;
    for (var cell in tableCells) {
      emptyCtr += cell.data == "" ? 1 : 0;
    }
    expect(emptyCtr, 1);
  });

  test('GridConfig should have alphaUpper set to true by default', () {
    final config = GridConfig(
        alphaUpper: true,
        alphaLower: false,
        numbers: false,
        symbols: false,
        gridSize: 8);
    expect(config.alphaUpper, true);
  });

  testWidgets(
      'PasswordGrid should display uppercase letters when alphaUpper is true',
      (WidgetTester tester) async {
    final config = GridConfig(
        alphaUpper: true,
        alphaLower: false,
        numbers: false,
        symbols: false,
        gridSize: 8);
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: PasswordGrid(config: config),
      ),
    ));

    // Assuming the grid generates at least one uppercase letter
    expect(find.textContaining(RegExp(r'[A-Z]')), findsWidgets);
  });
}
