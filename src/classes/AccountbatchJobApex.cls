Global class AccountbatchJobApex implements Database.Batchable<sObject>
{
  global Database.QueryLocator start(Database.BatchableContext BC)
  {
      String Query = 'Select ID,Name from Account';
      return Database.getQueryLocator(Query);
  }
    
  global void execute (Database.BatchableContext BC,List<Account> scope)
  {
      for (Account a: scope)
      {
          a.Name = a.Name + 'Updated by Batch Apex';
      }
      update scope;
  }
    global void finish (Database.BatchableContext BC)
    {
        System.debug('Send amil after all records has bene processed');
    }
}