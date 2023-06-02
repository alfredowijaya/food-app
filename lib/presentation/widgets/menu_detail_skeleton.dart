import 'package:flutter/material.dart';
import 'package:food_app/utils/helper.dart';
import 'package:shimmer/shimmer.dart';

class MenuDetailSkeleton extends StatelessWidget {
  const MenuDetailSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Helper.hexCodeToColor('#DCDCDC'),
      highlightColor: Helper.hexCodeToColor('#F5F5F5'),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
            ),
          ],
        ),
      ),
    );
  }
}
