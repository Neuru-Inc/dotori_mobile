import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotori_mobile/components/art_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> images = [
    'asset/img/main_sample_1.png',
    'asset/img/main_sample_2.png',
    'asset/img/main_sample_3.png',
    'asset/img/main_sample_4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.8,
        child: CarouselSlider(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.7,
            enlargeCenterPage: true,
          ),
          items: [0, 1, 2].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          spreadRadius: 4,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    width: MediaQuery.of(context).size.width - 16.0,
                    child: ArtCard(
                      image: images[i],
                    ));
              },
            );
          }).toList(),
        ));
  }
}


// ListView.separated(
//             scrollDirection: Axis.horizontal,
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ,
//               );
//             },
//             separatorBuilder: (context, index) => const SizedBox(width: 16),
//             itemCount: 3)