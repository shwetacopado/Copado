@isTest
public class AccountProcessTest {

    public static testmethod void TestAccountProcessTest()
    {
        Account a = new Account();
        a.Name = 'Test Account';
        insert a;
        
        Contact cont = new Contact();
        cont.FirstName = 'Bob';
        cont.LastName  = 'Masters';
        cont.AccountId = a.id;
        insert cont;
        
        set<ID> setacctid = new set<ID>();
        setacctid.add(a.id);
        
        Test.startTest();
          AccountProcessor.countContacts(setacctid);
        Test.stopTest();
        
        Account acc = [select Number_of_contacts__c	 from Account where id =:a.Id Limit 1];
        System.assertEquals(Integer.valueOf(acc.Number_of_contacts__c), 1);
    }
}