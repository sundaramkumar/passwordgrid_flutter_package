import 'dart:math';

const String alphaLowerChars = "abcdefghijklmnopqrstwvuxyz";
const String alphaUpperChars = "ABCDEFGHIJKLMNOPQRSTWVUXYZ";
const String numberChars = "1234567890";
const String symbolChars = "~`!@#\$%^&*()_-+={}[]|\\:;\"'<>,.?/";

class GridConfig {
  bool alphaUpper = true;
  bool alphaLower = true;
  bool numbers = true;
  bool symbols = true;
  int gridSize = 8;

  GridConfig(
      {required this.alphaUpper,
      required this.alphaLower,
      required this.numbers,
      required this.symbols,
      required this.gridSize});
}

class PasswordGridClass {
  bool alphaUpper = true;
  bool alphaLower = true;
  bool numbers = true;
  bool symbols = true;
  int gridSize = 8;

  final GridConfig defaultConfig = GridConfig(
    alphaUpper: true,
    alphaLower: true,
    numbers: true,
    symbols: true,
    gridSize: 8,
  );

  void gridConfig(GridConfig config) {
    if (config.numbers == false &&
        config.alphaUpper == false &&
        config.alphaLower == false &&
        config.symbols == false) {
      config = defaultConfig;
    }
    alphaUpper = config.alphaUpper;
    alphaLower = config.alphaLower;
    numbers = config.numbers;
    symbols = config.symbols;
    gridSize = config.gridSize;

    if (config.gridSize < 5) config.gridSize = 5;
    if (config.gridSize > 8) config.gridSize = 8;
  }

  String randomChar(String str, Random random) {
    if (str.isEmpty) return " ";
    int index = random.nextInt(str.length);
    return str[index];
  }

  String getUsableChars() {
    StringBuffer str = StringBuffer();
    if (alphaUpper) str.write(alphaUpperChars);
    if (alphaLower) str.write(alphaLowerChars);
    if (numbers) str.write(numberChars);
    if (symbols) str.write(symbolChars);
    return str.toString();
  }

  List<List<String>> generateGrid() {
    String usableChars = getUsableChars();
    List<String> topHeaderLabels = ["1", "2", "3", "4", "5", "6", "7", "8"];
    List<String> sideHeaderLabels = ["A", "B", "C", "D", "E", "F", "G", "H"];

    final List<List<String>> gridData = [];
    gridData.add(["", ...topHeaderLabels.take(gridSize)]);

    for (int y = 0; y < gridSize; y++) {
      Random random = Random();

      List<String> row = [];
      for (int x = 0; x < gridSize; x++) {
        row.add(randomChar(usableChars, random));
      }

      gridData.add([(sideHeaderLabels[y]), ...row]);
    }

    return gridData;
  }
}
