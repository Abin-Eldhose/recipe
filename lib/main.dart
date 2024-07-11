import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:recipie_app/data/datasources/recipe_remote_dataSource.dart';
import 'package:recipie_app/data/models/save_recipe_model.dart';
import 'package:recipie_app/data/repositories/recpipe_repo_impl.y.dart';
import 'package:recipie_app/domain/usecases/recipie_usescase.dart';
import 'package:recipie_app/firebase_options.dart';
import 'package:recipie_app/presentation/blocs/recipie/bloc/recipie_bloc.dart';
import 'package:recipie_app/presentation/pages/SignIn/sing_page.dart';
import 'package:recipie_app/presentation/provider/save_recipe/save_recipe_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  Hive.registerAdapter(RecipeHiveModelAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (context) => RecipieBloc(
            recipeUsecase: RecipeUsecase(
              recipeRepository: RecipeRepositoryImpl(
                recipeRemoteDatasource: RecipeRemoteDataSourceImpl(),
              ),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => SaveRecipeProvider(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Recipe App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const SigninWrapper()),
    );
  }
}
