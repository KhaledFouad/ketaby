import 'package:flutter/material.dart';
import 'package:ketaby/feature/wishList/presentation/cubits/get_favourites_cubit/get_favourites_cubit.dart';
import 'package:ketaby/feature/wishList/presentation/view/widgets/favourites_view_body.dart';

class FavouritesView extends StatefulWidget {
  const FavouritesView({Key? key}) : super(key: key);

  @override
  State<FavouritesView> createState() => _FavouritesViewState();
}

class _FavouritesViewState extends State<FavouritesView> {
  @override
  void initState() {
    GetFavouritesCubit.get(context).getFavourites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var favourites;
    return Scaffold(
      appBar: AppBar(
        // leading: const CustomBackButton(),
        title: const Text("favourites"),
      ),
      body: const FavouritesViewBody(),
    );
  }
}
