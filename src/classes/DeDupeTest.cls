@isTest
private class DeDupeTest {

  @isTest static void CreateAccount() {

  	Account acc = new Account();
  	acc.Name = 'TestAccount';
  	insert acc;
    
  }
}