import 'package:flutter/material.dart';
import 'package:work_out_gym/pages/nutrition/four_meal.dart';
import 'package:work_out_gym/pages/nutrition/meal.dart';

class DryingLunch extends StatelessWidget {
  const DryingLunch({super.key});

  @override
  Widget build(BuildContext context) {
    return const FourMeal(
        title: 'Сушка: Обед',
        meals: [
          Meal(
              videoId: '3GU2XIwOKKU',
              name: 'Греческий салат с киноа и тунцом',
              ingredients: [
                'киноа',
                'кубики огурца',
                'нарезанные черри-помидоры',
                'кусочки красного лука',
                'маслины без косточек',
                'кусочки тунца',
                'лимонным соком',
                'оливковым маслом',
                'базилик',
                'петрушка',
              ],
          ),
          Meal(
              videoId: 'SOHYqMP4gEQ',
              name: 'Легкий овощной суп',
              ingredients: [
                'нежирный бульон',
                'морковь',
                'цветная капуста',
                'брокколи',
                'лук',
                'спаржа',
                'кусочки куриного филе',
              ],
          ),
          Meal(
              videoId: 'YaQ_8VyCiqM',
              name: 'Тунцовый стейк с овощами на гриле',
              ingredients: [
                'цукини',
                'баклажаны',
                'сладкий перец',
                'листьями свежего салата',
                'тунец',
              ],
          ),
          Meal(
              videoId: 'hs2u2OqNMRM',
              name: 'Куриный шашлык с овощами',
              ingredients: [
                'кусочки куриного филе',
                'цветной паприкой',
                'луком',
                'кусочками кабачка',
              ],
          ),
        ],
    );
  }

}