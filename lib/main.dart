import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:myapp/views/screen/about/export_about.dart';
import 'package:myapp/views/screen/contact_me/contact_me.dart';
import 'package:myapp/views/screen/projects/export_project.dart';
import 'package:myapp/views/screen/skill/skill.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '! 👑 Cloud ⚡ SONIQS !',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  final Color bottomNavBarColor = Color(0xFF66bfbf);
  final PageController _pageViewController = new PageController(initialPage: 0);
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          onPageChanged: (pos) {
            setState(() {
              activeIndex = pos;
            });
          },
          controller: _pageViewController,
          scrollDirection: Axis.horizontal,
          children: [About(), Skill(), Project(), ContactMePage()],
        ),
        resizeToAvoidBottomPadding: false,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          activeIndex: activeIndex,
          elevation: 5,
          rightCornerRadius: 0,
          gapWidth: 20,
          gapLocation: GapLocation.end,
          onTap: (int currentPosition) {
            setState(() {
              activeIndex = currentPosition;
            });
            _pageViewController.animateToPage(activeIndex, duration: Duration(milliseconds: 600), curve: Curves.easeIn);
          },
          icons: [
            FlutterIcons.info_ant,
            FlutterIcons.code_string_mco,
            AntDesign.CodeSandbox,
            FlutterIcons.contacts_ant,
          ],
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
