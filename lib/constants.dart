import 'package:bind_test/models/transaction.dart';

import 'models/currency.dart';

class Constants {
  static const List<Currency> currencies = [
    Currency(
      id: 0,
      symbol: '\$',
      shortTitle: 'USD',
      fullTitle: 'Dollar',
      flagUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/2560px-Flag_of_the_United_States.svg.png',
    ),
    Currency(
      id: 1,
      symbol: '€',
      shortTitle: 'EUR',
      fullTitle: 'Euro',
      flagUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Flag_of_Europe.svg/2560px-Flag_of_Europe.svg.png',
    ),
    Currency(
      id: 2,
      symbol: '₽',
      shortTitle: 'RUB',
      fullTitle: 'Ruble',
      flagUrl: 'https://flagpedia.net/data/flags/w580/ru.png',
    ),
    Currency(
      id: 3,
      symbol: '₸',
      shortTitle: 'KZT',
      fullTitle: 'Tenge',
      flagUrl: 'https://akorda.kz/assets/media/flag_mediumThumb.jpg',
    ),
  ];
  static final Map<DateTime, List<Transaction>> transactions = {
    DateTime.now().subtract(const Duration(days: 1)): [
      Transaction(
        name: 'Pret a manager',
        dateTime: DateTime.now(),
        amount: 55.31,
        currency: currencies.first,
        imageUrl: 'https://www.kindpng.com/picc/m/697-6978478_pret-a-manger-logo-png-transparent-png.png',
      ),
      Transaction(
        name: 'Darren Hodgkin',
        dateTime: DateTime.now(),
        amount: 130.31,
        type: TransactionType.income,
        currency: currencies.first,
        imageUrl: 'https://cdns.iconmonstr.com/wp-content/releases/preview/2018/240/iconmonstr-arrow-left-circle-thin.png',
      ),
      Transaction(
        name: 'McDonalds',
        dateTime: DateTime.now(),
        amount: 55.31,
        currency: currencies.first,
        imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/McDonald%27s_logo.svg/2560px-McDonald%27s_logo.svg.png',
      ),
      Transaction(
        name: 'Starbucks',
        dateTime: DateTime.now(),
        amount: 55.31,
        currency: currencies.first,
        imageUrl: 'https://upload.wikimedia.org/wikipedia/ru/thumb/3/35/Starbucks_Coffee_Logo.svg/2048px-Starbucks_Coffee_Logo.svg.png',
      ),
      Transaction(
        name: 'Dave Winklevoss',
        dateTime: DateTime.now(),
        amount: 300.0,
        currency: currencies.first,
        imageUrl: 'https://cdns.iconmonstr.com/wp-content/releases/preview/2018/240/iconmonstr-arrow-right-circle-thin.png',
      ),
    ],
    DateTime.now().subtract(const Duration(days: 9)): [
      Transaction(
        name: 'Virgin Megastore',
        dateTime: DateTime.now(),
        amount: 500.31,
        currency: currencies.first,
        imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/6/63/Virgin_Megastore_logo.png',
      ),
      Transaction(
        name: 'Nike',
        dateTime: DateTime.now(),
        amount: 500.31,
        currency: currencies.first,
        imageUrl: 'https://wallpapercave.com/wp/G3b7QuT.jpg',
      ),
    ],
    DateTime.now().subtract(const Duration(days: 11)): [
      Transaction(
        name: 'Louis Vuitton',
        dateTime: DateTime.now(),
        amount: 500.31,
        currency: currencies.first,
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Louis_Vuitton_logo_and_wordmark.svg/630px-Louis_Vuitton_logo_and_wordmark.svg.png',
      ),
      Transaction(
        name: 'Carrefour',
        dateTime: DateTime.now(),
        amount: 500.31,
        currency: currencies.first,
        imageUrl: 'https://logos-world.net/wp-content/uploads/2020/11/Carrefour-Logo-2010-present.jpg',
      ),
    ],
  };
}
