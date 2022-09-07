import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/shared/BlocObserver.dart';
import 'package:movie/shared/network/local/cashed_helper.dart';
import 'package:movie/shared/network/remote/dio_helper.dart';
import 'package:movie/shared/styles/styles.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'layouts/home_layout.dart';
import 'models/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashedHelper.init();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()
        ..getGenresMoviesInfo()
        ..getUpcomingMoviesInfo(page: 1)
        ..getNowPlayingMoviesInfo(page: 1)
        ..getPopularMoviesInfo(page: 1)
        ..getTopRatedMoviesInfo(page: 1),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {},
        builder: (BuildContext context, AppStates state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Movies App',
            theme: lightMode(),
            home: LoginForm(),
          );
        },
      ),
    );
  }
}