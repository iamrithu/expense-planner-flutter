import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyAppPage(),
    );
  }
}

class MyAppPage extends StatelessWidget {
  const MyAppPage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final List<Transaction> transaction = [
      Transaction(
          id: '1', date: DateTime.now(), title: "new shirt", amount: 350),
      Transaction(
          id: '2', date: DateTime.now(), title: "new bag", amount: 2000),
      Transaction(
          id: '3', date: DateTime.now(), title: "new shoes", amount: 1250),
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('rithi'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
              children: transaction.map((e) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.purple,
                          width: 2,
                        )),
                        child: Text(
                          '\$ ${e.amount}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.purple),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e.title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          Text(
                            DateFormat('dd/MM/yyyy/').format(e.date),
                            style: const TextStyle(color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
