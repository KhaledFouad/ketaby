import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/feature/Cart/data/model/cart/cart_item.dart';
import 'package:ketaby/feature/Cart/data/repository/cart_repository.dart';
import 'package:ketaby/feature/Cart/presentation/cubits/add_to_cart_cubit/add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit(this.cartRepository)
      : super(AddToCartInitialState());

  static AddToCartCubit get(BuildContext context) =>
      BlocProvider.of(context);

  final CartRepository cartRepository;

  List<CartItem> products = [];

  Future<void> addToCart({required String bookId}) async {
    emit(AddToCartLoadingState());
    Either<Failure, List<CartItem>> result;
    result = await cartRepository.addToCart(bookId: bookId);
    result.fold((failure) {
      emit(AddToCartFailureState(failure.error));
    }, (products) {
      this.products = products;
      print(products.length);
      emit(AddToCartSuccessState(products));
    });
  }
}
