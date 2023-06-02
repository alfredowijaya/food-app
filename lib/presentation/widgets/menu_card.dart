import 'package:flutter/material.dart';
import 'package:food_app/constant/colors_constant.dart';
import 'package:food_app/constant/routes_constant.dart';
import 'package:food_app/domain/entities/menu.dart';
import 'package:food_app/presentation/arguments/menu_detail_page_argument.dart';

class Menucard extends StatelessWidget {
  final Menu menu;

  const Menucard({
    Key? key,
    required this.menu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        RoutesConstant.menuDetail,
        arguments: MenuDetailPageArgument(
          id: menu.id,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
            color: ColorConstants.white,
            borderRadius: BorderRadius.circular(20)),
        width: (MediaQuery.of(context).size.width / 2) - 22,
        height: ((MediaQuery.of(context).size.width / 2) - 22) * 4 / 3,
        child: Stack(
          children: [
            Positioned(
              left: 5,
              top: 5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  menu.thumbnail,
                  fit: BoxFit.cover,
                  width: (MediaQuery.of(context).size.width / 2) - 32,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text(
                      menu.name,
                      style: Theme.of(context).textTheme.bodyMedium!.merge(
                            const TextStyle(
                              color: ColorConstants.darkGrey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
