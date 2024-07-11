// part of 'recipie_bloc.dart';

// @immutable
// sealed class RecipieState extends Equatable {
//   @override
//   List<Object?> get props => [];
// }

// final class RecipieInitial extends RecipieState {}

// final class RecipieStateLoading extends RecipieState {}

// final class RecipieStateLoaded extends RecipieState {
//   final List<RecipeEntity> recipes;

//   RecipieStateLoaded({required this.recipes});
//   @override
//   List<Object?> get props => [];
// }

// final class RecipieStateError extends RecipieState {
//   final String message;
//   RecipieStateError({required this.message});
//   @override
//   List<Object?> get props => [];
// }

part of 'recipie_bloc.dart';

@immutable
abstract class RecipieState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RecipieInitial extends RecipieState {}

class RecipieStateLoading extends RecipieState {}

class RecipieStateLoaded extends RecipieState {
  final List<RecipeEntity> recipes;

  RecipieStateLoaded({required this.recipes});

  @override
  List<Object?> get props => [recipes];
}

class RecipieStateError extends RecipieState {
  final String message;

  RecipieStateError({required this.message});

  @override
  List<Object?> get props => [message];
}
