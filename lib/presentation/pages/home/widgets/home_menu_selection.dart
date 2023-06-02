import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: Theme.of(context).primaryColor,
              width: 1,
            ),
          ),
          width: double.infinity,
          child: DropdownButtonHideUnderline(
            key: const Key("Dropdown"),
            child: DropdownButton(
              icon: Icon(
                Icons.arrow_drop_down,
                color: Theme.of(context).primaryColor,
              ),
              value: selectedMenuCategories,
              items: state.categories
                  .map(
                    (item) => DropdownMenuItem(
                      value: item.category,
                      child: Text(
                        item.category,
                        style: Theme.of(context).textTheme.bodyLarge!.merge(
                              TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        );
      },
    );
  }
}
