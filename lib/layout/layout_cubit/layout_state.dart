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
