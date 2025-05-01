import 'package:exercise3/screens/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Best recipes'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, dynamic> _data = {};
  bool _isLoading = true; // Ladezustand hinzufügen

  void _loadData() async {
    _data = await loadJsonFromAssets(
      'assets/data/mobile-apps-portfolio-03-recipes.json',
    );
    setState(() {
      _isLoading = false; // Ladezustand aktualisieren
    });
  }

  Future<Map<String, dynamic>> loadJsonFromAssets(String filePath) async {
    String jsonString = await rootBundle.loadString(filePath);
    return jsonDecode(jsonString);
  }

  Set<String> _categories(Map<String, dynamic> data) {
    if (data['recipes'] == null) {
      return {};
    } // Sicherstellen, dass keine Null-Werte verarbeitet werden
    return data['recipes']
        .map<String>((recipe) => recipe['category'] as String)
        .toSet();
  }

  Set<Map<String, dynamic>> _recipesOfCategory(
    Map<String, dynamic> data,
    String category,
  ) {
    if (data['recipes'] == null) {
      return {};
    } // Sicherstellen, dass keine Null-Werte verarbeitet werden
    return data['recipes']
        .where((recipe) => recipe['category'] == category)
        .map<Map<String, dynamic>>((recipe) => recipe as Map<String, dynamic>)
        .toSet();
  }

  @override
  Widget build(BuildContext context) {
    _loadData();
    if (_isLoading) {
      // Ladeanzeige anzeigen, solange die Daten geladen werden
      return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return CategoryScreen(
      recipesOfCategory: (String cat) => _recipesOfCategory(_data, cat),
      categories: _categories(_data),
    );
  }
}
