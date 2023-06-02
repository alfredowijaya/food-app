import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: detail == null
                        ? [const MenuDetailSkeleton()]
                        : [
                            Image.network(detail.thumbnail),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    detail.name,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  Text(
                                    "${detail.category} | ${detail.area}",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Indgridients",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  ...detail.ingridients.map(
                                    (indgridient) => Text(
                                      "${indgridient.ingredients} (${indgridient.measurement})",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Instruction",
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    detail.instructions,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).padding.bottom,
                                  ),
                                ],
                              ),
                            ),
                          ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top,
                  ),
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
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
