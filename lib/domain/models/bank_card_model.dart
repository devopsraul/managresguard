class VeiculoModel {
  String card;
  String imgcarro;
  String placa;
  String modelo;
  String plano;
  String situacao;
  List<BeneficioModel> beneficios;

  VeiculoModel({
    required this.card,
    required this.imgcarro,
    required this.placa,
    required this.modelo,
    required this.plano,
    required this.situacao,
    this.beneficios = const [],
  });
}

class BeneficioModel {
  String image;
  String title;
  String description;
  double amount;

  BeneficioModel({
    required this.image,
    required this.title,
    required this.description,
    required this.amount,
  });
}

final cards = [
  VeiculoModel(
    card: 'assets/image/card.png',
    imgcarro: 'assets/image/patriot-chevrolet.png',
    placa: "NNX8C53",
    modelo: "NXR 150 BROS ESD MIX/FLEX",
    plano: "Normal - Motocicletas - Prata",
    situacao: "ativo",
    beneficios: [
      BeneficioModel(
        image: 'assets/image/check.png',
        title: "ROUBO",
        description: "1 Créditos",
        amount: 89
      ),
      BeneficioModel(
        image: 'assets/image/check.png',
        title: "FURTO",
        description: "2 Créditos",
        amount: 89
      ),
      BeneficioModel(
        image: 'assets/image/check.png',
        title: "COLISÃO",
        description: "3 Créditos",
        amount: 89
      ),BeneficioModel(
        image: 'assets/image/check.png',
        title: "INCÊNDIO POR COLISÃO",
        description: "4 Créditos",
        amount: 89
      ),BeneficioModel(
        image: 'assets/image/check.png',
        title: "Assistência 24 Horas",
        description: "5 Créditos",
        amount: 89
      ),BeneficioModel(
        image: 'assets/image/check.png',
        title: "Clube de Descontos",
        description: "6 Créditos",
        amount: 89
      ),BeneficioModel(
        image: 'assets/image/check.png',
        title: "Danos a veículos de terceiros 30 Mil",
        description: "7 Créditos",
        amount: 89
      ),BeneficioModel(
        image: 'assets/image/check.png',
        title: "CHAVEIRO",
        description: "8 Créditos",
        amount: 89
      ),BeneficioModel(
        image: 'assets/image/check.png',
        title: "TAXI",
        description: "9 Créditos",
        amount: 89
      ),BeneficioModel(
        image: 'assets/image/check.png',
        title: "PANE SECA, PANE ELÉTRICA E PANE MECÂNICA.",
        description: "100 Créditos",
        amount: 89
      ),BeneficioModel(
        image: 'assets/image/check.png',
        title: "ASSISTÊNCIA PNEU FURADO.",
        description: "100 Créditos",
        amount: 89
      ),BeneficioModel(
        image: 'assets/image/check.png',
        title: "Hospedagem Hotel",
        description: "100 Créditos",
        amount: 89
      ),BeneficioModel(
        image: 'assets/image/check.png',
        title: "PERDA TOTAL",
        description: "100 Créditos",
        amount: 89
      ),BeneficioModel(
        image: 'assets/image/check.png',
        title: "DESASTRES DA NATUREZA",
        description: "100 Créditos",
        amount: 89
      )
    ],
  ),
  VeiculoModel(
    card: 'assets/image/card.png',
    imgcarro: 'assets/image/patriot-chevrolet.png',
    placa: "NNX8C53",
    modelo: "----",
    plano: "ninguno",
    situacao: "inactivo",
    beneficios: [
      BeneficioModel(
        image: 'assets/image/amazon.png',
        title: "Amazon",
        description: "Retail Svcs MX",
        amount: 99,
      )
    ],
  ),
];
