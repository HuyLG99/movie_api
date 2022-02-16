// // ignore_for_file: avoid_print

// import 'dart:convert' as convert;

// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
// import 'package:movie_api/models/film.dart';

// class TVShow with ChangeNotifier {
//   final List<Film> _films = [];
//   List<Film> get films {
//     return [..._films];
//   }

//   Future<void> fetchTopFilm() async {
//     String url = "https://www.episodate.com/api/most-popular?page=:page";
//     try {
//       final respone = await http.get(Uri.parse(url));
//       final extractedData = convert.jsonDecode(respone.body);
//       List<dynamic> listFilms = extractedData["tv_show"];
//       for (var element in listFilms) {
//         _films.add(Film.fromJson(element));
//       }
//       // print(films.length);
//       notifyListeners();
//     } catch (error) {
//       return;
//     }
//   }
// }
