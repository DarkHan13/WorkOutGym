import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_out_gym/pages/nutrition/four_meal.dart';
import 'package:work_out_gym/pages/nutrition/meal.dart';

class DryingDinner extends StatelessWidget {
  const DryingDinner({super.key});

  @override
  Widget build(BuildContext context) {
    return FourMeal(
        title: 'fat_los_Dinner'.tr,
        meals: [
          Meal(
              videoId: 'WDFOUiduTYc',
              name: 'Grilled_chicken_with_vegetables'.tr,
              ingredients: [
                'chicken_breast'.tr,
                'butter'.tr,
                'zucchini'.tr,
                'eggplant'.tr,
                'Bell_pepper'.tr,
                'spinach'.tr,
              ],
          ),
          Meal(
              videoId: 'ybBW12ZfHMI',
              name: 'Steam_fish_with_baked_potatoes_and_green_peas'.tr,
              ingredients: [
                'sea_bass'.tr,
                'several_sm_potatoes'.tr,
                'green_peas'.tr,
              ],
          ),
          Meal(
              videoId: 'L3j_BLWqJSU',
              name: 'Omelet_w_vegetables'.tr,
              ingredients: [
                'egg_protein'.tr,
                'spinach'.tr,
                'mushrooms'.tr,
                'onion'.tr,
                'tomatoes'.tr,
                'omelette'.tr,
              ],
          ),
          Meal(
              videoId: '7x7ccTt0tIo',
              name: 'Steamed_vegetables_with_couscous'.tr,
              ingredients: [
                'carrot'.tr,
                'broccoli'.tr,
                'Bell_pepper'.tr,
                'cauliflower'.tr,
                'onion'.tr,
                'couscous'.tr,
              ],
          ),
        ],
    );
  }

}