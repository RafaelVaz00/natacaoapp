class Usuario {

  final String? email_atleta;
  final bool? flagPA;
  final String? nome;
  final String? senha;
  final String? tipoConta;
  final String? uidAtleta;
  final String idDocumento;

  Usuario({
    this.email_atleta,
    this.flagPA,
    this.nome,
    this.senha,
    this.tipoConta,
    this.uidAtleta,
    required this.idDocumento
  });
}