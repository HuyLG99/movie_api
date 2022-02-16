import 'dart:convert' as convert;
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/detail.dart';
import '../models/film.dart';

const String url = 'https://www.episodate.com/api/search?q=arrow&page=1';

Future<List<TvShows>> fetchdata() async {
  final response =
      await http.get(Uri.parse('https://www.episodate.com/api/most-popular'));
  // if(response.statusCode==200){
  //   return compute(movieSnapshot,response.body);
  // }
  // else{
  //   throw Exception('Error');
  // }
  Map data = jsonDecode(response.body);
  List _temp = [];
  for (var i in data['tv_shows']) {
    _temp.add(i);
  }
  //print(data);
  return TvShows.movieSnapshot(_temp);
}

Future<Detail> fetchDetailFilm(int id) async {
  String url = "https://www.episodate.com/api/show-details?q=$id";
  try {
    final response = await http.get(Uri.parse(url));
    final extractedData = convert.jsonDecode(response.body);
    final filmData = extractedData["tvShow"];
    return Detail.fromJson(filmData);
  } catch (error) {
    rethrow;
  }
}
