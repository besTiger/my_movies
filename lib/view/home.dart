import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../view_model/movies_view_model.dart';
import 'bottom_nav_bar/movies_tab.dart';


class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = Get.put(MoviesViewModel());

  int currentIndex = 0;
  List<Widget> screens = [MyMovies(),];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Image(
          image: AssetImage('assets/netflix_logo.png'),
        ),
        leading: IconButton(
          padding: EdgeInsets.only(left: 30.0),
          onPressed: () => print('Menu'),
          icon: Icon(Icons.menu),
          iconSize: 30.0,
          color: Colors.black,
        ),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(right: 30.0),
            onPressed: () => print('Search'),
            icon: Icon(Icons.search),
            iconSize: 30.0,
            color: Colors.black,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        currentIndex: currentIndex,
        onTap: (val) {
          setState(() {
            currentIndex = val;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'Now Playing',
            icon: Icon(Icons.slow_motion_video_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Top Rated',
            icon: Icon(Icons.movie),
          ),
          BottomNavigationBarItem(
            label: 'Popular',
            icon: Icon(Icons.movie_filter_outlined),
          ),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}