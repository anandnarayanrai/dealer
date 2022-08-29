import 'package:dealer/screen/appIntro/bloc/app_intro_bloc.dart';
import 'package:dealer/utils/architecture_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import 'models/drinks.dart';
import 'models/rum_model.dart';

class AppIntro extends StatefulWidget {
  const AppIntro({Key? key}) : super(key: key);

  @override
  State<AppIntro> createState() => _AppIntroState();
}

class _AppIntroState extends State<AppIntro> {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<AppIntroBloc>(
        bloc: AppIntroBloc(),
        builder: (context, uiHelpers, bloc) => BlocListener<AppIntroBloc, AppIntroState>(
              listener: (context, state) {
                if (state is AppIntroError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message!),
                    ),
                  );
                }
              },
              child: BlocBuilder<AppIntroBloc, AppIntroState>(
                builder: (context, state) {
                  if (state is AppIntroInitial) {
                    return OutlinedButton(
                        onPressed: () {
                          bloc.add(GetModelList("rum"));
                        },
                        child: Text("Call Api"));
                  } else if (state is AppIntroLoading) {
                    return _buildLoading();
                  } else if (state is GetModelCompleted) {
                    print("GetModelCompleted");
                    //return _buildCard(context, state.rumModel);
                    return OutlinedButton(
                        onPressed: () {
                          bloc.onClick("rum");
                        },
                        child: Text("Try again"));
                  } else if (state is ClickCompleted) {
                    print("ClickCompleted");
                    return _buildCard(context, state.rumModel);
                  } else if (state is AppIntroError) {
                    return OutlinedButton(
                        onPressed: () {
                          bloc.onClick("rum");
                        },
                        child: Text("Try again"));
                  } else {
                    return const Center(
                      child: Text("Something went wrong"),
                    );
                  }
                },
              ),
            ));
  }

  Widget _buildCard(BuildContext context, RumModel model) {
    return model.drinks!.isNotEmpty
        ? ListView.builder(
            itemCount: model.drinks!.length,
            itemBuilder: (context, index) {
              Drinks item = model.drinks![index];
              return InkWell(
                onTap: () {
                  // Navigator.of(context).push(_createRoute(item));
                },
                child: listItem(item),
              );
            },
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.network(
                  'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),
              const Text("Data not found"),
            ],
          );
  }

  Widget listItem(Drinks item) {
    return SizedBox(
      height: 130,
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  item.strDrinkThumb,
                  height: 122,
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                  margin: const EdgeInsets.only(left: 8, right: 8, bottom: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        item.strDrink,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19),
                      ),
                      Text(
                        "(${item.strCategory})",
                        style:
                            const TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text("Glass: ${item.strGlass}"),
                      const SizedBox(
                        height: 2,
                      ),
                      Text("Alcoholic: ${item.strAlcoholic}"),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "${item.strInstructions}",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: const TextStyle(
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}
