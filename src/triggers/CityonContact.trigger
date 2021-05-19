trigger CityonContact on Contact (After insert) {
    
       List<Contact> con = new List<Contact>();
       List<Account> acct = new List<Account>();
    
    for (Contact c : Trigger.new)
    {
        // Contact cont = new Contact(id = c.Id,Lastname = c.LastName,MailingCity = c.MailingCity, Primary_Contact__C = c.Primary_Contact__c);
        con.add(c);
    }
      
      
    for (contact c : con)
    {
        if ((c.Primary_Contact__c==true) && (c.MailingCity!=null))
        {
            Account acc = [Select Id, BillingCity from Account where Id =:c.AccountId];
            acc.BillingCity = c.MailingCity;
            acct.add(acc);
        }
     }
    update acct;

}