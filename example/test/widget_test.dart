import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:passwordgrid_flutter/main.dart';

void main() {
  testWidgets('GridExample has a title and a grid',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the app has a title.
    expect(find.text('Password Grid Example'), findsOneWidget);

    // Verify that the app has a grid.
    expect(find.byType(Table), findsOneWidget);
  });

  testWidgets('GridExample grid has correct number of rows',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Verify that the grid has 8 rows, other than the header row.
    final table = tester.widget<Table>(find.byType(Table));
    expect(table.children.length - 1, 8);
  });

  testWidgets('GridExample grid has correct number of columns',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Verify that the grid has 8 columns, other than the left side column.
    final table = tester.widget<Table>(find.byType(Table));
    for (var row in table.children) {
      expect(row.children.length - 1, 8);
    }
  });

  testWidgets('GridExample grid cells have text', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Verify that the grid cells have text.
    final tableCells = tester.widgetList<Text>(find.byType(Text));
    for (var cell in tableCells) {
      expect(cell.data, isNotNull);
    }
  });

  testWidgets('GridExample grid cells have only one empty text',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Verify that the grid cells have only one empty cell, which is the top left.
    // other cells should have non-empty text.
    final tableCells = tester.widgetList<Text>(find.byType(Text));
    var emptyCtr = 0;
    for (var cell in tableCells) {
      emptyCtr += cell.data == "" ? 1 : 0;
    }
    expect(emptyCtr, 1);
  });
}
