import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: renderAppbar(context),
      body: Container(
        child: Center(
          child: Text('Home Screen'),
        ),
      ),
    ));
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
        IconButton(
          color: Colors.black,
          icon: Icon(Icons.more_vert),
          onPressed: () {},
        ),
      ],
    );
  }
}
