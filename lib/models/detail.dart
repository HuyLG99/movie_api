import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Detail {
  final int id;
  final String name;
  final String permalink;
  final String startDate;
  // final String endDate;
  final String country;
  final String network;
  final String status;
  final String image;
  final String description;
  Detail(
      {required this.id,
      required this.name,
      required this.permalink,
      required this.startDate,
      // required this.endDate,
      required this.country,
      required this.network,
      required this.status,
      required this.image,
      required this.description});

  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
        id: json["id"],
        name: json["name"],
        permalink: json["permalink"],
        startDate: json["start_date"],
        //  endDate: json["end_date"],
        country: json["country"],
        network: json["network"],
        status: json["status"],
        image: json["image_thumbnail_path"],
        description: json["description"]);
  }
}

Future<Detail> fetchDetailFilm(int id) async {
  String url = "https://www.episodate.com/api/show-details?q=$id";
  final response = await http.get(Uri.parse(url));
  final extractedData = convert.jsonDecode(response.body);
  final filmData = extractedData["tvShow"];
  return Detail.fromJson(filmData);
}
