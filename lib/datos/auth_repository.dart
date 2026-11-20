import 'package:eckotrack_auth_prueba/dominio/usuario.dart';

abstract class AuthRepository {
  Stream<Usuario?> cambiosDeSesion();

  Future<Usuario> registrar(String correo, String contrasena);

  Future<Usuario> iniciarSesion(String correo, String contrasena);

  Future<void> cerrarSesion();
}
