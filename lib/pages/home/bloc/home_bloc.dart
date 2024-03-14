import 'package:bloc/bloc.dart';
import 'package:hopewell/common/entities/routes/video.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvents, HomeStates> {
  HomeBloc() : super(const HomeStates()) {
    on<HomePageDots>(homePageDots);
    // on<HomePageCourseItem>(homePageCourseItem);
    on<HomePageThumbnail>(homePageThumbnail);
    on<HomePageListVideo>(homePageListVideo);
  }

  void homePageDots(HomePageDots event, Emitter<HomeStates> emit) {
    emit(state.copyWith(index: event.index));
  }

  void homePageThumbnail(HomePageThumbnail event, Emitter<HomeStates> emit) {
    emit(state.copyWith(thumbnail: event.thumbnail));
  }

  void homePageListVideo(HomePageListVideo event, Emitter<HomeStates> emit) {
    emit(state.copyWith(listVideo: event.listVideo));
  }

  // void homePageCourseItem(HomePageCourseItem event, Emitter<HomeStates> emit) {
  //   emit(state.copyWith(courseItem: event.courseItem));
  // }
}
