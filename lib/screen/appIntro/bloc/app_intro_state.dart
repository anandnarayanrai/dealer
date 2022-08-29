part of 'app_intro_bloc.dart';

abstract class AppIntroState extends Equatable {
  const AppIntroState();

  @override
  List<Object?> get props => [];
}

class AppIntroInitial extends AppIntroState {
  AppIntroInitial(){
    print("AppIntroInitial");
  }
}

class AppIntroLoading extends AppIntroState {}

class GetModelCompleted extends AppIntroState {
  final RumModel rumModel;
  const GetModelCompleted(this.rumModel);
}

class ClickCompleted extends AppIntroState {
  final RumModel rumModel;
  const ClickCompleted(this.rumModel);
}

class AppIntroError extends AppIntroState {
  final String? message;

  const AppIntroError(this.message);
}
