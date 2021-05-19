public with sharing class AccountHandle1r{


    Public static void CreateNewOpportunity(List<Account> accts)

    {
        List <Opportunity> opps = new List<Opportunity>();

        for (Account a:accts)
        {
          Opportunity opp = new Opportunity();
          opp.Name = a.Name + 'Opportunity';
          opp.AccountID = a.Id;
          opp.Stagename = 'Prospecting';
          opp.CloseDate = System.Today().addMonths(1);
          opps.add(opp);
         }
         
         if (opps.size() > 0)
         {
            insert opps;
         }
    }
}