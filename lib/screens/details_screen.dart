import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Cambiar lego por una instancia dem ovie.

    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const _CustomAppBar(),
          SliverList(
              delegate: SliverChildListDelegate([
            const _PosterAndTitlte(),
            const _Overview(),
            const _Overview(),
            const _Overview(),
            const _Overview(),
            const CastingCards(),
          ]))
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 10),
          color: Colors.black12,
          child: const Text(
            'movie.title',
            style: TextStyle(fontSize: 16),
          ),
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitlte extends StatelessWidget {
  const _PosterAndTitlte({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme texTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('https://via.placeholder.com/200x300'),
              height: 150,
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'movie.title',
                style: texTheme.headline5,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                'movie.originalTitle',
                style: texTheme.subtitle1,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  const Icon(Icons.star_outline, color: Colors.grey),
                  const SizedBox(width: 5),
                  Text(
                    'movie.voteAverage',
                    style: texTheme.caption,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        'Do ex Lorem proident proident eu. Sunt excepteur fugiat in dolore aliqua minim eu ad. Voluptate enim proident do deserunt ex non aliqua velit veniam fugiat do cillum id.',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
