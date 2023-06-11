import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:test_feature/cache_manager.dart';
import 'package:test_feature/video_item.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        fontFamily: 'YekanBakhFaNumRegular',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter cache manger'),
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
  static String url =
      'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4';
  late Future<FileInfo?> fileInfoFuture;
  late CacheManager _customCacheManager;

  @override
  void initState() {
    super.initState();
    _customCacheManager = CustomCacheManager.instance;
    _customCacheManager.getFileStream(url);
    fileInfoFuture = _customCacheManager.getFileFromCache(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
        _customCacheManager.emptyCache();
      }),
      body: ListView(
        children: [
          FutureBuilder(
            future: fileInfoFuture,
            builder: (context, snapshot) {
              print("=============>file valid till=============>${snapshot.data?.validTill}");
              FileInfo fileInfo = snapshot.data as FileInfo;
              return snapshot.hasData
                  ? CustomVideoPlayer(
                      videoPlayerController:
                          VideoPlayerController.file(fileInfo.file))
                  : CustomVideoPlayer(
                      videoPlayerController:
                          VideoPlayerController.network(url));
            },
          ),
        ],
      ),
    );
  }
}
