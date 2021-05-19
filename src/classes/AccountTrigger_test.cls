@istest
private class AccountTrigger_test 
{
  @isTest static void TestCreatenewAccountInBulk()
  {
  // test setup data
  //Create 200 new accounts
    List<Account> accts = new List<Account>();
    for(Integer i=0; i <200 ; i++)
     {
        Account acct = new Account(Name='TestAccount' + i);
        accts.add(acct);
     }
     
     insert accts;
    

}}