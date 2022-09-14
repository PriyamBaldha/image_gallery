import 'package:flutter/material.dart';

import 'pages/GalleryPage.dart';
import 'pages/homepage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'HomePage',
      routes: {
        'HomePage': (context) => const HomePage(),
        'GalleryPage': (context) => const GalleryPage(),
      },
    ),
  );
}
