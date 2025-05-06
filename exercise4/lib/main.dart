import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_demo/movie_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyScreen(),
    );
  }
}

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: MyHttpWidget());
  }
}

class MyHttpWidget extends StatefulWidget {
  final movieUri =
      'https://670ef2d6-dbdd-454c-b4d7-6960afb18cc2.mock.pstmn.io/movies';
  //'https://cloud.thws.de/public.php/dav/files/i5Bcxj6eESPETkE/';
  const MyHttpWidget({super.key});

  @override
  State<MyHttpWidget> createState() => _MyHttpWidgetState();
}

class _MyHttpWidgetState extends State<MyHttpWidget> {
  List<Movie> movies = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadMovies().then((m) {
      setState(() {
        isLoading = false;
        movies = m;
      });
    });
  }

  Future<List<Movie>> _loadMovies() async {
    await Future.delayed(const Duration(seconds: 3));
    final response = await http.get(Uri.parse(widget.movieUri));
    var returnValue = <Movie>[];

    if (response.statusCode == 200) {
      final movies = jsonDecode(response.body) as List;
      returnValue = List.generate(
        movies.length,
        (index) => Movie.fromJson(movies[index] as Map<String, dynamic>),
      );
    }
    return returnValue;
  }

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) {
      return const Center(child: Text("No movies found"));
    }

    return ListView.builder(
      itemCount: movies.length,
      prototypeItem: MovieItem(movie: movies.first),
      itemBuilder: (context, index) {
        return MovieItem(movie: movies[index]);
      },
    );
  }
}

class Movie {
  final String title;
  final String director;
  final String poster;
  final String? plot;
  final bool comingSoon;

  Movie({
    required this.title,
    required this.director,
    required this.poster,
    required this.plot,
    this.comingSoon = false,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    String poster = json['Poster'];

    return Movie(
      title: json['Title'],
      director: json['Director'],
      plot: json['Plot'],
      poster: 'https://${poster.substring(7)}',
      comingSoon: json['ComingSoon'] ?? false,
    );
  }
}
