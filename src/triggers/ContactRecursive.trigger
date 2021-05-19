trigger ContactRecursive on Contact (after insert,after update) {
    
    Map<id,Account> updateAccount = new Map<id,Account>();
    
    for(Contact con:trigger.new)
    {
        if(con.Accountid !=null)
        {
            Account acc = new Account(id=con.Accountid,Contact_Last_updates__c=system.now());
            updateAccount.put(con.AccountId,acc);
        }
    }
    System.debug('values:' +updateAccount.values());
    update updateAccount.values();

}