public class AccountProcesser {
 @Future
    
 Public static void countContacts(Set<id> setId)
 {
     List<Account> istAccount = [Select id,Number_of_contacts__c,(Select id from contacts) from Account where id in:setId];
     
     for(Account ac : istAccount)
     {
         List<Contact> istcont = ac.contacts;
         
         ac.Number_of_contacts__c	= istcont.size();
     }
     
     update istAccount;
 }

}