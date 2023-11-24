import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_feature/logic/counter_cubit.dart';
import 'package:test_feature/main.dart';

class AppRouter {
  final _counterCubit = CounterCubit();

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: const MyHomePage(title: 'home Page'),
                ));
      case '/second':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: const SecondPage(
                    pageName: 'صفحه دوم',
                    color: Colors.greenAccent,
                  ),
                ));
      case '/third':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: const ThirdPage(
                    pageName: 'صفحه سوم',
                    color: Colors.yellowAccent,
                  ),
                ));
      default: return null;
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}
