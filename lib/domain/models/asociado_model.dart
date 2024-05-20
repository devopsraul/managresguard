// associado_model.dart
class ApiResponse {
  final AssociadoModel associado;

  ApiResponse({required this.associado});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      associado: AssociadoModel.fromJson(json['associado'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'associado': associado.toJson(),
    };
  }
}

class AssociadoModel {
  final String nome;
  final String? cpf;
  final String? telWhatsapp;
  final String? telCelular;
  final String? telComercial;
  final String? dtNascimento;
  final String? email;
  final String? rg;
  final String? orgaoExpedidorRg;
  final String? cnh;
  final String? categoriaCnh;
  final String? dtVencimentoCnh;
  final String? logradouro;
  final String? bairro;
  final String? numero;
  final String? complemento;
  final String? cep;
  final int? codAssociado;
  final String? cidade;
  final String? estado;
  final String? uf;
  final String? dtCadastro;
  final String? situacao;
  final String? situacaoTipo;
  final int? codSituacao;
  final List<Veiculo> veiculos;

  AssociadoModel({
    required this.nome,
    this.cpf,
    this.telWhatsapp,
    this.telCelular,
    this.telComercial,
    this.dtNascimento,
    this.email,
    this.rg,
    this.orgaoExpedidorRg,
    this.cnh,
    this.categoriaCnh,
    this.dtVencimentoCnh,
    this.logradouro,
    this.bairro,
    this.numero,
    this.complemento,
    this.cep,
    this.codAssociado,
    this.cidade,
    this.estado,
    this.uf,
    this.dtCadastro,
    this.situacao,
    this.situacaoTipo,
    this.codSituacao,
    required this.veiculos,
  });

  factory AssociadoModel.fromJson(Map<String, dynamic> json) {
    var list = json['veiculos'] as List? ?? [];
    List<Veiculo> veiculosList = list.map((i) => Veiculo.fromJson(i ?? {})).toList();

    return AssociadoModel(
      nome: json['nome'],
      cpf: json['cpf'],
      telWhatsapp: json['tel_whatsapp'],
      telCelular: json['tel_celular'],
      telComercial: json['tel_comercial'],
      dtNascimento: json['dt_nascimento'],
      email: json['email'],
      rg: json['rg'],
      orgaoExpedidorRg: json['orgao_expedidor_rg'],
      cnh: json['cnh'],
      categoriaCnh: json['categoria_cnh'],
      dtVencimentoCnh: json['dt_vencimento_cnh'],
      logradouro: json['logradouro'],
      bairro: json['bairro'],
      numero: json['numero'],
      complemento: json['complemento'],
      cep: json['cep'],
      codAssociado: json['cod_associado'],
      cidade: json['cidade'],
      estado: json['estado'],
      uf: json['uf'],
      dtCadastro: json['dt_cadastro'],
      situacao: json['situacao'],
      situacaoTipo: json['situacao_tipo'],
      codSituacao: json['cod_situacao'],
      veiculos: veiculosList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'cpf': cpf,
      'tel_whatsapp': telWhatsapp,
      'tel_celular': telCelular,
      'tel_comercial': telComercial,
      'dt_nascimento': dtNascimento,
      'email': email,
      'rg': rg,
      'orgao_expedidor_rg': orgaoExpedidorRg,
      'cnh': cnh,
      'categoria_cnh': categoriaCnh,
      'dt_vencimento_cnh': dtVencimentoCnh,
      'logradouro': logradouro,
      'bairro': bairro,
      'numero': numero,
      'complemento': complemento,
      'cep': cep,
      'cod_associado': codAssociado,
      'cidade': cidade,
      'estado': estado,
      'uf': uf,
      'dt_cadastro': dtCadastro,
      'situacao': situacao,
      'situacao_tipo': situacaoTipo,
      'cod_situacao': codSituacao,
      'veiculos': veiculos?.map((v) => v.toJson()).toList(),
    };
  }
}

class Veiculo {
  final String? placa;
  final String modelo;
  final int? codVeiculo;
  final String? situacao;
  final String? situacaoTipo;
  final int? codSituacao;

  Veiculo({
    this.placa,
    required this.modelo,
    this.codVeiculo,
    this.situacao,
    this.situacaoTipo,
    this.codSituacao,
  });

  factory Veiculo.fromJson(Map<String, dynamic> json) {
    return Veiculo(
      placa: json['placa'],
      modelo: json['modelo'],
      codVeiculo: json['cod_veiculo'],
      situacao: json['situacao'],
      situacaoTipo: json['situacao_tipo'],
      codSituacao: json['cod_situacao'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'placa': placa,
      'modelo': modelo,
      'cod_veiculo': codVeiculo,
      'situacao': situacao,
      'situacao_tipo': situacaoTipo,
      'cod_situacao': codSituacao,
    };
  }
}