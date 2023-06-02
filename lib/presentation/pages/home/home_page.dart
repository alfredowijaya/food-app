import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/presentation/cubits/menu/menu_cubit.dart';
import 'package:food_app/presentation/cubits/menu_category/menu_category_cubit.dart';
import 'package:food_app/presentation/pages/home/widgets/home_menu_list.dart';
import 'package:food_app/presentation/pages/home/widgets/home_title.dart';

import 'widgets/home_menu_selection.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late MenuCategoryCubit _menuCategoryCubit;
  late MenuCubit _menuCubit;

  String? _selectedMenuCategories;

  Future onGetMenu(String category) async {
    await _menuCubit.fetchMenu(category);
  }

  Future onRefresh() async {
    await _menuCategoryCubit.fetchMenuCategories();

    String defaultMenuCategory =
        _menuCategoryCubit.state.categories[0].category;

    if (_selectedMenuCategories == null) {
      setState(() {
        _selectedMenuCategories = defaultMenuCategory;
      });
      await onGetMenu(defaultMenuCategory);
    } else {
      await onGetMenu(_selectedMenuCategories!);
    }
  }

  @override
  void initState() {
    _menuCategoryCubit = BlocProvider.of<MenuCategoryCubit>(context);
    _menuCubit = BlocProvider.of<MenuCubit>(context);

    onRefresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await onRefresh();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeTitle(),
                HomeMenuSelection(
                  selectedMenuCategories: _selectedMenuCategories,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedMenuCategories = value;
                    });

                    onGetMenu(value!);
                  },
                ),
                const HomeMenuList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
