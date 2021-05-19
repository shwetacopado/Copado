@istest

Private class MyOpptyTest {

    @isTest Static void CreateAccount()
    {
      //Let's create an account

      Account acc = new Account();

      acc.Name = 'Infosys';

      insert acc;
      //Let's check whether the opportunity created or not

      List<Opportunity> Opps = [Select Id from Opportunity where Name = 'InfosysOpportunity'];
      System.assertEquals(1,Opps.size());


    }
}