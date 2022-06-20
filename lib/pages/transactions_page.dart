import 'package:bind_test/constants.dart';
import 'package:bind_test/models/currency.dart';
import 'package:bind_test/models/transaction.dart';
import 'package:bind_test/widgets/cells.dart';
import 'package:bind_test/widgets/transactions/currency_widget.dart';
import 'package:bind_test/widgets/transactions/transaction_builder.dart';
import 'package:bind_test/widgets/transactions/transaction_history.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  final Map<DateTime, List<Transaction>> transactions = {};
  bool isMoneyHidden = false;
  late Currency _currency;

  @override
  void initState() {
    super.initState();
    _currency = Constants.currencies.first;
    transactions.addAll(Constants.transactions);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          padding: EdgeInsets.zero,
          icon: const Icon(Icons.arrow_back_sharp),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.ios_share_sharp),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(color: Colors.black),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const SizedBox(height: 24.0),
                  CurrencyWidget(
                    currency: _currency,
                    toggleVisibility: () => setState(() => isMoneyHidden = !isMoneyHidden),
                    isMoneyHidden: isMoneyHidden,
                  ),
                  const SizedBox(height: 16.0),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    transitionBuilder: (child, animation) => ScaleTransition(scale: animation, child: child),
                    child: isMoneyHidden
                        ? const SizedBox(height: 23.0)
                        : Align(
                            alignment: Alignment.center,
                            child: Text(
                              '${_currency.symbol} 180,970.83',
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w600),
                            ),
                          ),
                  ),
                  const SizedBox(height: 16.0),
                  TransactionHistory(
                    currency: _currency,
                    chooseCurrency: _chooseCurrency,
                    chooseDateFilter: _chooseDateFilter,
                    chooseTransactionType: _chooseTransactionType,
                  ),
                  const SizedBox(height: 24.0),
                ],
              ),
            ),
            TransactionBuilder(transactions: transactions),
          ],
        ),
      ),
    );
  }

  void _chooseCurrency() async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
      isScrollControlled: true,
      builder: (_) => StatefulBuilder(
        builder: (context, newSetState) => ListView.separated(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16.0),
          itemCount: Constants.currencies.length,
          separatorBuilder: (_, iter) => const SizedBox(height: 4.0),
          itemBuilder: (_, i) => LineCell(
            title: Constants.currencies[i].toString(),
            icon: _currency.id == i ? const Icon(CupertinoIcons.check_mark_circled_solid) : const Icon(CupertinoIcons.circle),
            onTap: () {
              setState(() => _currency = Constants.currencies[i]);
              newSetState(() => _currency = Constants.currencies[i]);
              return;
            },
          ),
        ),
      ),
    );
  }

  void _chooseTransactionType() async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
      isScrollControlled: true,
      builder: (_) => ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        children: [
          LineCell(
            leading: const Icon(CupertinoIcons.cart),
            icon: const Icon(CupertinoIcons.forward),
            title: 'Products',
            onTap: () => Navigator.of(context).pop(),
          ),
          LineCell(
            leading: const Icon(Icons.movie_creation_outlined),
            icon: const Icon(CupertinoIcons.forward),
            title: 'Cinema',
            onTap: () => Navigator.of(context).pop(),
          ),
          LineCell(
            leading: const Icon(Icons.restaurant),
            icon: const Icon(CupertinoIcons.forward),
            title: 'Restaurants',
            onTap: () => Navigator.of(context).pop(),
          ),
          LineCell(
            leading: const Icon(CupertinoIcons.car),
            icon: const Icon(CupertinoIcons.forward),
            title: 'Taxi',
            onTap: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  void _chooseDateFilter() async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
      isScrollControlled: true,
      builder: (_) => ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        children: [
          LineCell(
            title: 'Weekly',
            icon: const Icon(CupertinoIcons.forward),
            onTap: () => Navigator.of(context).pop(),
          ),
          LineCell(
            title: 'Monthly',
            icon: const Icon(CupertinoIcons.forward),
            onTap: () => Navigator.of(context).pop(),
          ),
          LineCell(
            title: 'For 6 months',
            icon: const Icon(CupertinoIcons.forward),
            onTap: () => Navigator.of(context).pop(),
          ),
          LineCell(
            title: 'Per year',
            icon: const Icon(CupertinoIcons.forward),
            onTap: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
