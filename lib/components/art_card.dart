import 'package:dotori_mobile/screens/art_detail_screen.dart';
import 'package:flutter/material.dart';

class ArtCard extends StatelessWidget {
  final int id;
  final String image;
  const ArtCard({required this.id, required this.image, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
              settings: RouteSettings(arguments: {
                'id': id,
                'image': image,
              }),
              pageBuilder: (context, animation, secondaryAnimation) =>
                  ArtDetailScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
            ));
      },
      child: Stack(fit: StackFit.expand, children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Hero(
                tag: 'art_detail_$id',
                child: Image.asset(image, fit: BoxFit.cover))),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios),
              color: Color.fromARGB(130, 255, 255, 255),
              iconSize: 40,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_forward_ios),
              color: Color.fromARGB(130, 255, 255, 255),
              iconSize: 40,
            ),
          ],
        ),
        _Content()
      ]),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.3),
                Colors.black.withOpacity(0.5),
              ],
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Artwork Title',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          'by Artist Name',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ]),
                  SizedBox(width: 10),
                  Container(
                    width: 30,
                    height: 30,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(1),
                        child: ClipOval(
                            child: Image.network(
                          'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80',
                        )),
                      ),
                    ),
                  )
                ],
              ),
              Text("“a brief introduction about the artwork”",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              SizedBox(height: 4),
              Text("oil on canvas  |  00.0 x 00.0 (cm)  |  ₩1,000,000 ",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              SizedBox(height: 4),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          icon:
                              Icon(Icons.favorite_border, color: Colors.white),
                          onPressed: () {},
                        ),
                        Text("2.7k",
                            style:
                                TextStyle(color: Colors.white, fontSize: 12)),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon:
                              Icon(Icons.bookmark_border, color: Colors.white),
                          onPressed: () {},
                        ),
                        Text("1.3k",
                            style:
                                TextStyle(color: Colors.white, fontSize: 12)),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.comment_bank, color: Colors.white),
                          onPressed: () {},
                        ),
                        Text("1.1k",
                            style:
                                TextStyle(color: Colors.white, fontSize: 12)),
                      ],
                    ),
                    SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(8),
                        primary: Colors.black,
                        textStyle: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      child: Text("Purchase/Inquiry"),
                    ),
                  ]),
              SizedBox(height: 16)
            ],
          ),
        ),
      ],
    );
  }
}
