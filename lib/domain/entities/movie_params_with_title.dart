import 'package:equatable/equatable.dart';

class MovieParamsWithTitle extends Equatable {
  final int id;
  final String title;

  const MovieParamsWithTitle(this.id, this.title);

  @override
  List<Object> get props => [id, title];
}
