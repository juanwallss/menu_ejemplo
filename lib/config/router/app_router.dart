import 'package:example_menu/infrastructure/datasource/foods.dart';
import 'package:example_menu/presentations/screens/detail_food.dart';
import 'package:example_menu/presentations/screens/home_menu_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => HomeMenuScreen()),
    GoRoute(
      path: '/detail/:id',
      builder: (context, state) {
        final int idFood = int.parse(state.pathParameters['id']!);
        print('el id de la comida es $idFood');
        final food = Foods.foods.firstWhere((element) => element.id == idFood);
        print('el nombre de la comida es ${food.foodName}');
        return DetailFood(food: food);
      },
    ),
  ],
);
