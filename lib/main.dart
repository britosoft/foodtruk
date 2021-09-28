import 'package:umami/core/blocs/validation_bloc/bloc/validation_bloc.dart';
import 'package:umami/core/repositories/authentication_repository/authentication_repository.dart';
import 'package:umami/providers/local-storage_provider.dart';
import 'package:umami/screens/asking_screen.dart';
import 'package:umami/screens/checoutPedido_Screen.dart';
import 'package:umami/screens/details_screen.dart';
import 'package:umami/screens/formaDePago_screen.dart';
import 'package:umami/screens/home_screen.dart';
import 'package:umami/screens/loading_screen.dart';
import 'package:umami/screens/login_screen.dart';
import 'package:umami/screens/mis_pedidosScreen.dart';
import 'package:umami/screens/order_send.dart';
import 'package:umami/screens/product_screen.dart';
import 'package:umami/screens/register_screen.dart';
import 'package:umami/screens/send_order_screen.dart';
import 'package:umami/screens/user/user_screen.dart';
import 'package:umami/screens/validation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umami/widgets/add_product_screen.dart';
import 'package:umami/widgets/add_producto_screen.dart';
import 'package:umami/widgets/manager_producto_screen.dart';
import 'core/blocs/authentication_bloc/bloc/authentication_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalStorage().initPrefs();

  runApp(ConectorWithBloc());
}

class ConectorWithBloc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
            create: (BuildContext context) =>
                AuthenticationBloc(new AuthenticationRepository())),
        BlocProvider<ValidationBloc>(
            create: (BuildContext context) =>
                ValidationBloc()..add(ValidationLogin()))
      ],
      child: _materialApp(context),
    );
  }
}

Widget _materialApp(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Material App',
    initialRoute: 'login',
    routes: {
      'login': (_) => LoginScreen(),
      'home': (_) => HomeScreen(),
      'register': (_) => RegisterScreen(),
      'product': (_) => MyProduct(),
      'details': (_) => DetailsScreen(),
      'pedidos': (_) => MisPedidosScreen(),
      'asking': (_) => Asking_Screen(),
      'checout': (_) => checoutPedido_Screen(),
      'formaDePago': (_) => Metodo_Pago(),
      'sendOrder': (_) => Send_order(),
      'managerproduct': (_) => Manager_productScreen(),
      'addproduct': (_) => AddProduct(),
      'loading': (_) => loading(),
      'send': (_) => Send(),
      'add': (_) => Add_productScreen(),
      'usuario': (_) => UserScreen(),
    },
    home: ValidationScreen(),
    theme: ThemeData(
      scaffoldBackgroundColor: Colors.grey,
      cardColor: Colors.white,
    ),
  );
}
