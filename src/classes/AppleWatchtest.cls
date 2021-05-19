@isTest
private class AppleWatchtest {

  @isTest static void CreateOpportunity() {
    Opportunity opp = new Opportunity();
    opp.Name        = 'Swift enter';
    opp.StageName   =  'Prospecting';
    opp.CloseDate   = Date.today();
    opp.Amount      = 55000;
    insert opp;
  	
      }
}