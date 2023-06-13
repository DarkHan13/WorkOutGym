import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:work_out_gym/pages/nutrition/four_meal.dart';
import 'package:work_out_gym/pages/nutrition/meal.dart';
import 'package:work_out_gym/translations/locale_keys.g.dart';

class DryingSnacks extends StatelessWidget {
  const DryingSnacks({super.key});

  @override
  Widget build(BuildContext context) {
    return FourMeal(
      title: LocaleKeys.fat_los_Snack.tr(),
      meals: [
        Meal(
          videoId: 'w_2UIG4Wyl0',
          name: LocaleKeys.Dried_vegetable_chips.tr(),
          ingredients: [
            LocaleKeys.carrot.tr(),
            LocaleKeys.beet.tr(),
            LocaleKeys.Bell_pepper.tr(),
            LocaleKeys.sweet_potato.tr(),
          ],
        ),
        Meal(
          videoId: 'U2NtcQhQEB4',
          name: LocaleKeys.Dried_nuts_and_seeds.tr(),
          ingredients: [
            LocaleKeys.almond.tr(),
            LocaleKeys.hazelnut.tr(),
            LocaleKeys.Walnut.tr(),
            LocaleKeys.sunflower_seeds.tr(),
            LocaleKeys.pumpkin_seeds.tr(),
          ],
        ),
        Meal(
          videoId: 'OoOyWPfS_4w',
          name: LocaleKeys.Dried_fruit_rolls.tr(),
          ingredients: [
            LocaleKeys.raisin.tr(),
            LocaleKeys.prunes.tr(),
            LocaleKeys.apricots.tr(),
          ],
        ),
        Meal(
          videoId: 'VrSM_4vPVQY',
          name: LocaleKeys.dried_seaweed.tr(),
          ingredients: [
              LocaleKeys.seaweed.tr(),
          ],
        ),
      ],
    );
  }

}