import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isDarkMode = false;

  void _toggleDarkMode() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Column(
          children: [
            SwitchListTile(
              secondary: Icon(Icons.lightbulb_outline),
              title: Text('Dark Mode'),
              subtitle: Text('System default'),
              value: isDarkMode,
              onChanged: (value) {
                _toggleDarkMode();
              },
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('Version'),
              subtitle: Text('1.1'),
            ),
            ListTile(
              leading: Icon(Icons.public),
              title: Text('Language'),
              subtitle: Text('English'),
            ),
            ListTile(
              leading: Icon(Icons.straighten),
              title: Text('Area unit'),
              subtitle: Text('km2'),
            ),
          ],
        ),
      ),
    );
  }
}