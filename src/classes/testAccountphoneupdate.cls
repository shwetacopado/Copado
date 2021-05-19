@isTest
public class testAccountphoneupdate {

    @istest public static void testaccupdate()
    {
        Account myacc = new Account();
        String Country = 'US';
        myacc.Name    = 'temp';
        myacc.BillingCountry = Country;
       // myacc.Phone   = '9731644226';
        insert myacc;
        
        List <Contact> Contacts   = new List <Contact>();
        Contact consamecountry = new Contact();
        consamecountry.FirstName = 'Sansa';
        consamecountry.LastName  = 'stark';
        consamecountry.AccountId = myacc.id;
        consamecountry.MailingCountry = country;
        contacts.add(consamecountry);
           
           
        //update the account phone number
        String phonenumber= '973164426';
        myacc.Phone       = phonenumber;
        update myacc;
        
        Contacts = [Select otherphone from Contact where AccountId = :myacc.Id];
        
        for (Contact con : contacts)
        {
            System.assertEquals(phonenumber,con.OtherPhone);
        }
        
    }
}