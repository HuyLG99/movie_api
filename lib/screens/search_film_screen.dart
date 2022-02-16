import 'dart:async';

import 'package:flutter/material.dart';

import '../models/film.dart';
import '../network/request_data.dart';
import 'detail_screen.dart';

class Jobs extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const Jobs() : super();

  @override
  JobsState createState() => JobsState();
}

class Debouncer {
  int? milliseconds;
  VoidCallback? action;
  Timer? timer;
  run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(
      const Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }
}

class JobsState extends State<Jobs> {
  final _debouncer = Debouncer();
  //List<TvShows>? tvShows;
  List<TvShows>? ulist = [];
  List<TvShows>? userLists = [];
  //API call for All Subject List

  @override
  void initState() {
    super.initState();
    fetchdata().then((subjectFromServer) {
      setState(() {
        ulist = subjectFromServer.cast<TvShows>();
        userLists = ulist;
      });
    });
  }

  //Main Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //Search Bar to List of typed Subject
            Container(
              margin: const EdgeInsets.only(left: 35, top: 50),
              padding: const EdgeInsets.only(bottom: 5),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  suffixIcon: const InkWell(
                    child: Icon(Icons.search),
                  ),
                  contentPadding: const EdgeInsets.all(15.0),
                  hintText: 'Search ',
                  hintStyle:
                      const TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                onChanged: (string) {
                  _debouncer.run(() {
                    setState(() {
                      userLists = ulist!
                          .where(
                            (u) => (u.name!.toLowerCase().contains(
                                  string.toLowerCase(),
                                )),
                          )
                          .toList();
                    });
                  });
                },
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.7),
                ),
                itemCount: userLists!.length,
                itemBuilder: (BuildContext context, int index) {
                  TvShows tvShows = userLists![index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(id: userLists![index].id)));
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: const [
                            // BoxShadow(
                            //   color:
                            //   Colors.grey.withOpacity(0.9),
                            //   spreadRadius: 5,
                            //   blurRadius: 7,
                            //   offset: Offset(0,
                            //       5), // changes position of shadow
                            // ),
                          ],
                          image: DecorationImage(
                              image: NetworkImage(
                                  '${userLists![index].imageThumbnailPath}'),
                              fit: BoxFit.cover)),
                      //  child: Text('${userLists![index].name}'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Declare Subject class for json data or parameters of json string/data
//Class For Subject
// class TvShows {
//   var name;
//   TvShows({
//      this.name,
//
//   });
//
//   factory TvShows.fromJson(Map<dynamic, dynamic> json) {
//     return TvShows(
//       name: json['text'],
//
//     );
//   }
// }