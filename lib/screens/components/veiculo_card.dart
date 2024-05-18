import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../domain/models/veiculo_model.dart';

class VeiculoCard extends StatelessWidget {
  const VeiculoCard({
    Key? key,
    required this.veiculoCard,
  }) : super(key: key);

  final VeiculoModel veiculoCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: Constants.padding,
      ),
      padding: const EdgeInsets.all(Constants.padding * 2),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(veiculoCard.card),
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
                  veiculoCard.imgcarro,
                  height: Constants.padding * 5.1,
                  width: Constants.padding * 5.1,
                ),
              ),
              Text(
                veiculoCard.placa,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Colors.white),
              )
            ],
          ),
          Text(
            //"\$${bankCard.active.toStringAsFixed(2)}",
            veiculoCard.situacao,
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
