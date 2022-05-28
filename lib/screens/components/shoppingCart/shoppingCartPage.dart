import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'ProductBloc.dart';
import 'ProductClass.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>(
      create: (_) => ProductBloc(),
      child: const ProductListPage(),
    );
  }
}

class ProductListPage extends StatelessWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping App"),
        centerTitle: true,
        backgroundColor: const Color(0xFF916be7),
        actions: [
          BlocConsumer<ProductBloc, ProductState>(listenWhen: (ProductState previous, ProductState current) {
            if (current.isShowMsg) {
              return true;
            } else {
              return false;
            }
          }, listener: (context, ProductState state) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.msgText, style: const TextStyle(color: Colors.white, fontSize: 18)),
              backgroundColor: const Color(0xFF916be7),
            ));
          }, builder: (context, ProductState productsState) {
            return Badge(
                position: BadgePosition.topEnd(top: 0, end: 3),
                animationDuration: const Duration(milliseconds: 300),
                animationType: BadgeAnimationType.slide,
                child: IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () {}),
                badgeContent: Text('${productsState.productCountInCart}', style: const TextStyle(color: Colors.white)));
          }),
        ],
      ),
      backgroundColor: const Color(0xFFC1ABF3),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
          child: FutureBuilder<List<Product>>(
            future: Product.loadData(),
            builder: (context, snap) {
              if (snap.connectionState == ConnectionState.done) {
                return ListView.builder(
                    itemCount: snap.data!.length,
                    itemBuilder: (context, idx) {
                      return BlocBuilder<ProductBloc, ProductState>(builder: (context, ProductState productsState) {
                        return Card(
                          child: ListTile(
                              onTap: () {},
                              title: SizedBox(
                                height: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Image(
                                        image: AssetImage(snap.data![idx].img),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        snap.data![idx].name,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        '${snap.data![idx].price} rub',
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        icon: Icon((productsState.productList)[idx]
                                            ? Icons.shopping_cart
                                            : Icons.shopping_cart_outlined),
                                        onPressed: () => {
                                              if ((productsState.productList)[idx]) {
                                                context.read<ProductBloc>().add(RemoveFromCart(index: idx))
                                              } else {
                                                context.read<ProductBloc>().add(AddToCart(index: idx))
                                              }
                                            }
                                        ),
                                  ],
                                ),
                              )),
                        );
                      });
                    });
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
