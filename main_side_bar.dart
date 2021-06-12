import 'package:flutter/material.dart';
import 'profile.dart';

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
    //This is the custom Widget that I build, and then used it 4 times in the return statement.
    ListTile _sideBarSection(String label, IconData icon, Widget page) {
      //here page is the widget name that we want to navigate to, first import that file which contins that widget. Like I have imported Profile.dart.
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
              context, MaterialPageRoute(builder: (context) => page));
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
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: ProfileImage(),
              ),

              //ALL THE SIDEBAR OPTIONS, instead of ProfilePage Widget in all the remaining arguments, use the correct page widget for the respective pages.
              _sideBarSection('Home', Icons.home,
                  ProfilePage()), //Change it to Home page navigation.
              _sideBarSection('Profile', Icons.person, ProfilePage()),
              _sideBarSection('Nearest Station', Icons.battery_charging_full,
                  ProfilePage()), //Change it to Nearest Station Widget or Page
              _sideBarSection('Vehicle Details', Icons.list_alt_outlined,
                  ProfilePage()), //Change it
              _sideBarSection('About', Icons.info, ProfilePage()), //Change it
              _sideBarSection(
                  'Log Out', Icons.logout, ProfilePage()), //Change it
            ],
          ),
        ));
  }
}

class ProfileImage extends StatefulWidget {
  //final imageURL =
  // 'https://image.shutterstock.com/image-vector/vector-profile-icon-600w-380603071.jpg';
  @override
  ProfileImageState createState() => ProfileImageState();
}

//A stateful widget to keep the profile image and name updated.
class ProfileImageState extends State<ProfileImage> {
  final imageURL =
      'https://image.shutterstock.com/image-vector/vector-profile-icon-600w-380603071.jpg';
  final name = "John Doe";
  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.zero, children: <Widget>[
      CircleAvatar(
        backgroundImage: NetworkImage(imageURL),
        radius: 50,
      ),
      Container(
        padding: EdgeInsets.all(20),
        child: Text(
          name, //USER PROFILE NAME IN SIDEBAR
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 17,
          ),
        ),
      )
    ]);
  }
}
