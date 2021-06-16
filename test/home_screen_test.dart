import 'package:flutter_test/flutter_test.dart';
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
      final linkedInTextFinder = find.text('LinkedIn');
      final gitHubTextFinder = find.text('GitHub');
      final emailTextFinder = find.text('iandisantulusn@gmail.com');
      final builtWithFlutterTextFinder = find.text('built with Flutter');

      /// expected to have all the widgets rendered
      expect(titleFinder, findsOneWidget);
      expect(collegeTextFinder, findsOneWidget);
      expect(linkedInTextFinder, findsOneWidget);
      expect(gitHubTextFinder, findsOneWidget);
      expect(emailTextFinder, findsOneWidget);
      expect(builtWithFlutterTextFinder, findsOneWidget);
    },
  );
}