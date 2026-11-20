import 'package:eckotrack_auth_prueba/presentacion/paginas/cargando_page.dart';
import 'package:eckotrack_auth_prueba/presentacion/paginas/entrar_page.dart';
import 'package:eckotrack_auth_prueba/presentacion/paginas/inicio_page.dart';
import 'package:eckotrack_auth_prueba/presentacion/paginas/perfil_page.dart';
import 'package:eckotrack_auth_prueba/presentacion/paginas/registro_page.dart';
import 'package:eckotrack_auth_prueba/presentacion/sesion_view_model.dart';
import 'package:go_router/go_router.dart';

abstract final class Rutas {
  static const cargando = '/cargando';
  static const entrar = '/entrar';
  static const registro = '/registro';
  static const inicio = '/inicio';
  static const perfil = '/inicio/perfil';

  static const publicas = {entrar, registro};
}


String? redirigir(EstadoSesion estado, String ubicacion){
  final publica = Rutas.publicas.contains(ubicacion);
  return switch(estado) {
    Verificando() => ubicacion == Rutas.cargando ? null : Rutas.cargando,
    SinSesion() => publica ? null : Rutas.entrar,
    ConSesion() => publica || ubicacion == Rutas.cargando ? Rutas.inicio : null,

  };
}

GoRouter crearRouter(SesionViewModel sesion) => GoRouter(
  initialLocation: Rutas.inicio,
  refreshListenable: sesion,
  redirect: (context, state) => redirigir(sesion.estado, state.matchedLocation),
  routes: [
    GoRoute(path: Rutas.cargando, builder: (_, _) => const CargandoPage()),
    GoRoute(path: Rutas.entrar, builder: (_, _) => const EntrarPage()),
    GoRoute(path: Rutas.registro, builder: (_, _) => const RegistroPage()),
    GoRoute(
      path: Rutas.inicio,
      builder: (_, _) => const InicioPage(),
      routes: [GoRoute(path: 'perfil', builder: (_, _) => const PerfilPage())],
    ),
  ],
);