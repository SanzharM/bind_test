import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'transactions_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        toolbarHeight: 0,
      ),
      body: Center(
        child: CupertinoButton(
          onPressed: () {
            final route = CupertinoPageRoute(builder: (context) => const TransactionsPage());
            Navigator.of(context).push(route);
          },
          child: const Text('to transactions page'),
        ),
      ),
    );
  }
}
