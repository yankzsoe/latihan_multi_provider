import 'package:flutter/material.dart';
import 'package:latihan_multi_provider_state/cart.dart';
import 'package:latihan_multi_provider_state/balance.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => Balance()),
            ChangeNotifierProvider(create: (context) => Cart()),
          ],
          child: Scaffold(
            floatingActionButton: Consumer<Cart>(
              builder: (context, cart, _) => Consumer<Balance>(
                builder: (context, balance, _) => FloatingActionButton(
                  onPressed: () {
                    if (balance.money >= 500) {
                      balance.money -= 500;
                      cart.qty += 1;
                    }
                  },
                  child: Icon(Icons.add_shopping_cart),
                  backgroundColor: Colors.purple,
                ),
              ),
            ),
            appBar: AppBar(
              backgroundColor: Colors.purple,
              title: Text("Multi Provider"),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Balance"),
                      Container(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Consumer<Balance>(
                            builder: (context, balance, _) => Text(
                              balance.money.toString(),
                              style: TextStyle(
                                color: Colors.purple,
                              ),
                            ),
                          ),
                        ),
                        height: 30,
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.purple, width: 2)),
                      )
                    ],
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Consumer<Cart>(
                        builder: (context, cart, _) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Apple (500) X " + cart.qty.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              (500 * cart.qty).toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        border: Border.all(color: Colors.purple, width: 2)),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
