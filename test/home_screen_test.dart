import 'package:flutter_test/flutter_test.dart';
import 'package:iandis/constants/app_props.dart';
import 'package:iandis/home/cubit/home_screen_cubit.dart';
import 'package:iandis/main.dart';

void main() {
  testWidgets(
    'Home screen test. It should have all buttons and all text rendered on screen.',
    (WidgetTester tester) async {
      /// prepare screen
      await tester.pumpWidget(App());
      
      final certificates = HomeScreenState.init().certificates;
      /// finders
      final titleFinder = find.text('Hi,\nMy name is Iandi Santulus');
      final collegeTextFinder = find.text('🎓\nCurrently majoring in Computer Science at Gunadarma University');
      final favFlutterTextFinder = find.text('Flutter is my favourite framework for building apps!');
      final socialLinkTextFinder = find.text('🤳 Social Links');
      final linkedInTextFinder = find.text('LinkedIn');
      final gitHubTextFinder = find.text('GitHub');
      final emailTextFinder = find.text('iandisantulusn@gmail.com');
      final certificatesSectionTextFinder = find.text('Certificates', skipOffstage: false);
      final List<Finder> certificatesTextFinder = List.generate(
        certificates.length, 
        (index) => find.text(certificates[index].title, skipOffstage: false), growable: false
      );
      final appVersionTextFinder = find.text('v${AppProps.appVersion}', skipOffstage: false);

      /// expected to have all the widgets rendered
      expect(titleFinder, findsOneWidget);

      expect(collegeTextFinder, findsOneWidget);

      expect(favFlutterTextFinder, findsOneWidget);

      expect(socialLinkTextFinder, findsOneWidget);

      expect(linkedInTextFinder, findsOneWidget);

      expect(gitHubTextFinder, findsOneWidget);

      expect(emailTextFinder, findsOneWidget);

      expect(certificatesSectionTextFinder, findsOneWidget);

      for(int i = 0; i < certificatesTextFinder.length - 1; i++) {
        expect(certificatesTextFinder[i], findsOneWidget);
      }

      expect(appVersionTextFinder, findsOneWidget);

    },
    timeout: Timeout(Duration(seconds: 30)),
  );
}