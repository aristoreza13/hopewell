part of 'home_bloc.dart';

abstract class HomeEvents {
  const HomeEvents();
}

class HomePageDots extends HomeEvents {
  // Grab the value from states class
  final int index;

  HomePageDots(this.index);
}

class HomePageThumbnail extends HomeEvents {
  final List<String> thumbnail;
  const HomePageThumbnail(this.thumbnail);
}

class HomePageListVideo extends HomeEvents {
  final List<VideoYoutubeData> listVideo;
  const HomePageListVideo(this.listVideo);
}

// new event to show list course
// class HomePageCourseItem extends HomeEvents {
//   const HomePageCourseItem(this.courseItem);
//   final List<CourseItem> courseItem;
// }
