trigger TriggerChildRecords on Contact (before delete) {
    //To store parent ids
    list<id> AccountIds=new list<id>();
    for(Contact accountVar:trigger.old)
    {
        AccountIds.add(accountVar.id);
    }  
    //Collecting all child records related to Parent records and Please use the Custom lookfield name in SOQL below don't use ID here am using my field API name is Contact__c
    list<Contact_Relationship__c> listOfContacts=[select id from Contact_Relationship__c where Contact__c in :AccountIds];
    system.debug('listOfContacts'+listOfContacts);
    //deleting child records
    delete listOfContacts;
}