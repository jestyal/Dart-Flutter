import 'package:flutter_bloc/flutter_bloc.dart';
// import 'ProductClass.dart';

/// Родительский Event. Создан специально для наследования от него дочерних Event`ов
class ProductEvent {}

/// Event который View отправляет в Bloc
class AddToCart extends ProductEvent {
  int index;
  AddToCart({required this.index});
}
class RemoveFromCart extends ProductEvent {
  int index;
  RemoveFromCart({required this.index});
}

/// Состояение которое Bloc передаёт во View
class ProductState {
  final int productCountInCart;
  final bool isShowMsg;
  final String msgText;
  final List<bool> productList;

  ProductState({required this.productCountInCart, this.isShowMsg = false, this.msgText = '', productList }) : productList = productList ?? List<bool>.filled(10, false);
}

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductState(productCountInCart: 0)) {
    on<AddToCart>((AddToCart event, Emitter<ProductState> emitter) {
      List<bool> productList = state.productList;
      productList[event.index] = true;
      return emitter(ProductState(
          productCountInCart: state.productCountInCart + 1,
          isShowMsg: true,
          msgText: 'Added to cart',
          productList: productList
      ));
    });

    on<RemoveFromCart>((RemoveFromCart event, Emitter<ProductState> emitter) {
      List<bool> productList = state.productList;
      productList[event.index] = false;
      return emitter(ProductState(
          productCountInCart: state.productCountInCart - 1,
          isShowMsg: true,
          msgText: 'Removed from cart',
          productList: productList
      ));
    });
  }
}