import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'ui/home/HomeUI.dart';
import 'ui/msg/MsgUI.dart';
import 'ui/user/UserUI.dart';
import 'ui/login/LoginUI.dart';
import 'package:marker_business/utils/User.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<TabItem> items = [
    new TabItem("首页", Icons.home, HomeUI()),
    new TabItem("消息", Icons.message, MsgUI()),
    new TabItem("我的", Icons.person, UserUI()),
  ];
  int currentIndex = 0;

//  final List<Widget> w = [HomeUI(), MsgUI(), UserUI()];

  @override
  void initState() {
    super.initState();

    User.initByCache(() {
      setState(() {
        login = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: login
            ? buildHome()
            : new LoginUI(
                loginSuccess: () {
                  setState(() {
                    login = true;
                    User.login = true;
                  });
                },
              ));
  }

  bool login = false;

  buildHome() {
    return new Scaffold(
      bottomNavigationBar: new CupertinoTabBar(
//          currentIndex: currentIndex,
          onTap: (p) {
            setState(() {
              currentIndex = p;
              print(currentIndex.toString());
            });
          },
          items: buildTabItem()),
      body: items[currentIndex].router,
    );
  }

  buildTabItem() {
    return items.map((item) {
      return new BottomNavigationBarItem(
        icon: new Icon(item.icon),
        title: new Text(item.title),
      );
    }).toList();
  }
}

//
class TabItem {
  final String title;

  TabItem(this.title, this.icon, this.router);

  final IconData icon;
  final Widget router;
}
