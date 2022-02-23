import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/movie_model.dart';
import '../../view_model/movies_view_model.dart';

class MyMovies extends GetWidget<MoviesViewModel> {
  final controller = Get.put(MoviesViewModel());

  Widget build(BuildContext) {
    return FutureBuilder(
      future: controller.getNowPlaying(),
      builder: (context, AsyncSnapshot snapshot) {
        Movies? data = snapshot.data;
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Wrap(
                  alignment: WrapAlignment.start,
                  verticalDirection: VerticalDirection.up,
                  direction: Axis.horizontal,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        "Popular",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 2, right: 2),
                      alignment: Alignment.center,
                      width: 60,
                      height: 20,
                      decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: const Text(
                        "TV Show",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(2),
                      alignment: Alignment.center,
                      width: 60,
                      height: 20,
                      decoration: BoxDecoration(
                          color: Colors.red[800],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      child: const Text(
                        "Movies",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 270,
                  child: ListView.builder(
                    itemCount: data!.results!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/details',
                              arguments: MoviesResults(
                                title: data.results![index].title,
                                overview: data.results![index].overview,
                                posterPath: data.results![index].posterPath,
                              ));
                        },
                        child: Card(
                          elevation: 20,
                          color: Colors.white,
                          margin: EdgeInsets.all(8),
                          child: Container(
                            child: (data.results![index].posterPath == null)
                                ? CircularProgressIndicator(
                                    color: Colors.red,
                                  )
                                : Image.network(
                                    'https://image.tmdb.org/t/p/w500${data.results![index].posterPath.toString()}',
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        }
      },
    );
  }
}
