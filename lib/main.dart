import 'dart:io';

import 'package:flutter/material.dart';
import 'package:test_feature/note_thumbnail.dart';
import 'package:test_feature/notification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().init();
  if (Platform.isAndroid) {
    await NotificationService().requestAndroidPermissions();
  }
  if (Platform.isIOS) {
    await NotificationService().requestIOSPermissions();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Note Alarm',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'YekanBakhFaNumRegular',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'یادآور'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: const Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: NoteThumbnail(
                          id: 1,
                          color: Color(0xFFFF9C99),
                          title: "تسک اول",
                          content: "چندی توضیحات")),
                  SizedBox(width: 15),
                  Expanded(
                      child: NoteThumbnail(
                          id: 2,
                          color: Color(0xFF6fefb0),
                          title: "تسک دوم",
                          content: "کمی توضیحات")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
