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

class ChangNavBarSatate extends LayoutState {}
