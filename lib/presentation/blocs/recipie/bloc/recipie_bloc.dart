// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:meta/meta.dart';
// import 'package:recipie_app/domain/enities/recipie_enitity.dart';
// import 'package:recipie_app/domain/usecases/recipie_usescase.dart';

// part 'recipie_event.dart';
// part 'recipie_state.dart';

// class RecipieBloc extends Bloc<RecipieEvent, RecipieState> {
//   RecipieBloc() : super(RecipieInitial()) {
//     on<RecipieRequestEvent>((event, emit) async {
//       print("bloc  initialized");
//       try {
//         final recipes = await RecipieUsescase().getRecipieFromData();
//         emit(RecipieStateLoaded(recipes: recipes));
//       } catch (e) {}
//     });
//   }
// }

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:recipie_app/domain/enities/recipie_enitity.dart';
import 'package:recipie_app/domain/usecases/recipie_usescase.dart';

part 'recipie_event.dart';
part 'recipie_state.dart';

class RecipieBloc extends Bloc<RecipieEvent, RecipieState> {
  final RecipeUsecase recipeUsecase;

  RecipieBloc({required this.recipeUsecase}) : super(RecipieInitial()) {
    on<RecipieRequestEvent>((event, emit) async {
      print("bloc initialized");
      try {
        final recipes = await recipeUsecase.getRecipieFromData(event.query);
        emit(RecipieStateLoaded(recipes: recipes));
      } catch (e) {
        emit(RecipieStateError(message: e.toString()));
      }
    });
  }
}
