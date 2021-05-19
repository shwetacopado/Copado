global class UpdateContactAddresses implements database.Batchable<sObject>,Database.Stateful
{
    // instance member to retain state across transactions
    global integer recordsprocessed = 0;
    
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
     return Database.getQueryLocator('SELECT ID, BillingStreet, BillingCity, BillingState, ' +'BillingPostalCode, (SELECT ID, MailingStreet, MailingCity, ' +
     'MailingState, MailingPostalCode FROM Contacts) FROM Account ' + 'Where BillingCountry = \'USA\'');

}


    
global void execute(Database.BatchableContext bc, List<Account> scope)
{
  // process each batch of records
  List<Contact> contacts = new List<Contact>();
    for (Account account : scope)
    {
        for (Contact con : account.contacts)
        {
            con.MailingStreet = account.BillingStreet;
            con.MailingCity = account.BillingCity;
            con.MailingState = account.BillingState;
            con.MailingPostalCode = account.BillingPostalCode;
            //add contact to list to be updated
            contacts.add(con);
            //increase the instance member counter
            recordsprocessed = recordsprocessed + 1;
         }
    }
           update contacts;
}
       global void finish(Database.BatchableContext bc)
       {
           System.debug(recordsprocessed + 'records processed Shazam !');
           AsyncApexJob job = [Select Id, Status, NumberOfErrors, JobItemsProcessed,TotalJobItems,CreatedBy.Email from  AsyncApexJob where Id = :bc.getJobId()];
           //call some utility to send email
          // EmailUtils.sendMessage(a, recordsprocessed);

       }
}