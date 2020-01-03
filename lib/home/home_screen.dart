import 'package:flutter/material.dart';

import '../constants.dart';

class NavigationIconView {
  final String _title;
  final Widget _icon;
  final Widget _activeIcon;
  final BottomNavigationBarItem item;

  NavigationIconView({Key key,String title, Widget icon, Widget activeIcon}):
    _title = title,
    _icon = icon,
    _activeIcon = activeIcon,
    item = BottomNavigationBarItem(
      icon: icon,
      activeIcon: activeIcon,
      title: Text(title),
      backgroundColor: Colors.white
    );
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<NavigationIconView> _navitationViews;

  @override
  void initState() {
    super.initState();
    _navitationViews = [
      NavigationIconView(
        title: '微信',
        icon: Icon(Icons.ac_unit),
        activeIcon: Icon(Icons.access_alarm)
      ),
      NavigationIconView(
          title: '通讯录',
          icon: Icon(Icons.g_translate),
          activeIcon: Icon(Icons.face)
      ), NavigationIconView(
          title: '发现',
          icon: Icon(Icons.wallpaper),
          activeIcon: Icon(Icons.satellite)
      ), NavigationIconView(
          title: '我',
          icon: Icon(Icons.backspace),
          activeIcon: Icon(Icons.cached)
      ),
    ];
  }


  @override
  Widget build(BuildContext context) {

    final BottomNavigationBar botNavBar = BottomNavigationBar(
      items: _navitationViews
      .map((NavigationIconView view){
        return view.item;
      })
      .toList(),
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      onTap: (int index){
        print('点击了$index个按钮');
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('微信'),
        actions: <Widget>[
          IconButton(
            icon: Icon(IconData(
              0xe65e,
              fontFamily: Constants.IconFontFamily,
            ),size: 22.0,),
            onPressed: (){
              print('点击了搜索按钮');
            },
          ),
          Container(width: 16.0,),
//          IconButton(
//            icon: Icon(IconData(
//              0xe65e,
//              fontFamily: Constants.IconFontFamily,
//            ),size: 22.0,),
//            onPressed: (){
//              print('显示下拉列表');
//            },
//          ),
        PopupMenuButton(
          itemBuilder: (BuildContext context){
            return <PopupMenuItem<String>>[
              PopupMenuItem(
                child: Text("发起群聊"),
                value: "group_chat",
              )
            ];
          },
          icon: Icon(IconData(
              0xe65e,
            fontFamily: Constants.IconFontFamily,
          ),size: 22.0,),
        ),
          Container(width: 16.0,),
        ],
      ),
      body: Container(
        color: Colors.blue,
      ),
      bottomNavigationBar: botNavBar,
    );
  }
}
