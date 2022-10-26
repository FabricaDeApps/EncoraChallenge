// To parse this JSON data, do
//
//     final responseTimesMovies = responseTimesMoviesFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators, prefer_null_aware_operators, unnecessary_null_comparison

import 'package:meta/meta.dart';
import 'dart:convert';

ResponseTimesMovies responseTimesMoviesFromJson(String str) => ResponseTimesMovies.fromJson(json.decode(str));

String responseTimesMoviesToJson(ResponseTimesMovies data) => json.encode(data.toJson());

class ResponseTimesMovies {
    ResponseTimesMovies({
        required this.status,
        required this.copyright,
        required this.numResults,
        required this.results,
    });

    String status;
    String copyright;
    int numResults;
    List<MovieResult> results;

    factory ResponseTimesMovies.fromJson(Map<String, dynamic> json) => ResponseTimesMovies(
        status: json["status"] == null ? null : json["status"],
        copyright: json["copyright"] == null ? null : json["copyright"],
        numResults: json["num_results"] == null ? null : json["num_results"],
        results: json["results"] == null ? [] : List<MovieResult>.from(json["results"].map((x) => MovieResult.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "copyright": copyright == null ? null : copyright,
        "num_results": numResults == null ? null : numResults,
        "results": results == null ? null : List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class MovieResult {
    MovieResult({
        required this.displayName,
        required this.sortName,
        required this.status,
        required this.bio,
        required this.seoName,
        required this.multimedia,
    });

    String displayName;
    String sortName;
    String status;
    String bio;
    String seoName;
    Multimedia? multimedia;

    factory MovieResult.fromJson(Map<String, dynamic> json) => MovieResult(
        displayName: json["display_name"] == null ? null : json["display_name"],
        sortName: json["sort_name"] == null ? null : json["sort_name"],
        status: json["status"] == null ? "" : json["status"],
        bio: json["bio"] == null ? null : json["bio"],
        seoName: json["seo_name"] == null ? null : json["seo_name"],
        multimedia: json["multimedia"] == null ? null : Multimedia.fromJson(json["multimedia"]),
    );

    Map<String, dynamic> toJson() => {
        "display_name": displayName == null ? null : displayName,
        "sort_name": sortName == null ? null : sortName,
        "status": status == null ? null : status,
        "bio": bio == null ? null : bio,
        "seo_name": seoName == null ? null : seoName,
        "multimedia": multimedia == null ? null : multimedia?.toJson(),
    };
}

class Multimedia {
    Multimedia({
        required this.resource,
    });

    Resource? resource;

    factory Multimedia.fromJson(Map<String, dynamic> json) => Multimedia(
        resource: json["resource"] == null ? null : Resource.fromJson(json["resource"]),
    );

    Map<String, dynamic> toJson() => {
        "resource": resource == null ? null : resource?.toJson(),
    };
}

class Resource {
    Resource({
        required this.type,
        required this.src,
        required this.height,
        required this.width,
        required this.credit,
    });

    String type;
    String src;
    int height;
    int width;
    String credit;

    factory Resource.fromJson(Map<String, dynamic> json) => Resource(
        type: json["type"] == null ? null : json["type"],
        src: json["src"] == null ? null : json["src"],
        height: json["height"] == null ? null : json["height"],
        width: json["width"] == null ? null : json["width"],
        credit: json["credit"] == null ? null : json["credit"],
    );

    Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "src": src == null ? null : src,
        "height": height == null ? null : height,
        "width": width == null ? null : width,
        "credit": credit == null ? null : credit,
    };
}

enum Status { FULL_TIME, PART_TIME, EMPTY }
