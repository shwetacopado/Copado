public class ContactMasterHandler_Undelete {
    
    public void undeleteContactRelationshipsByContact(list <Contact> List_Contacts)
    {
     
         list<Contact> listOfContacts=[select id from Contact where IsDeleted = True  All Rows] ;
        undelete listOfContacts;
    }

}