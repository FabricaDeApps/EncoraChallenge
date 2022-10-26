// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moview_news/models/response_moviews.dart';

class MoviesProvider {

  Future<List<MovieResult>> getMovies() async {
    try{
      var request = http.Request('GET', Uri.parse('https://api.nytimes.com/svc/movies/v2/critics/all.json?api-key=3xVHELWWxSSleARew86edVzLZeX3RXgM'));
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var body = await response.stream.bytesToString();
        ResponseTimesMovies responseData = ResponseTimesMovies.fromJson(json.decode(body));
        return responseData.results;
      }else{
        return[];
      }
    }catch (e) {
      return [];
    }
  }

}