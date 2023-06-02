import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/constant/colors_constant.dart';
import 'package:food_app/presentation/cubits/menu_category/menu_category_cubit.dart';
import 'package:food_app/presentation/cubits/menu_category/menu_category_state.dart';

// ignore: must_be_immutable
class HomeMenuSelection extends StatelessWidget {
  String? selectedMenuCategories;
  void Function(String? value) onChanged;
  HomeMenuSelection({
    Key? key,
    required this.selectedMenuCategories,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuCategoryCubit, MenuCategoryCubitState>(
      builder: (_, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 20),
              child: Text(
                "Categories",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: ColorConstants.darkGrey,
                  width: 1,
                ),
              ),
              width: double.infinity,
              child: DropdownButtonHideUnderline(
                key: const Key("Dropdown"),
                child: DropdownButton(
                  borderRadius: BorderRadius.circular(25),
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: ColorConstants.darkGrey,
                  ),
                  value: selectedMenuCategories,
                  items: state.categories
                      .map(
                        (item) => DropdownMenuItem(
                          value: item.category,
                          child: Text(
                            item.category,
                            style: Theme.of(context).textTheme.bodyLarge!.merge(
                                  const TextStyle(
                                    color: ColorConstants.darkGrey,
                                  ),
                                ),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: onChanged,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
