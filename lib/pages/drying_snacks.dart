import 'package:flutter/material.dart';
import 'package:work_out_gym/pages/four_meal.dart';
import 'package:work_out_gym/pages/meal.dart';

class DryingSnacks extends StatelessWidget {
  const DryingSnacks({super.key});

  @override
  Widget build(BuildContext context) {
    return const FourMeal(
      title: 'Сушка: Перекус',
      meals: [
        Meal(
          videoId: 'w_2UIG4Wyl0',
          name: 'Сушеные овощные чипсы',
          ingredients: [
            'морковь',
            'свекла',
            'сладкий перец',
            'батат',
          ],
        ),
        Meal(
          videoId: 'U2NtcQhQEB4',
          name: 'Сушеные орехи и семена',
          ingredients: [
            'миндаль',
            'фундук',
            'грецкий орех',
            'подсолнечные семечки',
            'тыквенные семечки',
          ],
        ),
        Meal(
          videoId: 'OoOyWPfS_4w',
          name: 'Сушеные фруктовые рулетики',
          ingredients: [
            'изюм',
            'чернослив',
            'абрикосы',
          ],
        ),
        Meal(
          videoId: 'VrSM_4vPVQY',
          name: 'Сушеные морские водоросли',
          ingredients: [
            'морские водросли',
          ],
        ),
      ],
    );
  }

}