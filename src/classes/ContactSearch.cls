Public class ContactSearch{
 
 public static List<Contact> searchForContacts (String lName,String PostalCode) {
    //Initialize the two required strings. Can't remember how to 
       String MailingPostalCode = PostalCode;
        List<Contact> foundContacts = [SELECT Id,FirstName,LastName 
                                    FROM Contact 
                                    WHERE LastName=:lName AND MailingPostalCode=:MailingPostalCode
                                    ];
        return foundContacts;
        
    } 
   
}