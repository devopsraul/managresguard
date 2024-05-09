class BankCardModel {
  String image;
  String icon;
  String number;
  double balance;
  List<ExpenseModel> expenses;

  BankCardModel({
    required this.image,
    required this.icon,
    required this.number,
    required this.balance,
    this.expenses = const [],
  });
}

class ExpenseModel {
  String image;
  String title;
  String description;
  double amount;

  ExpenseModel({
    required this.image,
    required this.title,
    required this.description,
    required this.amount,
  });
}

final cards = [
  BankCardModel(
    image: 'assets/image/card.png',
    icon: 'assets/image/icon_2.jpeg',
    number: "0912",
    balance: 345.00,
    expenses: [
      ExpenseModel(
          image: 'assets/image/quinielapro.png',
          title: "Quiniela PRO",
          description: "100 Créditos",
          amount: 89)
    ],
  ),
  BankCardModel(
    image: 'assets/image/bg_1.jpeg',
    icon: 'assets/image/icon_1.png',
    number: "0912",
    balance: 123.00,
    expenses: [
      ExpenseModel(
        image: 'assets/image/amazon.png',
        title: "Amazon",
        description: "Retail Svcs MX",
        amount: 99,
      )
    ],
  ),
  BankCardModel(
    image: 'assets/image/bg_2.jpeg',
    icon: 'assets/image/icon_3.png',
    number: "8743",
    balance: 789.00,
    expenses: [
      ExpenseModel(
        image: 'assets/image/netflix.png',
        title: "Netflix",
        description: "Subscription",
        amount: 186,
      )
    ],
  ),
];
