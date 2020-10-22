import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_bloc/bloc/user_details_bloc.dart';
import 'package:flutter_demo_bloc/bloc/user_details_event.dart';
import 'package:flutter_demo_bloc/screens/user_details_screen.dart';
import 'package:flutter_demo_bloc/screens/user_page.dart';

import 'bloc/user_list_bloc.dart';
import 'bloc/user_list_event.dart';

/// Custom [BlocObserver] which observes all bloc and cubit instances.
class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onChange(Cubit cubit, Change change) {
    print(change);
    super.onChange(cubit, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(cubit, error, stackTrace);
  }
}


void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (_, theme) {
          return MaterialApp(
            theme: theme,
            debugShowCheckedModeBanner: false,
            home: /*MultiBlocProvider(
                providers: [
                  BlocProvider<UserListBloc>(
                      create: (context) => UserListBloc()..add(FetchUserListEvent()), child: UserPage()
                  ),
                  *//*BlocProvider<UserDetailsBloc>(
                      create: (context) => UserDetailsBloc(), child: UserDetailsScreen()
                  ),*//*
                ],
                child: UserPage()
            ),*/
            BlocProvider<UserListBloc>(
              create: (context) => UserListBloc()..add(FetchUserListEvent()), child: UserPage()
            ),
          );
        },
      ),
    );
  }
}

class ThemeCubit extends Cubit<ThemeData> {
  /// {@macro brightness_cubit}
  ThemeCubit() : super(_lightTheme);

  static final _lightTheme = ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
    ),
    brightness: Brightness.light,
    textTheme: TextTheme(
      bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.black),
    ),
  );

  static final _darkTheme = ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.black,
    ),
    brightness: Brightness.dark,
    textTheme: TextTheme(
      bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.black),
    ),
  );

  /// Toggles the current brightness between light and dark.
  void toggleTheme() {
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
  }
}

