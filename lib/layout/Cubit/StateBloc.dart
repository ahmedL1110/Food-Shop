abstract class LayoutState {}

class InitialState extends LayoutState {}

class GetUserLoadingState extends LayoutState {}

class GetUserSuccessState extends LayoutState {}

class GetUserErrorState extends LayoutState {
  final String error;

  GetUserErrorState(this.error);
}

class ChangeBottomNavState extends LayoutState {}

class ChangeAddressState extends LayoutState {}

class ChangeLanguageState extends LayoutState {}

class ChangeNotificationSetting1State extends LayoutState {}

class ChangeNotificationSetting2State extends LayoutState {}

class GetProductsLoadingState extends LayoutState {}

class GetProductsSuccessState extends LayoutState {}

class GetProductsErrorState extends LayoutState {
  final String error;

  GetProductsErrorState(this.error);
}

class GetFavouriteLoadingState extends LayoutState {}

class GetFavouriteSuccessState extends LayoutState {}

class GetFavouriteErrorState extends LayoutState {
  final String error;

  GetFavouriteErrorState(this.error);
}

class CheckFavouriteErrorState extends LayoutState {
  final String error;

  CheckFavouriteErrorState(this.error);
}

class SetFavouriteLoadingState extends LayoutState {}

class SetFavouriteSuccessState extends LayoutState {}

class SetFavouriteErrorState extends LayoutState {
  final String error;

  SetFavouriteErrorState(this.error);
}

class DeleteFavouriteLoadingState extends LayoutState {}

class DeleteFavouriteSuccessState extends LayoutState {}

class DeleteFavouriteErrorState extends LayoutState {
  final String error;

  DeleteFavouriteErrorState(this.error);
}

class UoloadCoverSuccessState extends LayoutState {}

class UoloadCoverErrorState extends LayoutState {}