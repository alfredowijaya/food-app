import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/domain/entities/menu.dart';
import 'package:food_app/presentation/cubits/menu/menu_cubit.dart';
import 'package:food_app/presentation/cubits/menu/menu_state.dart';
import 'package:food_app/presentation/widgets/menu_card.dart';

class HomeMenuList extends StatelessWidget {
  const HomeMenuList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuCubit, MenuCubitState>(
      builder: (_, state) {
        List<Menu> menus = state.menus;

        return GridView.builder(
          primary: false,
          physics:
              const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
          shrinkWrap: true,
          padding: const EdgeInsets.only(
            top: 10,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
          ),
          itemBuilder: (_, index) => Menucard(
            menu: menus[index],
          ),
          itemCount: state.menus.length,
        );
      },
    );
  }
}
