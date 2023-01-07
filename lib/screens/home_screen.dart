import 'package:flutter/material.dart';
import 'package:flutter_movies/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Premier Movies'),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            // Principal Cards
            CardSwiper(),

            // Movie Slider
            MovieSlider(),
          ],
        ),
      ),
    );
  }
}
