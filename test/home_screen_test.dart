import 'package:flutter_test/flutter_test.dart';
import 'package:iandis/constants/app_props.dart';
import 'package:iandis/main.dart';

void main() {
  testWidgets(
    'Home screen test. It should have all buttons and all text rendered on screen.',
    (WidgetTester tester) async {
      /// prepare screen
      await tester.pumpWidget(App());

      /// finders
      final titleFinder = find.text('Hi,\nMy name is Iandi Santulus');
      final collegeTextFinder = find.text('Currently majoring in Computer Science at Gunadarma University');
      final favFlutterTextFinder = find.text('Flutter is my favourite framework for building apps!');
      final linkedInTextFinder = find.text('LinkedIn');
      final gitHubTextFinder = find.text('GitHub');
      final emailTextFinder = find.text('iandisantulusn@gmail.com');
      final certificatesSectionTextFinder = find.text('Certificates');
      final appVersionTextFinder = find.text('v${AppProps.appVersion}');

      /// expected to have all the widgets rendered
      expect(titleFinder, findsOneWidget);
      expect(collegeTextFinder, findsOneWidget);
      expect(favFlutterTextFinder, findsOneWidget);
      expect(linkedInTextFinder, findsOneWidget);
      expect(gitHubTextFinder, findsOneWidget);
      expect(emailTextFinder, findsOneWidget);
      expect(certificatesSectionTextFinder, findsOneWidget);
      expect(appVersionTextFinder, findsOneWidget);
    },
  );
}