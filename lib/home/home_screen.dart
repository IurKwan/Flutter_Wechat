import 'package:flutter/material.dart';

import '../constants.dart';

enum ActionItems { GROUP_CHAT, ADD_FRIEND, QR_SCAN, PAYMENT, HELP }

class NavigationIconView {
  final String _title;
  final Widget _icon;
  final Widget _activeIcon;
  final BottomNavigationBarItem item;

  NavigationIconView({Key key, String title, Widget icon, Widget activeIcon})
      : _title = title,
        _icon = icon,
        _activeIcon = activeIcon,
        item = BottomNavigationBarItem(
            icon: icon,
            activeIcon: activeIcon,
            title: Text(title),
            backgroundColor: Colors.white);
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List<NavigationIconView> _navitationViews;

  @override
  void initState() {
    super.initState();
    _navitationViews = [
      NavigationIconView(
          title: '微信',
          icon: Icon(Icons.ac_unit),
          activeIcon: Icon(Icons.access_alarm)),
      NavigationIconView(
          title: '通讯录',
          icon: Icon(Icons.g_translate),
          activeIcon: Icon(Icons.face)),
      NavigationIconView(
          title: '发现',
          icon: Icon(Icons.wallpaper),
          activeIcon: Icon(Icons.satellite)),
      NavigationIconView(
          title: '我',
          icon: Icon(Icons.backspace),
          activeIcon: Icon(Icons.cached)),
    ];
  }

  _buildPopupMenuItem(int iconName, String title) {
    return Row(
      children: <Widget>[
        Icon(
          IconData(
            iconName,
            fontFamily: Constants.IconFontFamily,
          ),
          size: 22.0,
          color: const Color(AppColors.AppBarPopupMenuColor),
        ),
        Container(width: 12.0),
        Text(
          title,
          style: TextStyle(color: const Color(AppColors.AppBarPopupMenuColor)),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar botNavBar = BottomNavigationBar(
      items: _navitationViews.map((NavigationIconView view) {
        return view.item;
      }).toList(),
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
        print('点击了$index个按钮');
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('微信'),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              IconData(
                0xe65e,
                fontFamily: Constants.IconFontFamily,
              ),
              size: 22.0,
            ),
            onPressed: () {
              print('点击了搜索按钮');
            },
          ),
          Container(
            width: 16.0,
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<ActionItems>>[
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe69e, "发起群聊"),
                  value: ActionItems.GROUP_CHAT,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe638, "添加好友"),
                  value: ActionItems.ADD_FRIEND,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe69e, "扫一扫"),
                  value: ActionItems.QR_SCAN,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe69e, "收付款"),
                  value: ActionItems.PAYMENT,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe69e, "帮助与反馈"),
                  value: ActionItems.HELP,
                ),
              ];
            },
            icon: Icon(
              IconData(
                0xe65e,
                fontFamily: Constants.IconFontFamily,
              ),
              size: 22.0,
            ),
            onSelected: (ActionItems selected) {
              print("点击的是$selected");
            },
          ),
          Container(
            width: 16.0,
          ),
        ],
      ),
      body: Container(
        color: Colors.blue,
      ),
      bottomNavigationBar: botNavBar,
    );
  }
}
