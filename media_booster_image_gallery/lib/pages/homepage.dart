import 'dart:convert';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'models.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<IMAGE> photos = [];

  lodeJasonBank() async {
    String jsonData = await rootBundle.loadString("assets/json/image.json");

    List res = jsonDecode(jsonData);

    setState(() {
      photos = res.map((p) => IMAGE.fromJSON(p)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    lodeJasonBank();
  }

  CarouselController buttonCarouselController = CarouselController();
  int initialPage = 0;
  bool toggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PHOTO'S GALLERY"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(9),
              child: StaggeredGrid.count(
                crossAxisCount: 4,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                children: photos
                    .map((p) => StaggeredGridTile.count(
                          crossAxisCellCount: 2,
                          mainAxisCellCount: 2,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed('GalleryPage', arguments: p);
                            },
                            child: Ink(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: AssetImage(p.image),
                                      fit: BoxFit.fill,
                                    )),
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
