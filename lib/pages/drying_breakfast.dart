import 'package:flutter/material.dart';
import 'package:work_out_gym/pages/four_meal.dart';
import 'package:work_out_gym/pages/meal.dart';

class DryingBreakfast extends StatelessWidget {
  const DryingBreakfast({super.key});

  @override
  Widget build(BuildContext context) {
    return const FourMeal(
        title: 'Сушка: Завтрак',
        meals: [
          Meal(
            videoId: 'pXxnjW0LvP8',
            name: 'Яичница с беконом',
            ingredients: [
              'яйца куриные',
              'лук',
              'бекон',
              'сосиски',
              'сыр',
            ],
          ),
          Meal(
            videoId: 'p4ls3IqHydw',
            name: 'Фруктовые мюсли',
            ingredients: [
              'сушеные фрукты',
              'теплая вода',
              'молоко',
            ],
          ),
          Meal(
            videoId: 'iBDd1mMzzIQ',
            name: 'Банановые чипсы с йогуртом',
            ingredients: [
              'сушеные бананы',
              'йогурт',
              'свежие ягоды',
            ],
          ),
          Meal(
            videoId: 'OfUSaV3yp58',
            name: 'Овсяные печенья',
            ingredients: [
              'овсяные хлопья',
              'изюм',
              'кокосова стружка',
              'мед',
              'растительное масло',
            ],
          ),
        ]
    );
  }

}