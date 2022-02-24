import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_api/models/post.dart';
import 'package:movie_api/network/network_request.dart';
import 'package:movie_api/screens/home_screen.dart';
import 'package:movie_api/screens/search_film_screen.dart';
import 'package:movie_api/widgets/home/detail_screen.dart';
import 'package:provider/provider.dart';
import 'models/tvshow.dart';

//example get API
// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'flutter api',
//       theme: ThemeData(
//           primaryColor: Colors.red,
//           visualDensity: VisualDensity.adaptivePlatformDensity),
//       home: const Listviewpage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// class Listviewpage extends StatefulWidget {
//   const Listviewpage({Key? key}) : super(key: key);

//   @override
//   State<Listviewpage> createState() => _ListviewpageState();
// }

// class _ListviewpageState extends State<Listviewpage> {
//   // ignore: deprecated_member_use
//   List<Post> postData = [];

//   @override
//   void initState() {
//     super.initState();
//     Networkrequest.fetchPosts().then((datafromServer) {
//       setState(() {
//         postData = datafromServer;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Center(child: Text('Http request API')),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//               child: ListView.builder(
//                   padding: const EdgeInsets.all(10),
//                   itemCount: postData.length,
//                   itemBuilder: (context, index) {
//                     return Card(
//                       child: Padding(
//                         padding: const EdgeInsets.all(10),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               '${postData[index].id}. ${postData[index].title}',
//                               style: const TextStyle(
//                                   fontSize: 16, color: Colors.black),
//                             ),
//                             const SizedBox(
//                               height: 5,
//                             ),
//                             Text(
//                               postData[index].body,
//                               style: const TextStyle(
//                                 fontSize: 14,
//                                 color: Colors.grey,
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     );
//                   }))
//         ],
//       ),
//     );
//   }
// }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
