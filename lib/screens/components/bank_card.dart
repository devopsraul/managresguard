import 'package:flutter/material.dart';
import 'package:managresguard/domain/models/bank_card_model.dart';
import 'package:managresguard/constants.dart';

class BankCard extends StatelessWidget {
  const BankCard({
    Key? key,
    required this.bankCard,
  }) : super(key: key);

  final BankCardModel bankCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: Constants.padding,
      ),
      padding: const EdgeInsets.all(Constants.padding * 2),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(bankCard.image),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(
          Constants.radius,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipOval(
                child: Image.asset(
                  bankCard.image2,
                  height: Constants.padding * 5.1,
                  width: Constants.padding * 5.1,
                ),
              ),
              Text(
                bankCard.placa,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Colors.white),
              )
            ],
          ),
          Text(
            "\$${bankCard.balance.toStringAsFixed(2)}",
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}