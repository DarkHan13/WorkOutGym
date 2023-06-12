import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_out_gym/pages/nutrition/four_meal.dart';
import 'package:work_out_gym/pages/nutrition/meal.dart';

class DryingSnacks extends StatelessWidget {
  const DryingSnacks({super.key});

  @override
  Widget build(BuildContext context) {
    return FourMeal(
      title: 'fat_los_Snack'.tr,
      meals: [
        Meal(
          videoId: 'w_2UIG4Wyl0',
          name: 'Dried_vegetable_chips'.tr,
          ingredients: [
            'carrot'.tr,
            'beet'.tr,
            'Bell_pepper'.tr,
            'sweet_potato'.tr,
          ],
        ),
        Meal(
          videoId: 'U2NtcQhQEB4',
          name: 'Dried_nuts_and_seeds'.tr,
          ingredients: [
            'almond'.tr,
            'hazelnut'.tr,
            'Walnut'.tr,
            'sunflower_seeds'.tr,
            'pumpkin_seeds'.tr,
          ],
        ),
        Meal(
          videoId: 'OoOyWPfS_4w',
          name: 'Dried_fruit_rolls'.tr,
          ingredients: [
            'raisin'.tr,
            'prunes'.tr,
            'apricots'.tr,
          ],
        ),
        Meal(
          videoId: 'VrSM_4vPVQY',
          name: 'dried_seaweed'.tr,
          ingredients: [
              'seaweed'.tr,
          ],
        ),
      ],
    );
  }

}