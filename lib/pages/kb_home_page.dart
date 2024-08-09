import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'kb_person_page.dart';
import 'kb_calender_page.dart';
import 'kb_share_page.dart';
import 'kb_message_page.dart';

class SelectedIndexPage extends StatefulWidget {
  const SelectedIndexPage({super.key});

  @override
  State<SelectedIndexPage> createState() => _SelectedIndexPage();
}

class _SelectedIndexPage extends State<SelectedIndexPage> {
  int _selectedIndex = 0;

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      const CalendarPage(),
      SharePage(),
      MessagePage(),
      PersonPage(onRefresh: _refreshPersonPage),
    ];
  }

  void _refreshPersonPage() {
    setState(() {
      _pages[3] = PersonPage(onRefresh: _refreshPersonPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: _selectedIndex,
            children: _pages,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CurvedNavigationBar(
                  backgroundColor: Colors.transparent,
                  color: Theme.of(context).colorScheme.inversePrimary,
                  animationDuration: const Duration(milliseconds: 300),
                  items: [
                    _buildNavItem(Icons.calendar_month),
                    _buildNavItem(Icons.handshake),
                    _buildNavItem(Icons.mail),
                    _buildNavItem(Icons.person),
                  ],
                  onTap: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildNavLabel('我的日程'),
                      _buildNavLabel('共享'),
                      _buildNavLabel('消息'),
                      _buildNavLabel('我'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon) {
    return Icon(icon, size: 35, color: Colors.white);
  }

  Widget _buildNavLabel(String label) {
    return Expanded(
      child: Text(
        label,
        style: TextStyle(fontSize: 12, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}
