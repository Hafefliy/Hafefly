// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hafefly/screens/appointment/appointment.dart';

import 'pages/home.dart';
import 'pages/map.dart';
import 'pages/profile.dart';
import 'pages/search.dart';

class HomeWrappePage extends StatefulWidget {
  const HomeWrappePage({Key? key}) : super(key: key);
  @override
  HomeWrappePageState createState() => HomeWrappePageState();
}

class MyTabs {
  final String title;
  MyTabs({required this.title});
}

class HomeWrappePageState extends State<HomeWrappePage>
    with TickerProviderStateMixin {
  final List<MyTabs> _tabs = [
    MyTabs(title: "Hafefly"),
    MyTabs(title: "Search"),
    MyTabs(title: "Map"),
    MyTabs(title: "Profile")
  ];

  late MyTabs _myHandler;
  late TabController _controller;
  void _handleSelected() {
    setState(() {
      _myHandler = _tabs[_controller.index];
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this);
    _myHandler = _tabs[0];
    _controller.addListener(_handleSelected);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double tabBarBottomPadding;
    if (width < 400) {
      tabBarBottomPadding = 0;
    } else {
      tabBarBottomPadding = 20;
    }
    return WillPopScope(
      onWillPop: () async => !Navigator.of(context).userGestureInProgress,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: DefaultTabController(
            length: 4,
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  _myHandler.title,
                  style:
                      const TextStyle(fontFamily: "rum-raising", fontSize: 30),
                ),
                backgroundColor: const Color(0xff394180),
                actions: [
                  IconButton(
                    icon: Image.asset(
                      "assets/images/Work.png", 
                      filterQuality: FilterQuality.high
                    ),
                    onPressed: () {
                      Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AppointmentView()));
                    },
                  )
                ],
              ),
              body: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _controller,
                children: const [
                  HomePage(),
                  SearchPage(),
                  MapView(),
                  ProfilePage()
                ],
              ),
              bottomNavigationBar: Container(
                color: const Color(0xff394180),
                padding: EdgeInsets.only(bottom: tabBarBottomPadding),
                child: TabBar(
                  controller: _controller,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey[400],
                  indicatorColor: Colors.black,
                  indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(color: Colors.white, width: 7.0),
                    insets: EdgeInsets.fromLTRB(20, 0.0, 20, 42.0),
                  ),
                  tabs: const [
                    Tab(icon: Icon(Icons.home)),
                    Tab(icon: Icon(Icons.search)),
                    Tab(icon: Icon(Icons.map)),
                    Tab(icon: Icon(Icons.person)),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
