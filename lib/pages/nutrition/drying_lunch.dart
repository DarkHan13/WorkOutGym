import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:work_out_gym/pages/nutrition/four_meal.dart';
import 'package:work_out_gym/pages/nutrition/meal.dart';
import 'package:work_out_gym/translations/locale_keys.g.dart';

class DryingLunch extends StatelessWidget {
  const DryingLunch({super.key});

  @override
  Widget build(BuildContext context) {
    return FourMeal(
        title: LocaleKeys.fat_los_lunch.tr(),
        meals: [
          Meal(
              videoId: '3GU2XIwOKKU',
              name: LocaleKeys.Greek_salad_with_quinoa_and_tuna.tr(),
              ingredients: [
                LocaleKeys.quinoa.tr(),
                LocaleKeys.cucumber_cubes.tr(),
                LocaleKeys.chopped_cherry_tomatoes.tr(),
                LocaleKeys.red_onion_slices.tr(),
                LocaleKeys.pitted_olives.tr(),
                LocaleKeys.pieces_of_tuna.tr(),
                LocaleKeys.lemon_juice.tr(),
                LocaleKeys.olive_oil.tr(),
                LocaleKeys.basil.tr(),
                LocaleKeys.parsley.tr(),
              ],
          ),
          Meal(
              videoId: 'SOHYqMP4gEQ',
              name: LocaleKeys.Light_vegetable_soup.tr(),
              ingredients: [
                LocaleKeys.low_fat_broth.tr(),
                LocaleKeys.carrot.tr(),
                LocaleKeys.cauliflower.tr(),
                LocaleKeys.broccoli.tr(),
                LocaleKeys.onion.tr(),
                LocaleKeys.asparagus.tr(),
                LocaleKeys.chicken_fillet_pieces.tr(),
              ],
          ),
          Meal(
              videoId: 'YaQ_8VyCiqM',
              name: LocaleKeys.Tuna_steak_with_grilled_vegetables.tr(),
              ingredients: [
            LocaleKeys.zucchini.tr(),
    LocaleKeys.eggplant.tr(),
    LocaleKeys.Bell_pepper.tr(),
    LocaleKeys.fresh_lettuce_leaves.tr(),
    LocaleKeys.tuna.tr(),
              ],
          ),
          Meal(
              videoId: 'hs2u2OqNMRM',
              name: LocaleKeys.Chicken_skewers_with_vegetables.tr(),
              ingredients: [
                LocaleKeys.chicken_fillet_pieces,
                LocaleKeys.colored_paprika,
                LocaleKeys.onion,
                LocaleKeys.zucchini_slices,
              ],
          ),
        ],
    );
  }

}