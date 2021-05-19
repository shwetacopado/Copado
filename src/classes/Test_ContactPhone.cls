@istest
public class Test_ContactPhone {
  
    public static testmethod void contactphone()
    {
        Account a = new Account();
        a.Name    = 'temp';
        insert a;
        Contact c = new Contact();
        c.FirstName = 'ABC';
        c.LastName  = 'XYZ';
        c.Phone     = '9731644226';
        c.AccountId = a.Id;
        insert c;
        c.Phone = '9620074569';
        a.Phone = c.Phone;
        update c;
        System.assertEquals(a.Phone,'9620074569');
    }
}