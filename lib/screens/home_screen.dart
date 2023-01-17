import 'package:flutter/material.dart';
import 'package:flutter_movies/providers/movies_provider.dart';
import 'package:flutter_movies/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

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
          children: [
            // Principal Cards
            CardSwiper(movies: moviesProvider.onDisplayMovies),

            // Movie Slider
            MovieSlider(
              movies: moviesProvider.popularMovies,
              title: 'Popular',
            ),
          ],
        ),
      ),
    );
  }
}
