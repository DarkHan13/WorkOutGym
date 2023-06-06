import 'package:flutter/material.dart';
import 'package:work_out_gym/pages/nutrition/four_meal.dart';
import 'package:work_out_gym/pages/nutrition/meal.dart';

class DryingDinner extends StatelessWidget {
  const DryingDinner({super.key});

  @override
  Widget build(BuildContext context) {
    return const FourMeal(
        title: 'Сушка: Ужин',
        meals: [
          Meal(
              videoId: 'WDFOUiduTYc',
              name: 'Гриль курица с овощами',
              ingredients: [
                'куриную грудку',
                'масла',
                'цукини',
                'баклажаны',
                'сладкий перец',
                'шпинат',
              ],
          ),
          Meal(
              videoId: 'ybBW12ZfHMI',
              name: 'Паровая рыба с запеченным картофелем и зеленым горошком',
              ingredients: [
                'морской окунь',
                'несколько маленьких картофелей',
                'зеленым горошком',
              ],
          ),
          Meal(
              videoId: 'L3j_BLWqJSU',
              name: 'Омлет с овощами',
              ingredients: [
                'белка яиц',
                'шпинат',
                'грибы',
                'лук',
                'помидоры',
                'омлет',
              ],
          ),
          Meal(
              videoId: '7x7ccTt0tIo',
              name: 'Тушеные овощи с кускусом',
              ingredients: [
                'морковь',
                'брокколи',
                'сладкий перец',
                'цветная капуста',
                'лук',
                'кускус',
              ],
          ),
        ],
    );
  }

}