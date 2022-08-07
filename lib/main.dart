import 'package:dotori_mobile/screens/art_detail_screen.dart';
import 'package:dotori_mobile/screens/home_screen.dart';
import 'package:dotori_mobile/screens/art_detail_screen.dart';
import 'package:dotori_mobile/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => App(),
      '/art_detail': (context) => ArtDetailScreen(),
    },
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: PRIMARY_COLOR, fontFamily: 'NotoSans'),
  ));
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Text(
      'search',
      style: optionStyle,
    ),
    Text(
      'shop',
      style: optionStyle,
    ),
    Text(
      'box',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: renderAppbar(context),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          showSelectedLabels: false,
          type: BottomNavigationBarType.fixed,
          unselectedIconTheme: IconThemeData(color: Colors.grey),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.image_search),
              label: 'image_search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border_outlined),
              label: 'shopping_bag',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.inbox),
              label: 'inbox',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  PreferredSizeWidget renderAppbar(context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(Icons.menu, color: Colors.black),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('This is a snackbar')));
        },
      ),
      title: Center(
          child: Text('DOTORI',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black))),
      actions: [
        Container(
          width: 35,
          height: 35,
          child: CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80"),
          ),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }
}
