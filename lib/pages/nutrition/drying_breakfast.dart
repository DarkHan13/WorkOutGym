import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:work_out_gym/pages/nutrition/four_meal.dart';
import 'package:work_out_gym/pages/nutrition/meal.dart';
import 'package:work_out_gym/translations/locale_keys.g.dart';

class DryingBreakfast extends StatelessWidget {
  const DryingBreakfast({super.key});

  @override
  Widget build(BuildContext context) {
    return FourMeal(
        title: LocaleKeys.fat_los_Breakfast.tr(),
        meals: [
          Meal(
            videoId: 'pXxnjW0LvP8',
            name: LocaleKeys.Bacon_and_eggs.tr(),
            ingredients: [
            LocaleKeys.eggs.tr(),
            LocaleKeys.onion.tr(),
            LocaleKeys.bacon.tr(),
            LocaleKeys.sausages.tr(),
            LocaleKeys.cheese.tr(),
            ],
          ),
          Meal(
            videoId: 'p4ls3IqHydw',
            name: LocaleKeys.fruit_muesli.tr(),
            ingredients: [
            LocaleKeys.dried_fruits.tr(),
            LocaleKeys.warm_water.tr(),
            LocaleKeys.milk.tr(),
            ],
          ),
          Meal(
            videoId: 'iBDd1mMzzIQ',
            name: LocaleKeys.Banana_chips_with_yogurt.tr(),
            ingredients: [
            LocaleKeys.dried_bananas.tr(),
            LocaleKeys.yogurt.tr(),
            LocaleKeys.fresh_berries.tr(),
            ],
          ),
          Meal(
            videoId: 'OfUSaV3yp58',
            name: LocaleKeys.oatmeal_cookies.tr(),
            ingredients: [
            LocaleKeys.cereals.tr(),
            LocaleKeys.raisin.tr(),
            LocaleKeys.coconut_flakes.tr(),
            LocaleKeys.honey.tr(),
            LocaleKeys.vegetable_oil.tr(),
            ],
          ),
        ]
    );
  }

}