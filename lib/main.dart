import 'package:flutter/material.dart';
import 'package:my_movies/view/home.dart';
import 'package:get/get.dart';
import 'package:my_movies/view/movie_details.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
      routes: {'/details': (context) => Details()},
    );
  }
}