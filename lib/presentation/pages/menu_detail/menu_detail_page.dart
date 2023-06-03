import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/constant/colors_constant.dart';
import 'package:food_app/domain/entities/menu_detail.dart';
import 'package:food_app/presentation/arguments/menu_detail_page_argument.dart';
import 'package:food_app/presentation/cubits/menu_detail/menu_detail_cubit.dart';
import 'package:food_app/presentation/cubits/menu_detail/menu_detail_state.dart';
import 'package:food_app/presentation/widgets/menu_detail_skeleton.dart';

class MenuDetailPage extends StatefulWidget {
  final MenuDetailPageArgument arguments;

  const MenuDetailPage({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  @override
  State<MenuDetailPage> createState() => _MenuDetailPageState();
}

class _MenuDetailPageState extends State<MenuDetailPage> {
  late MenuDetailCubit _menuDetailCubit;

  Future onGetDetail(String id) async {
    await _menuDetailCubit.fetchMenuDetail(id);
  }

  Future onRefresh() async {
    onGetDetail(widget.arguments.id);
  }

  @override
  void initState() {
    _menuDetailCubit = BlocProvider.of<MenuDetailCubit>(context);

    onRefresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: BlocBuilder<MenuDetailCubit, MenuDetailCubitState>(
          builder: (_, state) {
            MenuDetail? detail = state.detail;
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 120,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          color: ColorConstants.blackBackgound,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "TheKitchen~",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(color: ColorConstants.white),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                  color: ColorConstants.primary,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.shopping_cart,
                                    size: 24,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '2',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: detail == null
                            ? [const MenuDetailSkeleton()]
                            : [
                                Container(
                                  decoration: const BoxDecoration(
                                    color: ColorConstants.blackBackgound,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      topRight: Radius.circular(25),
                                    ),
                                    child: Image.network(detail.thumbnail),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        detail.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium,
                                      ),
                                      Text(
                                        "${detail.category} | ${detail.area}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                              color: ColorConstants.lightGrey,
                                            ),
                                      ),
                                      const SizedBox(
                                        height: 40,
                                      ),
                                      Text(
                                        "Indgridients :",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      ...detail.ingridients.map(
                                        (indgridient) => Text(
                                          "${indgridient.ingredients} (${indgridient.measurement})",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 40,
                                      ),
                                      Text(
                                        "Instruction :",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        detail.instructions,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                      SizedBox(
                                        height: MediaQuery.of(context)
                                            .padding
                                            .bottom,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
