import 'package:bloc/bloc.dart';
import 'package:hopewell/common/entities/doctor.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchStates> {
  SearchBloc() : super(SearchStates()) {
    on<SearchPageDoctorData>((event, emit) {
      emit(state.copyWith(doctorList: event.doctorList));
    });
  }
}
