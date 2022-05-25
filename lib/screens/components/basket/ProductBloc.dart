import 'package:flutter_app/screens/components/basket/basket.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Родительский Event. Создан специально для наследования от него дочерних Event`ов
// class CounterEvent {}
// //
// // /// Event который View отправляет в Bloc когда мы увеличиваем счетчик. Нажимаем на кнопку "+"
// // class Increment extends CounterEvent {}
// //
// // /// Event который View отправляет в Bloc когда мы уменьшаем счетчик. Нажимаем на кнопку "-"
// // class Decrement extends CounterEvent {}
// //
class ProductEvent {
}

class ProductState {
}

/// Состояение которое Bloc передаёт во View
class AddToCart extends ProductEvent {
  late Product item;
  AddToCart({required this.item});
}
class DelCart extends ProductEvent {
  late Product item;
  DelCart({required this.item});
}

class LoadingState extends ProductState {

}
class SuccessState extends ProductState {
  late int count;
  SuccessState({required this.count});
}
class FailState extends ProductState {
  late Error fail;
  FailState({required this.fail});
}

// class CounterState {
//   final int counterValue;
//   final String msgText;
//   final bool isShowMsg;
//
//   CounterState({required this.counterValue, this.msgText = '', this.isShowMsg = false});
// }
//


class ProductBloc extends Bloc<ProductEvent, ProductState> {
  // ProductBloc(initialState) : super(initialState);
  ProductBloc() : super(SuccessState(count: 0));

  List<Product> cartProducts = [];

  Future<Stream<ProductState>> mapEventToState(ProductEvent event) async {
    LoadingState();
    try {
      if (event is AddToCart) {
        cartProducts.add(event.item);
      }
      if (event is DelCart) {
        cartProducts.remove(event.item);
      }
      SuccessState(count: cartProducts.length);
    } catch(error){
      // FailState(fail: error);
    }
    throw UnimplementedError();
  }
  
}

// class CounterBloc extends Bloc<CounterEvent, CounterState> {
//   CounterBloc() : super(CounterState(counterValue: 0)) {
//     on<Increment>((CounterEvent event, Emitter<CounterState> emitter) {
//       if (state.counterValue == 10) {
//         emitter(CounterState(
//           counterValue: state.counterValue + 1,
//           isShowMsg: true,
//           msgText: 'Счётчик равен ${state.counterValue + 1}',
//         ));
//       } else {
//         emitter(CounterState(counterValue: state.counterValue + 1));
//       }
//     });
//
//     on<Decrement>((CounterEvent event, Emitter<CounterState> emitter) {
//       if (state.counterValue == 10) {
//         emitter(CounterState(
//             counterValue: state.counterValue - 1, isShowMsg: true, msgText: 'Счётчик равен ${state.counterValue - 1}'));
//       } else {
//         emitter(CounterState(counterValue: state.counterValue - 1));
//       }
//     });
//   }
// }
