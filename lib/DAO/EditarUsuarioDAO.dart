import 'package:sqflite/sqflite.dart';
import 'package:projeto_coleta_seletiva/Models/Usuario.dart';
import 'package:projeto_coleta_seletiva/ConexaoBancoDeDados/Conexao.dart';

class EditarUsuarioDAO {
  static Database? _db;

  EditarUsuarioDAO();

  Future<void> editarUsuario(Usuario usuario) async {
    _db = await Conexao.getConexao();

    var sql = "UPDATE usuario SET "
        "nome = ?, "
        "senha = ?, "
        "cpf = ?, "
        "telefone = ?, "
        "email = ?, "
        "CEP = ?, "
        "bairro = ?, "
        "rua = ?, "
        "numero = ? "
        "WHERE id = ?";

    await _db!.rawUpdate(sql, [
      usuario.nome,
      usuario.senha,
      usuario.cpf,
      usuario.telefone,
      usuario.email,
      usuario.cep,
      usuario.bairro,
      usuario.rua,
      usuario.numero,
      usuario.idUsuario,
    ]);

    _db!.close();
  }
}
