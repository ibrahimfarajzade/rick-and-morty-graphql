import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_characters/core/locator/character/registrant.dart';
import 'package:rick_and_morty_characters/core/locator/locator_registrant.dart';

/// Dependency injection container reference
final locator = GetIt.instance;

/// Basically, the entry point of all app's dependencies
/// Here we inject all implementations of business logic abstractions
Future initLocator() async {
  final registrants = _registrants;

  for (var registrant in registrants) {
    await registrant.register();
  }
}

List<LocatorRegistrant> get _registrants => [
      CharacterLocatorRegistrant(),
    ];
