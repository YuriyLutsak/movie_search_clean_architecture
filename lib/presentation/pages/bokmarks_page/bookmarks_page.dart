import 'package:flutter/material.dart';
import 'package:movie_search/domain/entity/movie/movie.dart';
import 'package:movie_search/util/constants.dart';

void main() {
  // di.setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Search Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Bookmarks(),
    );
  }
}

class Bookmarks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.network(
                kImgTest,
                width: 50.0,
                height: 50.0,
                fit: BoxFit.cover,
              ),
              title: Text('Title $index'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Data 1'),
                  Text('Data 2'),
                  Text('Data 3'),
                  Text('Data 4'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
