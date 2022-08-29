import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../client/api_repository.dart';
import '../models/rum_model.dart';

part 'app_intro_event.dart';

part 'app_intro_state.dart';

class AppIntroBloc extends Bloc<AppIntroEvent, AppIntroState> {
  final ApiRepository _apiRepository = ApiRepository();

  AppIntroBloc() : super(AppIntroInitial()) {
    /*on<AppIntroEvent>((event, emit) {
      print("AppIntroBloc AppIntroEvent");
    });*/
    on<GetModelList>((event, emit) async {
      try {
        emit(AppIntroLoading());
        final mList = await _apiRepository.fetchModelList(event.query);
        emit(GetModelCompleted(mList));
        if (mList.error != null) {
          emit(AppIntroError(mList.error));
        }
      } on NetworkError {
        emit(const AppIntroError(
            "Failed to fetch data. is your device online?"));
      }
    });
  }

  void onClick(String query) async {
    try {
      emit(AppIntroLoading());
      final mList = await _apiRepository.fetchModelList(query);
      emit(ClickCompleted(mList));
      if (mList.error != null) {
        emit(AppIntroError(mList.error));
      }
    } on NetworkError {
      emit(const AppIntroError("Failed to fetch data. is your device online?"));
    }
  }
}
