import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/core/errors/failures.dart';
import 'package:ketaby/feature/Cart/data/model/cart/cart_item.dart';
import 'package:ketaby/feature/Cart/data/repository/cart_repository.dart';
import 'package:meta/meta.dart';

part 'remove_from_cart_state.dart';

class RemoveFromCartCubit extends Cubit<RemoveFromCartState> {
  RemoveFromCartCubit(this.cartRepository) : super(RemoveFromCartInitial());

  static RemoveFromCartCubit get(BuildContext context) =>
      BlocProvider.of(context);

  final CartRepository cartRepository;

  List<CartItem> products = [];

  Future<void> removeFromCart({required String bookId}) async {
    emit(RemoveFromCartLoadingState());
    Either<Failure, List<CartItem>> result;
    
    result = await cartRepository.removeFromCart(bookId: bookId);
    result.fold((failure) {
      emit(RemoveFromCartFailureState(failure.error));
    }, (products) {
      this.products = products;
      print(products.length);
      emit(RemoveFromCartSuccessState(products));
    });
  }
}
