import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class CastEntity extends Equatable {
  final String creditId;
  final String name;
  final String posterPath;
  final String character;
  final int castId;
  final int gender;

  CastEntity({
    @required this.creditId,
    @required this.name,
    @required this.posterPath,
    @required this.character,
    @required this.castId,
    this.gender,
  });

  @override
  List<Object> get props => [creditId];
}
