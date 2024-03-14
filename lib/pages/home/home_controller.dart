import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hopewell/common/entities/routes/video.dart';
import 'package:hopewell/common/entities/user.dart';
import 'package:hopewell/pages/global.dart';
import 'package:hopewell/pages/home/bloc/home_bloc.dart';
import 'package:http/http.dart' as http;

class HomeController {
  final BuildContext context;
  HomeController({required this.context});
  UserItem? userProfile = Global.storageService.getUserProfile();
  List<String> urlVideos = [];
  List<String> idVideos = [];
  List<String> thumbnail = [];
  List<VideoYoutubeData> listVideo = [];

  String? convertUrlToId(String url, {bool trimWhitespaces = true}) {
    if (!url.contains("http") && (url.length == 11)) return url;
    if (trimWhitespaces) url = url.trim();

    for (var exp in [
      RegExp(
          r"^https:\/\/(?:www\.|m\.)?youtube\.com\/watch\?v=([_\-a-zA-Z0-9]{11}).*$"),
      RegExp(
          r"^https:\/\/(?:www\.|m\.)?youtube(?:-nocookie)?\.com\/embed\/([_\-a-zA-Z0-9]{11}).*$"),
      RegExp(r"^https:\/\/youtu\.be\/([_\-a-zA-Z0-9]{11}).*$")
    ]) {
      Match? match = exp.firstMatch(url);
      if (match != null && match.groupCount >= 1) return match.group(1);
    }

    return null;
  }

  void init() async {
    print("Home controller initializing..");
    getVideos();
    // get collection of video

    // check if userProfile is valid or not
    //
    // var result = await CourseAPI.courseList();
    // if (result.code == 200) {
    //   print("valid");
    //   print(result.data!);
    //   //trigger event
    //   context.read<HomeBlocs>().add(HomePageCourseItem(result.data!));
    // } else {
    //   print(result.code);
    // }
  }

  void getVideos() async {
    var document = await FirebaseFirestore.instance
        .collection('content')
        .doc('videos')
        .get();
    document.data()!['url'].forEach((element) {
      urlVideos.add(element);
    });
    for (var url in urlVideos) {
      // thumbnail.add("https://img.youtube.com/vi/${convertUrlToId(url)}/0.jpg");

      String embedUrl = "https://www.youtube.com/oembed?url=$url&format=json";

      //store http request response to res variable
      var res = await http.get(Uri.parse(embedUrl));
      print("get youtube detail status code: " + res.statusCode.toString());

      try {
        if (res.statusCode == 200) {
          //return the json from the response
          var data = jsonDecode(res.body);
          listVideo.add(VideoYoutubeData.fromJson(data));
        } else {
          //return null if status code other than 200
          return null;
        }
      } on FormatException catch (e) {
        print('invalid JSON' + e.toString());
        //return null if error
        return null;
      }
    }

    context.read<HomeBloc>().add(HomePageListVideo(listVideo));

    print("List Videos Data ${listVideo.length}");
  }
}
