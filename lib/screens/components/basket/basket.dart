import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Product {

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.img,
  });

  int id;
  String name;
  double price;
  String img;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    img: json["img"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "img": img,
  };

  static Future<List<Product>> loadData() async {
    return Future.delayed(const Duration(seconds: 3), (){
      return [
        Product(id: 0, name: 'Carrot', price: 50.0, img: 'assets/images/shopping/carrot.png'),
        Product(id: 1, name: 'Eggplant', price: 155.0, img: 'assets/images/shopping/eggplant.png'),
        Product(id: 2, name: 'Broccoli', price: 85.5, img: 'assets/images/shopping/broccoli.png'),
        Product(id: 3, name: 'Paprika', price: 90.0, img: 'assets/images/shopping/paprika.png'),
        Product(id: 4, name: 'Pumpkin', price: 70.0, img: 'assets/images/shopping/pumpkin.png'),
      ];
    });
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
          Badge(
            position: BadgePosition.topEnd(top: 0, end: 3),
            animationDuration: const Duration(milliseconds: 300),
            animationType: BadgeAnimationType.slide,
            badgeContent: Text(
              "11",
              style: TextStyle(color: Colors.white),
            ),
            child: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: FutureBuilder<List<Product>>(
            future: Product.loadData(),
            builder: (context, snap){
              if(snap.connectionState == ConnectionState.done) {
                return ListView.builder(
                  itemCount: snap.data?.length,
                    itemBuilder: (context, idx) => Card(
                      child: ListTile(
                        onTap: (){},
                        title: SizedBox(
                          height: 300,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 2,
                                  child: Image(
                                    image: AssetImage(snap.data![idx].img),
                                  ),
                              ),
                              const SizedBox(height: 15,),
                              Expanded(
                                  child: Text(
                                    snap.data![idx].name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                              ),
                              Expanded(
                                  child: Row(
                                    children: [
                                      Text(
                                        '${snap.data![idx].price} rub.',
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                            ],
                          ),
                        )
                      ),
                    )
                );
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





// class BlocConsumerExample extends StatelessWidget {
//   const BlocConsumerExample({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//         home: CounterPage());
//   }
// }
//
// class CounterPage extends StatelessWidget {
//   const CounterPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => CounterBloc(),
//       child: const CounterView(),
//     );
//   }
// }
//
// class CounterView extends StatelessWidget {
//   const CounterView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Basket"),
//         centerTitle: true,
//         // backgroundColor: args.bgcolor,
//         actions: [
//           Badge(
//             position: BadgePosition.topEnd(top: 0, end: 3),
//             animationDuration: Duration(milliseconds: 300),
//             animationType: BadgeAnimationType.slide,
//             badgeContent: Text(
//               "11",
//               style: TextStyle(color: Colors.white),
//             ),
//             child: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
//           ),
//         ],
//       ),
//       body: Center(
//         child: BlocConsumer<CounterBloc, CounterState>(
//           /// Метод должен вернуть true или false. В зависимости от того хотим ли мы вызвать
//           /// listener: (context, CounterState state) у BlocConsumer.
//           listenWhen: (CounterState previous, CounterState current) {
//             if (current.isShowMsg) {
//               return true;
//             } else {
//               return false;
//             }
//           },
//
//           /// Вызывается если listenWhen: (CounterState previous, CounterState current) вернул true.
//           listener: (context, CounterState state) {
//             final snackBar = SnackBar(content: Text(state.msgText));
//             ScaffoldMessenger.of(context).showSnackBar(snackBar);
//           },
//           builder: (context, CounterState counterState) {
//             return Text('${counterState.counterValue}', style: Theme.of(context).textTheme.headline1);
//           },
//         ),
//       ),
//       floatingActionButton: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: <Widget>[
//           FloatingActionButton(
//             child: const Icon(Icons.add),
//             onPressed: () => context.read<CounterBloc>().add(Increment()),
//           ),
//           const SizedBox(height: 4),
//           FloatingActionButton(
//             child: const Icon(Icons.remove),
//             onPressed: () => context.read<CounterBloc>().add(Decrement()),
//           ),
//           const SizedBox(height: 4),
//         ],
//       ),
//     );
//   }
// }
//
// /// Родительский Event. Создан специально для наследования от него дочерних Event`ов
// class CounterEvent {}
//
// /// Event который View отправляет в Bloc когда мы увеличиваем счетчик. Нажимаем на кнопку "+"
// class Increment extends CounterEvent {}
//
// /// Event который View отправляет в Bloc когда мы уменьшаем счетчик. Нажимаем на кнопку "-"
// class Decrement extends CounterEvent {}
//
// /// Состояение которое Bloc передаёт во View
// class CounterState {
//   final int counterValue;
//   final String msgText;
//   final bool isShowMsg;
//
//   CounterState({required this.counterValue, this.msgText = '', this.isShowMsg = false});
// }
//
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