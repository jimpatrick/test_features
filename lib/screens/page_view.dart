import 'package:flutter/material.dart';

class PageViewTest extends StatefulWidget {
  const PageViewTest({super.key});

  @override
  State<PageViewTest> createState() => _PageViewTestState();
}

class _PageViewTestState extends State<PageViewTest> {
  late PageController _pageController;
  double _currentPage = 0;
  int? _onPageChanged;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0, viewportFraction: 0.55);
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pageViewList = [
      colorfulBox(Colors.blueAccent),
      colorfulBox(Colors.greenAccent),
      colorfulBox(Colors.orangeAccent),
      colorfulBox(Colors.redAccent),
      colorfulBox(Colors.brown),
      colorfulBox(Colors.white),
    ];
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: PageView.builder(
        itemCount: pageViewList.length,
        itemBuilder: (BuildContext context, int index) {
          print("=============>current page=============>$_currentPage");
          return pageViewList[index];
        },
        controller: _pageController,
        pageSnapping: true,
        padEnds: false,
      ),
    );
  }

  Widget colorfulBox(Color color) {
    return Container(
      color: color,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ,
    );
  }
}
