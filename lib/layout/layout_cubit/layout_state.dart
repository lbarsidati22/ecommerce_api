abstract class LayoutState {}

class LayoutInitialState extends LayoutState {}

class GetUserSuccsessSatate extends LayoutState {}

class GetUserLeadingSatate extends LayoutState {}

class GetUserErrorSatate extends LayoutState {
  final String error;
  GetUserErrorSatate({
    required this.error,
  });
}

class GetBannersSuccsessSatate extends LayoutState {}

class GetBannersLeadingSatate extends LayoutState {}

class GetBannersErrorSatate extends LayoutState {
  final String error;
  GetBannersErrorSatate({
    required this.error,
  });
}

class GetCategorySuccsessSatate extends LayoutState {}

class GetCategoryLeadingSatate extends LayoutState {}

class GetPrudactSuccsessSatate extends LayoutState {}

class GetPrudactErrorSatate extends LayoutState {}

class GetCategoryErrorSatate extends LayoutState {
  final String error;
  GetCategoryErrorSatate({
    required this.error,
  });
}

class ChangNavBarSatate extends LayoutState {}

class FillterPrudactSuccsesState extends LayoutState {}

class GetFavoriteSuccsessState extends LayoutState {}

class GetFavoriteErrorState extends LayoutState {}

class AddOrRemoveFavoriteSuccessState extends LayoutState {}

class AddOrRemoveFavoriteErrorState extends LayoutState {}

class GetCartsSuccsessState extends LayoutState {}

class GetCartsErrorState extends LayoutState {}

class AddOrRemoveCartsSuccessState extends LayoutState {}

class AddOrRemoveCartsErrorState extends LayoutState {}

class ChangPasswordSuccsessState extends LayoutState {}

class ChangPasswordLeadingState extends LayoutState {}

class ChangPasswordErrorsState extends LayoutState {
  String error;
  ChangPasswordErrorsState({
    required this.error,
  });
}

class UpdateUserSuccsessState extends LayoutState {}

class UpdateUserLeadingState extends LayoutState {}

class UpdateUserErrorsState extends LayoutState {
  String error;
  UpdateUserErrorsState({
    required this.error,
  });
}
