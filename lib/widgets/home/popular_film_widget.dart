// import 'package:flutter/material.dart';
// import 'package:movie_api/models/tv_show.dart';
// import 'package:movie_api/screens/detail_screen.dart';
// import 'package:provider/provider.dart';

// class PopularFilmWidget extends StatefulWidget {
//   @override
//   PopularFilmWidgetState createState() => PopularFilmWidgetState();
// }

// class PopularFilmWidgetState extends State<PopularFilmWidget> {
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
//       height: 700,
//       child: GridView.builder(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
//         itemCount: films.length,
//         itemBuilder: (BuildContext context, int index) {
//           return TextButton(
//             onPressed: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => DetailScreen(
//                             id: films[index].id,
//                           )));
//             },
//             child: Image.network(films[index].image),
//           );
//         },
//       ),
//     );
//   }
// }
