export 'locator.dart';

/// Abstraction that describes the ability to register new entities into the locator
abstract class LocatorRegistrant {
  Future register();
}
