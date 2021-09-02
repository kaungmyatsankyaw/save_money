import 'package:app/constant/valuse.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageIndex = 0;

  _opTap(int index) {
    pageIndex = index;
    setState(() {});
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: StringValues.pages[pageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 22,
          unselectedIconTheme: IconThemeData(size: 21,color: Colors.black,opacity: 0.4),
          selectedIconTheme: IconThemeData(opacity: 1),
          elevation: 5,
          // showUnselectedLabels: false,
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          items: StringValues.pages
              .where((e) => e['show'] == true)
              .map<BottomNavigationBarItem>((e) => BottomNavigationBarItem(
                  icon: e['icon'],
                  activeIcon: e['activeIcon'],
                  label: e['label']))
              .toList(),
          type: BottomNavigationBarType.fixed,
          currentIndex: pageIndex,
          selectedItemColor: Colors.blueGrey,
          // selectedItemColor: Colors.amber[800],
          onTap: _opTap,
        ),
      ),
    );
  }
}
