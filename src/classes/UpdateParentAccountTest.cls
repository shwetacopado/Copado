@istest
public class UpdateParentAccountTest {

    @testsetup
    
    static void setup()
    {
        //add a parent account
        List<Account> accounts = new List<Account>();
        accounts.add(new Account(name='parent'));
        //add 100 child accounts
        for (Integer i = 0;i<100; i++)
        {
            accounts.add(new Account(name='testAccount'+i));
        }
         insert accounts;
    }
    
    static testmethod void testQueueable()
    {
        //query for test data to pass to queueable class
        Id parentId = [Select id from account where name = 'parent'][0].Id;
        List<Account> accounts = [select id,name from account where name like 'testAccount%'];
        //create our queueable instance
        
        UpdateParentAccount updater = new UpdateParentAccount(accounts,parentId);
        Test.startTest();
        System.enqueueJob(updater);
        test.stopTest();
        System.assertEquals(100,[Select count() from account where parentId = :parentId]);
    }
    
}