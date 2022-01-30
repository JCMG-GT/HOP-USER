import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:hopapp/src/logic/bloc/register/register_bloc_bloc.dart';

import 'package:hopapp/src/domain/services/graphql/graph_services.dart';
import 'package:hopapp/src/domain/services/graphql/graphqlConf.dart';

import 'package:hopapp/src/pages/share_prefs/preferencias_usuario.dart';
import 'package:hopapp/src/services/stripe_service.dart';

import 'package:hopapp/src/routes/routes.dart';

//Instancia de Graph
GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

/*void main() async => runApp(GraphQLProvider(
      client: graphQLConfiguration.client,
      child: CacheProvider(child: MyApp()),
    ));*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();

  final stripeService = StripeService();

  runApp(GraphQLProvider(
    client: graphQLConfiguration.client,
    child: CacheProvider(child: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(userRepository: UserService()),
      child: MaterialApp(
        navigatorObservers: [ClearFocusOnPop()],
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        title: 'Hop App',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: [
          const Locale('en', 'US'),
          const Locale('es', 'ES'),
        ],
        initialRoute: '/',
        routes: getApplicationRoutes(),
      ),
    );
  }
}

///
///Sobreescribimos el metodo de Navigator Observer para que todos los TextField
///de la apliacion esten cerrados cuando se constryen, arregla problema que se
///abre cuando se retorna a una pagina que contiene un TextField
class ClearFocusOnPop extends NavigatorObserver {
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await Future.delayed(Duration.zero);
      SystemChannels.textInput.invokeMethod('TextInput.hide');
    });
  }
}
