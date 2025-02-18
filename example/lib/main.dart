import 'package:flutter/material.dart';
import 'package:passwordgrid/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Password Grid Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GridExample(),
    );
  }
}

class GridExample extends StatelessWidget {
  const GridExample({super.key});

  @override
  Widget build(BuildContext context) {
    // pass grid configuration
    GridConfig config = GridConfig(
      numbers: true,
      alphaUpper: true,
      alphaLower: true,
      symbols: false,
      gridSize: 8, // max size is 8 and min size is 5
    );
    // or Optionally pass GridConfig or use default values
    // GridConfig? config;

    PasswordGrid passwordGrid = PasswordGrid(config: config);
    return Scaffold(
      appBar: AppBar(
        title: Text('Password Grid Example'),
        backgroundColor: Colors.green,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
      ),
      body: Center(
        child: passwordGrid,
      ),
    );
  }
}
