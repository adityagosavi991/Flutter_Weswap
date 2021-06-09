import 'package:flutter/material.dart';

//void main() => runApp(MyApp());

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //NEW*
    ListTile _sideBarSection(String label, IconData icon, Widget page()) {
      return ListTile(
        leading: Icon(icon),
        title: Text(
          label,
          style: TextStyle(fontSize: 17),
        ),
        onTap: () {
          // Update the state of the app.
          // ...
          //Navigator.pop(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page()));
        },
      );
    }
    //NEW*

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
      ),
    );
  }
}
