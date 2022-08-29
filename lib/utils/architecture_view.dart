import 'package:dealer/utils/screen_ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenBuilder<T extends Bloc> extends StatelessWidget {
  final Widget Function(BuildContext, ScreenUiHelper, T) builder;
  final T bloc;

  const ScreenBuilder({
    Key? key,
    required this.builder,
    required this.bloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUiHelper uiHelpers = ScreenUiHelper.fromContext(context);
    return BlocProvider<T>(
      lazy: false,
      create: (BuildContext context) => bloc,
      child: Scaffold(
        body: SafeArea(
          child: builder(context, uiHelpers, bloc),
        ),
      ),
    );
  }
}
