import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_out_gym/pages/nutrition/four_meal.dart';
import 'package:work_out_gym/pages/nutrition/meal.dart';

class DryingBreakfast extends StatelessWidget {
  const DryingBreakfast({super.key});

  @override
  Widget build(BuildContext context) {
    return FourMeal(
        title: 'fat_los_Breakfast'.tr,
        meals: [
          Meal(
            videoId: 'pXxnjW0LvP8',
            name: 'Bacon_and_eggs'.tr,
            ingredients: [
            'eggs'.tr,
            'onion'.tr,
            'bacon'.tr,
            'sausages'.tr,
            'cheese'.tr,
            ],
          ),
          Meal(
            videoId: 'p4ls3IqHydw',
            name: 'fruit_muesli'.tr,
            ingredients: [
            'dried_fruits'.tr,
            'warm_water'.tr,
            'milk'.tr,
            ],
          ),
          Meal(
            videoId: 'iBDd1mMzzIQ',
            name: 'Banana_chips_with_yogurt'.tr,
            ingredients: [
            'dried_bananas'.tr,
            'yogurt'.tr,
            'fresh_berries'.tr,
            ],
          ),
          Meal(
            videoId: 'OfUSaV3yp58',
            name: 'oatmeal_cookies'.tr,
            ingredients: [
            'cereals'.tr,
            'raisin'.tr,
            'coconut_flakes'.tr,
            'honey'.tr,
            'vegetable_oil'.tr,
            ],
          ),
        ]
    );
  }

}