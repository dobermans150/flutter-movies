import 'package:flutter/material.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  String? get searchFieldLabel => 'Buscar Pelicula';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [Text('Build Actions')];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Text('Build Leading');
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('Build Results');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text('Build Suujestions$query');
  }
}
