import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'constants/app_routes.dart';
import 'cubits.dart';
import 'repositories.dart';
import 'screens.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => ScreenUtilsRepo(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeScreenCubit(
              screenUtilsRepo: context.read<ScreenUtilsRepo>()
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Iandi Santulus',
          debugShowCheckedModeBanner: false,
          navigatorKey: ScreenUtilsRepo.navigatorKey,
          scaffoldMessengerKey: ScreenUtilsRepo.messengerKey,
          theme: ThemeData(
            primaryColor: Colors.blue[900],
            accentColor: Colors.orange,
            errorColor: Colors.red[900],
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: 'Nunito Sans'
          ),
          routes: {
            AppRoutes.home: (_) => HomeScreen(),
          },
          initialRoute: AppRoutes.home,
        ),
      ),
    );
  }
}
