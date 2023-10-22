import 'package:ketaby/feature/books/data/model/books_model/product.dart';

abstract class AddToFavouritesState {}

final class AddAndRemoveFavouritesInitialState extends AddToFavouritesState {}

class AddToFavouritesLoadingState extends AddToFavouritesState {}

class AddToFavouritesSuccessState extends AddToFavouritesState {
  final List<Product> prudutes;

  AddToFavouritesSuccessState(this.prudutes);
}

class AddToFavouritesFailureState extends AddToFavouritesState {
  final String error;

  AddToFavouritesFailureState(this.error);
}
