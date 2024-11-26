const String getCharactersQuery = r'''
query {
  characters(page: 1) {
    results {
      id
      name
      image
    }
  }
}
''';
