@IsTest
private class CalculatorTests {
    @TestSetup
    static void loadTestData() {
      // GIVEN

    }

    @IsTest
    static void testAdd() {
      // WHEN

      // THEN
      Test.startTest();
        Assert.areEqual(
            Calculator.add(1,1),
          2,
          'Expected to get 2');
      Test.stopTest();
    }

    @IsTest
    static void testDivideByZero() {
    // GIVEN
    // Double a = ;

    // WHEN
    try {
        Test.startTest();
        Calculator.divide(4,0);
        Test.stopTest();
        Assert.fail('An exception should have been thrown');
    } catch (Calculator.CalculatorException e) {
        // THEN
        Assert.isTrue(
        e.getMessage().equalsIgnoreCase('You still can\'t divide by zero'),
        'Exception message does not match: ' + e.getMessage()
        );
    }
    }
}