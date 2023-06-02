import 'package:food_app/domain/entities/menu_detail.dart';

class MenuDetailCubitState {
  MenuDetail? detail;

  MenuDetailCubitState({
    required this.detail,
  });
}

class MenuDetailLoading extends MenuDetailCubitState {
  MenuDetailLoading({required MenuDetail? detail}) : super(detail: detail);
}

class MenuDetailLoaded extends MenuDetailCubitState {
  MenuDetailLoaded({required MenuDetail? detail}) : super(detail: detail);
}

class MenuDetailError extends MenuDetailCubitState {
  MenuDetailError({required MenuDetail? detail}) : super(detail: detail);
}
