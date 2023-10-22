abstract class UpdateCartState {}

class UpdateCartInitialState extends UpdateCartState {}

class UpdateCartLoadingState extends UpdateCartState {}

class UpdateCartSuccessState extends UpdateCartState {}

class UpdateCartFailureState extends UpdateCartState {
  final String error;
  UpdateCartFailureState(this.error);
}