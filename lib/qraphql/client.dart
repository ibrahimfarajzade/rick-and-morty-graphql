import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLConfig {
  static final HttpLink httpLink = HttpLink('https://tmdb.sandbox.zoosh.ie/dev');

  static ValueNotifier<GraphQLClient> initializeClient() {
    final client = GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: InMemoryStore()),
    );

    return ValueNotifier(client);
  }
}
