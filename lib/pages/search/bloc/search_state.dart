part of 'search_bloc.dart';

enum Status { loading, done }

class SearchStates {
  const SearchStates({
    this.doctorList = const <DoctorData>[],
  });
  final List<DoctorData> doctorList;

  SearchStates copyWith({List<DoctorData>? doctorList}) {
    return SearchStates(
      doctorList: doctorList ?? this.doctorList,
    );
  }
}

class SearchLoadingState extends SearchStates {}
