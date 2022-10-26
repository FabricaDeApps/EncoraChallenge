


// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:moview_news/models/response_moviews.dart';

class MovieDetail extends StatelessWidget {
  final MovieResult movie;
  final imagePlaceHolder = "https://media.istockphoto.com/vectors/thumbnail-image-vector-graphic-vector-id1147544807?k=20&m=1147544807&s=612x612&w=0&h=pBhz1dkwsCMq37Udtp9sfxbjaMl27JUapoyYpQm0anc=";


  const MovieDetail({super.key, 
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 220,
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 350,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage( movie.multimedia==null ? imagePlaceHolder : movie.multimedia!.resource!.src),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(16),
              )
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  verticalDirection: VerticalDirection.down,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:  [
                    Text(movie.displayName, style: TextStyle(
                      fontWeight: FontWeight.bold
                    )), 
                    Text(movie.bio == "" ? " " : movie.bio.substring(0,300)+"...")],
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }
}