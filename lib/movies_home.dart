// ignore_for_file: prefer_is_empty, unnecessary_null_comparison, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:moview_news/models/response_moviews.dart';
import 'package:moview_news/movie_detail.dart';
import 'package:moview_news/providers/movies_provider.dart';

class MoviewsReview extends StatefulWidget {
  const MoviewsReview({super.key});
  @override
  State<MoviewsReview> createState() => _MoviewsReview();
}

class _MoviewsReview extends State<MoviewsReview> {
  
  final MoviesProvider moviesProvider= MoviesProvider();
  final imagePlaceHolder = "https://media.istockphoto.com/vectors/thumbnail-image-vector-graphic-vector-id1147544807?k=20&m=1147544807&s=612x612&w=0&h=pBhz1dkwsCMq37Udtp9sfxbjaMl27JUapoyYpQm0anc=";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
      ),
      body: Column(
              children: <Widget>[
                Expanded(
                  child: FutureBuilder<List<MovieResult>>(
                    future: _requestData(context),
                    builder: (BuildContext context,AsyncSnapshot <List<MovieResult>>snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data?.length==0) {
                        return const Center(child: Text("Sin resultados"));
                        }else{
                          return ListView.builder(
                            padding: const EdgeInsets.only(top: 15, bottom: 15),
                            itemCount: snapshot.data?.length,
                            itemBuilder: (BuildContext context, int index) {
                              return MovieDetail(movie: snapshot.data![index]);
                            },
                          );
                        }
                      }else{
                        return const Center(child: CircularProgressIndicator());
                      }
                    }
                  )
                )
              ]
            ),
    );
  }



  Future<List<MovieResult>>_requestData(BuildContext context) async {
    List<MovieResult> response = await moviesProvider.getMovies();
    if(response!=null){
      return response;
    }else{
      return [];
    }
  }

}