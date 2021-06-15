// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Test POC: ', () {
    late FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      await driver.close();
    });

    test('Verifies the list contains a specific item', () async {
      // Create two SerializableFinders and use these to locate specific
      // widgets displayed by the app. The names provided to the byValueKey
      // method correspond to the Keys provided to the widgets in step 1.
      final listFinder = find.byValueKey('long_list');
      final itemFinder = find.byValueKey('POC13');

      await driver.scrollUntilVisible(
        // Scroll through the list
        listFinder,
        // Until finding this item
        itemFinder,
        // To scroll down the list, provide a negative value to dyScroll.
        // Ensure that this value is a small enough increment to
        // scroll the item into view without potentially scrolling past it.
        //
        // To scroll through horizontal lists, provide a dxScroll
        // property instead.
        dyScroll: -300.0,
      );

      // Verify that the item contains the correct text.
      /*expect(
        await driver.getText(itemFinder),
        'POC13',
      );*/
    });

    test('Navigate to Alerts Page', () async {
      final itemFinder = find.byValueKey('POC13');
      final alertHeaderPage = find.byValueKey('alert_header');

      await driver.runUnsynchronized(() async {
      // First, tap the button.
      await driver.tap(itemFinder);
      });
      await new Future.delayed(const Duration(seconds: 1));
      var result = await driver.waitFor(alertHeaderPage, timeout: const Duration(seconds: 2)).then((_) { return true; });
      expect( result, true);
    });

  });
}