import 'package:ketaby/feature/books/data/model/books_model/product.dart';

abstract class RemoveFrmoFavouritesState {}

final class RemoveFrmoFavouritesInitialState
    extends RemoveFrmoFavouritesState {}

class RemoveFrmoFavouritesLoadingState extends RemoveFrmoFavouritesState {}

class RemoveFrmoFavouritesSuccessState extends RemoveFrmoFavouritesState {
  final List<Product> prudutes;

  RemoveFrmoFavouritesSuccessState(this.prudutes);
}

class RemoveFrmoFavouritesFailureState extends RemoveFrmoFavouritesState {
  final String error;

  RemoveFrmoFavouritesFailureState(this.error);
}
