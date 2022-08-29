part of 'app_intro_bloc.dart';

abstract class AppIntroEvent extends Equatable {
  AppIntroEvent(this.query);

  String query;

  @override
  List<Object> get props => [];
}

class GetModelList extends AppIntroEvent {
  GetModelList(String query) : super(query);
}
