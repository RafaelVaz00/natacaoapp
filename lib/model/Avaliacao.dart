class Avaliacao {

  final String atletaId;
  final String treinoId;
  final int batimentosIniciais;
  final int batimentosFinais;
  final DateTime dataTreino;
  final DateTime dataAvaliacao;
  final List? voltas;

  Avaliacao({
    required this.atletaId,
    required this.treinoId,
    required this.batimentosIniciais,
    required this.batimentosFinais,
    required this.dataTreino,
    required this.dataAvaliacao,
    this.voltas
  });
}
