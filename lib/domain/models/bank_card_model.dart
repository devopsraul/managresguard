class BankCardModel {
  String image;
  String image2;
  String placa;
  double balance;
  List<ExpenseModel> expenses;

  BankCardModel({
    required this.image,
    required this.image2,
    required this.placa,
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
    image2: 'assets/image/patriot-chevrolet.png',
    placa: "NNX8C53",
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
    image: 'assets/image/card.png',
    image2: 'assets/image/patriot-chevrolet.png',
    placa: "NNX8C53",
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
    image: 'assets/image/card.png',
    image2: 'assets/image/patriot-chevrolet.png',
    placa: "NNX8C53",
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
