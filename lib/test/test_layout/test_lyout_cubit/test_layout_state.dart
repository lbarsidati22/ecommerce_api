abstract class TestLayoutState {}

class TestLayouttInitialState extends TestLayoutState {}

class TestLayoutnavBarState extends TestLayoutState {}

class TestgetUserDataSuccsess extends TestLayoutState {}

class TestgetUserDataLeading extends TestLayoutState {}

class TestgetUserDataError extends TestLayoutState {
  final String error;
  TestgetUserDataError({
    required this.error,
  });
}

class TestgetBannersDataSuccsess extends TestLayoutState {}

class TestgetBannersDataLeading extends TestLayoutState {}

class TestgetBannersDataError extends TestLayoutState {
  final String error;
  TestgetBannersDataError({
    required this.error,
  });
}

class TestgetCategoryDataSuccsess extends TestLayoutState {}

class TestgetCategoryDataLeading extends TestLayoutState {}

class TestgetCategoryDataError extends TestLayoutState {
  final String error;
  TestgetCategoryDataError({
    required this.error,
  });
}

class TestgetPrudactDataSuccsess extends TestLayoutState {}

class TestgetPrudactDataLeading extends TestLayoutState {}

class TestFillterPrudactSuccsess extends TestLayoutState {}

class TestGetFavoriteSuccsess extends TestLayoutState {}

class TestGetFavoriteError extends TestLayoutState {}

class TestAddOrDeleteFavoriteSuccses extends TestLayoutState {}

class TestAddOrDeleteFavoriteError extends TestLayoutState {}

class TestGetCartsErrorState extends TestLayoutState {}

class TestGetCartsSuccsessState extends TestLayoutState {}

class TestAddOrRemoveCartsSuccsess extends TestLayoutState {
  final String error;
  TestAddOrRemoveCartsSuccsess({
    required this.error,
  });
}

class TestAddOrRemoveCartsError extends TestLayoutState {
  final String error;
  TestAddOrRemoveCartsError({
    required this.error,
  });
}

class TestgetPrudactDataError extends TestLayoutState {
  final String error;
  TestgetPrudactDataError({
    required this.error,
  });
}
