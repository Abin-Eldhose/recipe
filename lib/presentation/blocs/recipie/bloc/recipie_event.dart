// part of 'recipie_bloc.dart';

// @immutable
// abstract class RecipieEvent extends Equatable {
//   const RecipieEvent();

//   @override
//   List<Object?> get props => [];
// }

// class RecipieRequestEvent extends RecipieEvent {
//   final String query;

//   RecipieRequestEvent({required this.query});

//   @override
//   List<Object?> get props => [query];
// }

part of 'recipie_bloc.dart';

@immutable
abstract class RecipieEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RecipieRequestEvent extends RecipieEvent {
  final String query;

  RecipieRequestEvent({required this.query});

  @override
  List<Object?> get props => [query];
}
