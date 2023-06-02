import 'package:flutter/material.dart';
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
      child: Card(
        color: Colors.grey,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                menu.thumbnail,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: (MediaQuery.of(context).size.width / 2) - 28,
                padding: const EdgeInsets.all(8),
                child: Text(
                  menu.name,
                  style: Theme.of(context).textTheme.bodyLarge!.merge(
                        const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                  maxLines: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
