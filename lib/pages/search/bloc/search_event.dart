part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {
  const SearchEvent();
}

class SearchPageDoctorData extends SearchEvent {
  final List<DoctorData> doctorList;
  const SearchPageDoctorData(this.doctorList);
}
