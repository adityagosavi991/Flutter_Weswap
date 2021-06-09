import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AppDrawer());
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ListTile _sideBarSection(String label, IconData icon) {
      return ListTile(
        leading: Icon(icon),
        title: Text(
          label,
          style: TextStyle(fontSize: 17),
        ),
        onTap: () {
          // Update the state of the app.
          // ...
          Navigator.pop(context);
        },
      );
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Home',
          ),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                //USER PROFILE IMAGE
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://image.shutterstock.com/image-vector/vector-profile-icon-600w-380603071.jpg'),
                  radius: 10,
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'John Doe', //USER PROFILE NAME IN SIDEBAR
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
              //ALL THE SIDEBAR OPTIONS
              _sideBarSection('My Profile', Icons.person),
              _sideBarSection('Nearest Station', Icons.battery_charging_full),
              _sideBarSection('Vehicle Details', Icons.list_alt_outlined),
              _sideBarSection('About', Icons.info),
              _sideBarSection('Log Out', Icons.logout),
            ],
          ),
        ));
  }
}
