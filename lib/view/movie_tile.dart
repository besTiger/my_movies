import 'package:flutter/material.dart';

import '../model/movie_model.dart';

class MovieTile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 0, right: 10, bottom: 10, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: Image.asset(
                "assets/${MoviesResults!}",
                fit: BoxFit.cover,
                width: 140,
              ),
            ),
          ),
          Text(
            "${MoviesResults!}",
            style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.normal),
          ),
          Text(
            "${MoviesResults!}",
            style: const TextStyle(
                fontSize: 14, color: Colors.white, fontWeight: FontWeight.w100),
          ),
        ],
      ),
    );
  }
}