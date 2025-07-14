import 'package:evently_c15_mon/core/colors_manager.dart';
import 'package:evently_c15_mon/features/main_layout/fav/fav.dart';
import 'package:evently_c15_mon/features/main_layout/home/home.dart';
import 'package:evently_c15_mon/features/main_layout/maps/map.dart';
import 'package:evently_c15_mon/features/main_layout/profile/profile.dart';
import 'package:flutter/material.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  final List<Widget> _tabs = const [Home(), Maps(), Favourite(), Profile()];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: _tabs[_selectedIndex],
      bottomNavigationBar: _buildBottomAppBar(),
    );
  }

  Widget _buildBottomAppBar() {
    return BottomAppBar(
      notchMargin: 4,

      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 0 ? Icons.home_filled : Icons.home_outlined,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 1
                  ? Icons.location_on
                  : Icons.location_on_outlined,
            ),
            label: "Map",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 2
                  ? Icons.favorite
                  : Icons.favorite_border_outlined,
            ),
            label: "Fav",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 3 ? Icons.person : Icons.person_2_outlined,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  void _onTap(int newIndex) {
    setState(() {
      _selectedIndex = newIndex;
    });
  }
}
