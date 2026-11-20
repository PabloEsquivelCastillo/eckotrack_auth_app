const longitudMinimaContrasena = 8;

final _formatoCorreo = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

// Validar correo
String? validarCorreo(String correo) {
  final limpio = correo.trim();

  if(limpio.isEmpty) return 'Escribe tu correo';
  if(!_formatoCorreo.hasMatch(limpio)) return 'Ese correo no es valido';
  return null;
}

// Validar contraseña
String? validarContrasena(String contrasena) {
  final limpio = contrasena.trim();

  if(limpio.isEmpty) return 'Escribe tu contraseña';
  if(limpio.length < longitudMinimaContrasena) return 'La longitud minima es de 8 carácteres';
  return null;
}

// Validar contraseña y confirmación
String? validarContraConfirmacion(String contrasena, String confirmar) {
  final contra = contrasena.trim();
  final conf = confirmar.trim();

  if (conf != contra) return 'Las contraseñas no coinciden';
  return null;
}