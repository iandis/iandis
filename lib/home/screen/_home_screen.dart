
import 'package:flutter/material.dart';
import 'package:iandis/home/cubit/home_screen_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_screen_props.dart';
part 'home_screen_widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends _HomeScreenProps {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: LayoutBuilder(
          builder: (context, constraints) { 
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                /// hi ...
                _AdaptiveText(
                  _homeScreenCubit.state.title,
                  constraints: constraints,
                  fontSizeOnSmallScreen: 30,
                  fontSizeOnBigScreen: 45,
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
                Divider(
                  height: 20,
                ),

                /// college hat emoji
                _AdaptiveText(
                  '🎓',
                  constraints: constraints,
                  fontSizeOnSmallScreen: 20,
                  fontSizeOnBigScreen: 25,
                  textAlign: TextAlign.center,
                ),

                /// currently majoring ...
                _AdaptiveText(
                  'Currently majoring in Computer Science at Gunadarma University',
                  constraints: constraints,
                  fontSizeOnSmallScreen: 20,
                  fontSizeOnBigScreen: 25,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                
                FlutterLogo(),
                /// flutter is my favourite ...
                _AdaptiveText(
                  'Flutter is my favourite framework for building apps!',
                  constraints: constraints,
                  fontSizeOnSmallScreen: 20,
                  fontSizeOnBigScreen: 25,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),

                /// 'hit me up'
                _AdaptiveText(
                  'Hit me up 😉',
                  constraints: constraints,
                  fontSizeOnSmallScreen: 20,
                  fontSizeOnBigScreen: 25,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),

                /// linkedin button
                ElevatedButton(
                  onPressed: _homeScreenCubit.openLinkedIn,
                  child: Text(
                    'LinkedIn',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[200],
                    onPrimary: Colors.blue[900],
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    fixedSize: Size.fromHeight(60),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                /// github button
                ElevatedButton(
                  onPressed: _homeScreenCubit.openGitHub,
                  child: Text(
                    'GitHub',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[900],
                    onPrimary: Colors.grey[200],
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    fixedSize: Size.fromHeight(60),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                /// email button
                TextButton(
                  onPressed: _homeScreenCubit.openEmail,
                  child: Text(
                    'iandisantulusn@gmail.com',
                  ),
                ),
                SizedBox(height: 100,),
                /// built with flutter
                _AdaptiveText(
                  'built with Flutter',
                  constraints: constraints,
                  fontSizeOnSmallScreen: 12,
                  fontSizeOnBigScreen: 16,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20,),
              ],
            );
          }
        ),
      ),
    );
  }
}
