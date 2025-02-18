import 'package:flutter/material.dart';
import './passwordgrid.dart';
export './passwordgrid.dart'; // Re-export GridConfig

class PasswordGrid extends StatelessWidget {
  final GridConfig config;

  PasswordGrid({super.key, GridConfig? config})
      : config = config ??
            GridConfig(
              numbers: true,
              alphaUpper: true,
              alphaLower: true,
              symbols: true,
              gridSize: 8,
            );
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Table(
        border: TableBorder.all(
          color: Colors.grey,
          width: 1,
        ),
        children: _buildTableRows(),
      ),
    );
  }

  List<TableRow> _buildTableRows() {
    var grid = PasswordGridClass();
    grid.gridConfig(config);
    final List<List<String>> gridData = grid.generateGrid();

    return gridData.map((rowData) {
      return TableRow(
        children: rowData.map((cellData) {
          return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(8.0),
            color: cellData.isEmpty ? Colors.white : Colors.grey[200],
            child: Text(
              cellData,
              style: TextStyle(
                fontWeight:
                    rowData == gridData.first || cellData == rowData.first
                        ? FontWeight.bold
                        : FontWeight.normal,
              ),
            ),
          );
        }).toList(),
      );
    }).toList();
  }
}
