@istest
public class AddPrimaryContactTest {

    @testsetup
    static void setup()
    {
        List<Account> accounts = new List<Account>();
        // add the account with billing state 'NY'
        for(integer i = 0; i<50; i++)
        {
            accounts.add(new Account(name='Test Account'+i,BillingState = 'NY'));                     
        }
       
        for (integer j=50;j<100; j++)
        {
            accounts.add(new Account(name='test Account'+j,BillingState = 'CA'));
        }
        insert accounts;
    }
    
    
    static testmethod void testQueueable()
    {
        Contact c = new Contact();
        c.FirstName = 'demo';
        c.LastName  = 'demo';
        insert c;
        string strstate = 'CA';
        AddPrimaryContact addcontact = new AddPrimaryContact(c,strstate);
        Test.startTest();
        System.enqueueJob(addcontact);
        Test.stopTest();
        System.assertEquals(50, [select count() from Contact where accountID IN (SELECT id FROM Account WHERE BillingState = :strState)]);
        
    }
}