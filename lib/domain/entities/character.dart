import 'package:equatable/equatable.dart';

class Character extends Equatable {
  final String name;
  final String image;

  const Character({required this.name, required this.image});

  @override
  List<Object?> get props => [name, image];
}
