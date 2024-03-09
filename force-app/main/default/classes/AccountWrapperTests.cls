@IsTest
private class AccountWrapperTests {
  @TestSetup
  static void loadTestData() {
    // GIVEN
    Account acct = new Account(Name = 'ACME');
    insert acct;
  }
  @IsTest
  static void testPositiveRoundedAveragePrice() {
    // WHEN
    Account acct = [SELECT Id FROM Account LIMIT 1];
    List<Opportunity> opps = TestFactory.generateOppsForAccount(acct.id, 1000.00, 5);
    insert opps;
    AccountWrapper acctWrapper = new AccountWrapper(acct);
    // THEN
    Test.startTest();
      Assert.areEqual(
        acctWrapper.getRoundedAvgPriceOfOpps(),
        1000.00,
        'Expected to get 1000.00');
    Test.stopTest();
  }

  @IsTest
  static void testIsHighPriority() {
    // WHEN
    Account acct = [SELECT Id FROM Account LIMIT 1];
    List<Opportunity> opps = TestFactory.generateOppsForAccount(acct.id, 1000000.00, 5);
    insert opps;
    AccountWrapper acctWrapper = new AccountWrapper(acct);
    // THEN
    Test.startTest();
      Assert.areEqual(
        acctWrapper.isHighPriority(),
        true,
        'Expected to get true');
    Test.stopTest();
  }

  @IsTest
  static void testIsNotHighPriority() {
    // WHEN
    Account acct = [SELECT Id FROM Account LIMIT 1];
    List<Opportunity> opps = TestFactory.generateOppsForAccount(acct.id, 1000.00, 5);
    insert opps;
    AccountWrapper acctWrapper = new AccountWrapper(acct);
    // THEN
    Test.startTest();
      Assert.areEqual(
        acctWrapper.isHighPriority(),
        false,
        'Expected to get false');
    Test.stopTest();
  }

}