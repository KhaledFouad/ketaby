import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ketaby/feature/Cart/presentation/cubits/get_cart_cubit/get_cart_cubit.dart';
import 'package:ketaby/feature/Cart/presentation/cubits/get_cart_cubit/get_cart_state.dart';
import 'package:ketaby/feature/Cart/presentation/view/widgets/cart_view_body.dart';
import 'package:ketaby/feature/Cart/presentation/view/widgets/checkoutButton.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    GetCartCubit.get(context).getCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<GetCartCubit, GetCartState>(builder: (context, state) {
      if (state is GetCartSuccessState) {
        return Scaffold(
            appBar: AppBar(
              title: const Text("Cart"),
            ),
            body: const CartViewBody(),
            bottomNavigationBar: CheckOutButton(
                price:
                    // GetCartCubit.get(context).products!.data!.cartItems!.isNotEmpty
                    //     ?
                    state.prudutes.data!.total!
                // :
                // "0.00",
                ));
      }
      return const SizedBox.shrink();
    });
  }
}
