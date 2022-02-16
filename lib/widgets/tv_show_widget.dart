// import 'package:flutter/material.dart';
// import 'package:movie_api/models/tv_show.dart';
// import 'package:movie_api/screens/detail_screen.dart';
// import 'package:provider/provider.dart';

// class TVShowWidget extends StatefulWidget {
//   @override
//   TVShowWidgetState createState() => TVShowWidgetState();
// }

// class TVShowWidgetState extends State<TVShowWidget> {
//   var _isInit = true;
//   @override
//   void didChangeDependencies() {
//     if (_isInit) {
//       Provider.of<TVShow>(context).fetchTopFilm();
//     }
//     _isInit = false;
//     super.didChangeDependencies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final films = Provider.of<TVShow>(context).films;
//     return Container(
//         height: 150,
//         child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: films.length,
//             itemBuilder: (context, index) {
//               return Container(
//                 width: 100,
//                 child: Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => DetailScreen(
//                                     id: films[index].id,
//                                   )));
//                     },
//                     child: Image.network(films[index].image),
//                   ),
//                 ),
//               );
//             }));
//   }
// }
