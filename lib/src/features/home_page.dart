import 'package:flutter/material.dart';
import 'package:portfolio/src/constants/size_constants.dart';
import 'package:portfolio/src/features/desktop/home_page_desktop.dart';
import 'package:portfolio/src/features/mobile_app/home_page_mobile.dart';

import 'mobile_app/drawer_mobile.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double constraintMinWidth = constraints.minWidth;
        return Scaffold(
          key: _scaffoldKey,
          endDrawer: const DrawerMobile(),
          body:  SafeArea(
            child: constraintMinWidth <= kMaximumMobileSize
                ? HomePageMobile(openDrawer: ()=> _scaffoldKey.currentState?.openEndDrawer())
                : const HomePageWeb(),
          ),
        );
      }
    );
  }
}