import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/feature/books/data/model/books_model/product.dart';
import 'package:ketaby/feature/wishList/data/repository/favourites_repository.dart';
import 'package:ketaby/feature/wishList/presentation/cubits/add_favourites_cubit/add_favourites_state.dart';

class AddToFavouritesCubit extends Cubit<AddToFavouritesState> {
  AddToFavouritesCubit(this.favouritesRepository)
      : super(AddAndRemoveFavouritesInitialState());

  static AddToFavouritesCubit get(BuildContext context) =>
      BlocProvider.of(context);

  final FavouritesRepository favouritesRepository;

  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  List<Product> products = [];

  Future<void> addToFavourites({required String bookId}) async {
    emit(AddToFavouritesLoadingState());
    Either<Failure, List<Product>> result;
    result = await favouritesRepository.addToFavourites(bookId: bookId);
    result.fold((failure) {
      emit(AddToFavouritesFailureState(failure.error));
    }, (products) {
      this.products = products;

      emit(AddToFavouritesSuccessState(products));
    });
  }
}
