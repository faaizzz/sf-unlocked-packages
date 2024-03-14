@IsTest
private class ExternalSearchTests {
  @IsTest
  static void testPositiveMocking() {
    // GIVEN
    HTTPMockFactory mock = new HTTPMockFactory(
      200,
      'OK',
      'I found it!',
      new Map<String, String>()
    );
    Test.setMock(HttpCalloutMock.class, mock);
    // WHEN
    Test.startTest();
      String result = ExternalSearch.googleIt('epic search');
    Test.stopTest();
    // THEN
    Assert.areEqual('I found it!', result, 'Expected to receive mock response');
  }

  @IsTest
  static void testNegativeMocking() {
    // GIVEN
    HTTPMockFactory mock = new HTTPMockFactory(
      500,
      'Failed',
      'Not found',
      new Map<String, String>()
    );
    Test.setMock(HttpCalloutMock.class, mock);
    // WHEN
    Test.startTest();
    try {
        String result = ExternalSearch.googleIt('epic search');
    } catch (ExternalSearch.ExternalSearchException e) {
        Assert.isTrue(
            e.getMessage().equalsIgnoreCase('Did not receive a 200 status code: 500'),
            'Exception message does not match: ' + e.getMessage());
        
    }
    Test.stopTest();
    // THEN
  }

}