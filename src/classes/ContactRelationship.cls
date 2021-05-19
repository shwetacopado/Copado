public class ContactRelationship {

    public void createContactRelationshipByContact(list<Contact> List_Contacts)
    {
           list<Contact_Relationship__c> ConList= new list<Contact_Relationship__c>();

        for(Contact c : List_Contacts)
    {
        if (c.Contact_Relationship__c==true)
        {
          Contact_Relationship__c cr = new Contact_Relationship__c();
            cr.Name = c.LastName;
            cr.Contact__c= c.Id;
            ConList.add(cr);
        }
    }
    insert ConlIst;

    }
}