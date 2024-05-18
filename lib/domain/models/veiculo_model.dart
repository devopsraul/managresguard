// veiculo_model.dart
class VeiculoResponse {
  final VeiculoModel veiculo;

  VeiculoResponse({required this.veiculo});

  factory VeiculoResponse.fromJson(Map<String, dynamic> json) {
    return VeiculoResponse(
      veiculo: VeiculoModel.fromJson(json['veiculo']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'veiculo': veiculo.toJson(),
    };
  }
}

class VeiculoModel {
  final String card;
  final String imgcarro;
  final String associado;
  final String sexo;
  final String telFixo;
  final String telCelular;
  final String dtNascimento;
  final String cpfCnpj;
  final String nomeMae;
  final String email;
  final String rg;
  final String orgaoExpedidorRg;
  final String cnh;
  final String categoriaCnh;
  final String logradouro;
  final String bairro;
  final String numero;
  final String complemento;
  final String cidade;
  final String estado;
  final String estadoUf;
  final int codigoAssociado;
  final String placa;
  final String? idExterno;
  final int codVeiculo;
  final int cilindrada;
  final String chassi;
  final String renavam;
  final int anoFabricacao;
  final int anoModelo;
  final int qtdPortas;
  final String valorFipe;
  final String numeroMotor;
  final int qtdPassageiros;
  final int kilometragem;
  final String situacao;
  final String? situacaoTipo;
  final int codSituacao;
  final String modelo;
  final String tipo;
  final String cor;
  final String marca;
  final String combustivel;
  final String categoria;
  final int codCategoria;
  final String plano;
  final int codPlano;
  final List<BeneficiosModel> beneficios;

  VeiculoModel({
    this.card = 'assets/image/card.png',
    this.imgcarro = 'assets/image/patriot-chevrolet.png',
    required this.associado,
    required this.sexo,
    required this.telFixo,
    required this.telCelular,
    required this.dtNascimento,
    required this.cpfCnpj,
    required this.nomeMae,
    required this.email,
    required this.rg,
    required this.orgaoExpedidorRg,
    required this.cnh,
    required this.categoriaCnh,
    required this.logradouro,
    required this.bairro,
    required this.numero,
    required this.complemento,
    required this.cidade,
    required this.estado,
    required this.estadoUf,
    required this.codigoAssociado,
    required this.placa,
    this.idExterno,
    required this.codVeiculo,
    required this.cilindrada,
    required this.chassi,
    required this.renavam,
    required this.anoFabricacao,
    required this.anoModelo,
    required this.qtdPortas,
    required this.valorFipe,
    required this.numeroMotor,
    required this.qtdPassageiros,
    required this.kilometragem,
    required this.situacao,
    this.situacaoTipo,
    required this.codSituacao,
    required this.modelo,
    required this.tipo,
    required this.cor,
    required this.marca,
    required this.combustivel,
    required this.categoria,
    required this.codCategoria,
    required this.plano,
    required this.codPlano,
    required this.beneficios,
    //this.beneficios = const [],
  });

  factory VeiculoModel.fromJson(Map<String, dynamic> json) {
    var list = json['beneficios'] as List;
    List<BeneficiosModel> beneficiosList = list.map((i) => BeneficiosModel.fromJson(i)).toList();

    return VeiculoModel(
      //card: json['card'],
      imgcarro: json['image'] ?? 'assets/image/card.png',
      associado: json['associado'],
      sexo: json['sexo'],
      telFixo: json['tel_fixo'],
      telCelular: json['tel_celular'],
      dtNascimento: json['dt_nascimento'],
      cpfCnpj: json['cpf_cnpj'],
      nomeMae: json['nome_mae'],
      email: json['email'],
      rg: json['rg'],
      orgaoExpedidorRg: json['orgao_expedidor_rg'],
      cnh: json['cnh'],
      categoriaCnh: json['categoria_cnh'],
      logradouro: json['logradouro'],
      bairro: json['bairro'],
      numero: json['numero'],
      complemento: json['complemento'],
      cidade: json['cidade'],
      estado: json['estado'],
      estadoUf: json['estado_uf'],
      codigoAssociado: json['codigo_associado'],
      placa: json['placa'],
      idExterno: json['id_externo'],
      codVeiculo: json['cod_veiculo'],
      cilindrada: json['cilindrada'],
      chassi: json['chassi'],
      renavam: json['renavam'],
      anoFabricacao: json['ano_fabricacao'],
      anoModelo: json['ano_modelo'],
      qtdPortas: json['qtd_portas'],
      valorFipe: json['valor_fipe'],
      numeroMotor: json['numero_motor'],
      qtdPassageiros: json['qtd_passageiros'],
      kilometragem: json['kilometragem'],
      situacao: json['situacao'],
      situacaoTipo: json['situacao_tipo'],
      codSituacao: json['cod_situacao'],
      modelo: json['modelo'],
      tipo: json['tipo'],
      cor: json['cor'],
      marca: json['marca'],
      combustivel: json['combustivel'],
      categoria: json['categoria'],
      codCategoria: json['cod_categoria'],
      plano: json['plano'],
      codPlano: json['cod_plano'],
      beneficios: beneficiosList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'card': associado,
      'imgcarro': associado,
      'associado': associado,
      'sexo': sexo,
      'tel_fixo': telFixo,
      'tel_celular': telCelular,
      'dt_nascimento': dtNascimento,
      'cpf_cnpj': cpfCnpj,
      'nome_mae': nomeMae,
      'email': email,
      'rg': rg,
      'orgao_expedidor_rg': orgaoExpedidorRg,
      'cnh': cnh,
      'categoria_cnh': categoriaCnh,
      'logradouro': logradouro,
      'bairro': bairro,
      'numero': numero,
      'complemento': complemento,
      'cidade': cidade,
      'estado': estado,
      'estado_uf': estadoUf,
      'codigo_associado': codigoAssociado,
      'placa': placa,
      'id_externo': idExterno,
      'cod_veiculo': codVeiculo,
      'cilindrada': cilindrada,
      'chassi': chassi,
      'renavam': renavam,
      'ano_fabricacao': anoFabricacao,
      'ano_modelo': anoModelo,
      'qtd_portas': qtdPortas,
      'valor_fipe': valorFipe,
      'numero_motor': numeroMotor,
      'qtd_passageiros': qtdPassageiros,
      'kilometragem': kilometragem,
      'situacao': situacao,
      'situacao_tipo': situacaoTipo,
      'cod_situacao': codSituacao,
      'modelo': modelo,
      'tipo': tipo,
      'cor': cor,
      'marca': marca,
      'combustivel': combustivel,
      'categoria': categoria,
      'cod_categoria': codCategoria,
      'plano': plano,
      'cod_plano': codPlano,
      'beneficios': beneficios.map((beneficio) => beneficio.toJson()).toList(),
    };
  }

}

class BeneficiosModel {
  final String? image;
  final int codBeneficio;
  final String beneficio;

  BeneficiosModel({
    this.image,
    required this.codBeneficio,
    required this.beneficio,
  });

  factory BeneficiosModel.fromJson(Map<String, dynamic> json) {
    return BeneficiosModel(
      image: json['image'],
      codBeneficio: json['cod_beneficio'],
      beneficio: json['beneficio'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cod_beneficio': codBeneficio,
      'beneficio': beneficio,
    };
  }
}

final veiculo = [
  VeiculoModel(
    card: 'assets/image/card.png',
    imgcarro: 'assets/image/patriot-chevrolet.png',
    placa: "NNX8C53",
    modelo: "NXR 150 BROS ESD MIX/FLEX",
    plano: "Normal - Motocicletas - Prata",
    situacao: "ativo",
    associado: "",
    sexo: "",
    telFixo: "",
    telCelular: "",
    dtNascimento: "",
    cpfCnpj: "",
    nomeMae: "",
    email: "",
    rg: "",
    orgaoExpedidorRg: "",
    cnh: "",
    categoriaCnh: "",
    logradouro: "",
    bairro: "",
    numero: "",
    complemento: "",
    cidade: "",
    estado: "",
    estadoUf: "",
    codigoAssociado: 0,
    idExterno: "",
    codVeiculo:  0,
    cilindrada:  0,
    chassi:  "",
    renavam:  "",
    anoFabricacao:  0,
    anoModelo:  0,
    qtdPortas:  0,
    valorFipe:  "",
    numeroMotor:  "",
    qtdPassageiros:  0,
    kilometragem:  0,
    situacaoTipo:  "",
    codSituacao:  0,
    tipo:  "",
    cor:  "",
    marca:  "",
    combustivel:  "",
    categoria:  "",
    codCategoria:  0,
    codPlano:  0,
    beneficios: [
      BeneficiosModel(
        image: 'assets/image/check.png',
        beneficio: "ROUBO",
        codBeneficio: 1,
      ),
      BeneficiosModel(
        image: 'assets/image/check.png',
        beneficio: "FURTO",
        codBeneficio: 1,
      ),
      BeneficiosModel(
        image: 'assets/image/check.png',
        beneficio: "COLISÃO",
        codBeneficio: 1,
      ),BeneficiosModel(
        image: 'assets/image/check.png',
        beneficio: "INCÊNDIO POR COLISÃO",
        codBeneficio: 1,
      ),BeneficiosModel(
        image: 'assets/image/check.png',
        beneficio: "Assistência 24 Horas",
        codBeneficio: 1,
      ),BeneficiosModel(
        image: 'assets/image/check.png',
        beneficio: "Clube de Descontos",
        codBeneficio: 1,
      ),BeneficiosModel(
        image: 'assets/image/check.png',
        beneficio: "Danos a veículos de terceiros 30 Mil",
        codBeneficio: 1,
      ),BeneficiosModel(
        image: 'assets/image/check.png',
        beneficio: "CHAVEIRO",
        codBeneficio: 1,
      ),BeneficiosModel(
        image: 'assets/image/check.png',
        beneficio: "TAXI",
        codBeneficio: 1,
      ),BeneficiosModel(
        image: 'assets/image/check.png',
        beneficio: "PANE SECA, PANE ELÉTRICA E PANE MECÂNICA.",
        codBeneficio: 1,
      ),BeneficiosModel(
        image: 'assets/image/check.png',
        beneficio: "ASSISTÊNCIA PNEU FURADO.",
        codBeneficio: 1,
      ),BeneficiosModel(
        image: 'assets/image/check.png',
        beneficio: "Hospedagem Hotel",
        codBeneficio: 1,
      ),BeneficiosModel(
        image: 'assets/image/check.png',
        beneficio: "PERDA TOTAL",
        codBeneficio: 1,
      ),BeneficiosModel(
        image: 'assets/image/check.png',
        beneficio: "DESASTRES DA NATUREZA",
        codBeneficio: 1,
      )
    ],
  )
];
