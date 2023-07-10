import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_feature/provider/userProvider.dart';
import 'package:test_feature/screen/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
        title: 'Provider state management',
        theme: ThemeData(
          fontFamily: 'YekanBakhFaNumRegular',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(title: 'List users'),
      ),
    );
  }
}
