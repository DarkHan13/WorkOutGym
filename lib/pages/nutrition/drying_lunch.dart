import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_out_gym/pages/nutrition/four_meal.dart';
import 'package:work_out_gym/pages/nutrition/meal.dart';

class DryingLunch extends StatelessWidget {
  const DryingLunch({super.key});

  @override
  Widget build(BuildContext context) {
    return FourMeal(
        title: 'fat_los_lunch'.tr,
        meals: [
          Meal(
              videoId: '3GU2XIwOKKU',
              name: 'Greek_salad_with_quinoa_and_tuna'.tr,
              ingredients: [
                'quinoa'.tr,
                'cucumber_cubes'.tr,
                'chopped_cherry_tomatoes'.tr,
                'red_onion_slices'.tr,
                'pitted_olives'.tr,
                'pieces_of_tuna'.tr,
                'lemon_juice'.tr,
                'olive_oil'.tr,
                'basil'.tr,
                'parsley'.tr,
              ],
          ),
          Meal(
              videoId: 'SOHYqMP4gEQ',
              name: 'Light_vegetable_soup'.tr,
              ingredients: [
                'low_fat_broth'.tr,
                'carrot'.tr,
                'cauliflower'.tr,
                'broccoli'.tr,
                'onion'.tr,
                'asparagus'.tr,
                'chicken_fillet_pieces'.tr,
              ],
          ),
          Meal(
              videoId: 'YaQ_8VyCiqM',
              name: 'Tuna_steak_with_grilled_vegetables'.tr,
              ingredients: [
                'zucchini'.tr,
                'eggplant'.tr,
                'Bell_pepper'.tr,
                'fresh_lettuce_leaves'.tr,
                'tuna'.tr,
              ],
          ),
          Meal(
              videoId: 'hs2u2OqNMRM',
              name: 'Chicken_skewers_with_vegetables'.tr,
              ingredients: [
                'chicken_fillet_pieces'.tr,
                'colored_paprika'.tr,
                'onion'.tr,
                'zucchini_slices'.tr,
              ],
          ),
        ],
    );
  }

}