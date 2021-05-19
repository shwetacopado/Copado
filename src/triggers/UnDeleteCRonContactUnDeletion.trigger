trigger UnDeleteCRonContactUnDeletion on Contact(After Undelete) {

    list<Contact> listOfContacts=[select Id from Contact where isdeleted = true and Id IN : trigger.new] ;
       
        for (Contact c : listOfContacts)
        {
            
           listofContacts.add(c);

        }
        update listOfContacts;
}