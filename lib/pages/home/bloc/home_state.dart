part of 'home_bloc.dart';

class HomeStates {
  //when triggered, initialize variable
  const HomeStates({
    this.index = 0,
    // this.courseItem = const <CourseItem>[],
    this.thumbnail = const <String>[],
    this.listVideo = const <VideoYoutubeData>[],
  });

  final int index;
  // final List<CourseItem> courseItem;
  final List<String> thumbnail;
  final List<VideoYoutubeData> listVideo;

  HomeStates copyWith({
    int? index,
    List<String>? thumbnail,
    List<VideoYoutubeData>? listVideo,
  }) {
    return HomeStates(
      // courseItem:
      // courseItem ?? this.courseItem, // if exist, course item. else this
      index: index ?? this.index,
      thumbnail: thumbnail ?? this.thumbnail,
      listVideo: listVideo ?? this.listVideo,
    );
  }
}
