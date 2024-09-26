import 'package:flutter/material.dart';
import 'package:task3/passwordsetting.dart';

import 'notifi.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int _selectedIndex = 0;
  final Color primaryColor = Color(0xFFF4B5A4); // Background color for icon circles

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            color: Color(0xFFF4B5A4), // Changed to a valid color for the title text
          ),
        ),
      ),
      body: ListView(
        children: [
          // Notification Settings Tile
          ListTile(
            leading: _buildCircleIcon(Icons.notifications),
            title: Text('Notification Settings'),
            trailing: Icon(Icons.keyboard_arrow_down),
            onTap: () {
              // Expand or navigate to Notification Settings screen
            },
          ),
          // Password Settings Tile
          ListTile(
            leading: _buildCircleIcon(Icons.lock),
            title: Text('Password Settings'),
            trailing: Icon(Icons.keyboard_arrow_down),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationSettingsScreen()),
              );
            },
          ),
          // Delete Account Tile
          ListTile(
            leading: _buildCircleIcon(Icons.delete),
            title: Text('Delete Account'),
            trailing: Icon(Icons.keyboard_arrow_down),
            onTap: () {
              // Handle delete account
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'List'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_outline), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: primaryColor,
        backgroundColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }

  // Helper method to create a circular icon with background color
  Widget _buildCircleIcon(IconData iconData) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: primaryColor, // Background color for the circle
      ),
      padding: EdgeInsets.all(8.0), // Padding around the icon inside the circle
      child: Icon(
        iconData,
        color: Color(0xFF4B4544), // Corrected icon color syntax
      ),
    );
  }
}
