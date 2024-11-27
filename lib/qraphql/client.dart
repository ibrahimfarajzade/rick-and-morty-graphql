import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLConfig {
  static final HttpLink httpLink = HttpLink('https://rickandmortyapi.com/graphql');

  // Return a GraphQLClient directly
  static GraphQLClient initializeClient() {
    final client = GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: HiveStore()),
    );

    return client;
  }
}
