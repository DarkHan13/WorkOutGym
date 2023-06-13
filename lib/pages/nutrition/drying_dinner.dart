import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:work_out_gym/pages/nutrition/four_meal.dart';
import 'package:work_out_gym/pages/nutrition/meal.dart';
import 'package:work_out_gym/translations/locale_keys.g.dart';

class DryingDinner extends StatelessWidget {
  const DryingDinner({super.key});

  @override
  Widget build(BuildContext context) {
    return FourMeal(
        title: LocaleKeys.fat_los_Dinner.tr(),
        meals: [
          Meal(
              videoId: 'WDFOUiduTYc',
              name: LocaleKeys.Grilled_chicken_with_vegetables.tr(),
              ingredients: [
                LocaleKeys.chicken_breast.tr(),
                LocaleKeys.butter.tr(),
                LocaleKeys.zucchini.tr(),
                LocaleKeys.eggplant.tr(),
                LocaleKeys.Bell_pepper.tr(),
                LocaleKeys.spinach.tr(),
              ],
          ),
          Meal(
              videoId: 'ybBW12ZfHMI',
              name: LocaleKeys.Steam_fish_with_baked_potatoes_and_green_peas.tr(),
              ingredients: [
                LocaleKeys.sea_bass.tr(),
                LocaleKeys.several_sm_potatoes.tr(),
                LocaleKeys.green_peas.tr(),
              ],
          ),
          Meal(
              videoId: 'L3j_BLWqJSU',
              name: LocaleKeys.Omelet_w_vegetables.tr(),
              ingredients: [
                LocaleKeys.egg_protein.tr(),
                LocaleKeys.spinach.tr(),
                LocaleKeys.mushrooms.tr(),
                LocaleKeys.onion.tr(),
                LocaleKeys.tomatoes.tr(),
                LocaleKeys.omelette.tr(),
              ],
          ),
          Meal(
              videoId: '7x7ccTt0tIo',
              name: LocaleKeys.Steamed_vegetables_with_couscous.tr(),
              ingredients: [
                LocaleKeys.carrot.tr(),
                LocaleKeys.broccoli.tr(),
                LocaleKeys.Bell_pepper.tr(),
                LocaleKeys.cauliflower.tr(),
                LocaleKeys.onion.tr(),
                LocaleKeys.couscous.tr(),
              ],
          ),
        ],
    );
  }

}