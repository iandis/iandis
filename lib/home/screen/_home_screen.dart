
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '/constants/app_props.dart';
import '/home/cubit/home_screen_cubit.dart';
import '/models/certificate_model.dart';

part 'home_screen_props.dart';
part 'home_screen_widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends _HomeScreenProps with _HomeScreenWidgets {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) { 
        // debugPrint(constraints.maxWidth.toString());
        late final double xPadding;
        if(kIsWeb) {
          xPadding = (math.max(0.0, constraints.maxWidth - 810.0) / 2) + 30.0;
        }else{
          xPadding = 30.0;
        }
        return Scaffold(
          backgroundColor: Colors.lightBlue[100],
          body: Stack(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(xPadding - 20, 0.0, xPadding - 20, 0.0),
                color: Colors.lightBlue[50],
              ),
              CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: [

                  _profileSection(xPadding, constraints),
                  
                  _certificateSection(xPadding, constraints),
            
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 40,
                    ),
                  ),
            
                  /// app version
                  SliverToBoxAdapter(
                    child: _AdaptiveText(
                      'v${AppProps.appVersion}',
                      constraints: constraints,
                      fontSizeOnSmallScreen: 10,
                      fontSizeOnBigScreen: 10,
                      textAlign: TextAlign.center,
                      selectable: false,
                    ),
                  ),
                  
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 20,
                    ),
                  ),
                  
                ],
              ),
            ],
          ),
        );
      },
    );
  }

}
