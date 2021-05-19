public class AddPrimaryContact  implements Queueable{

    private Contact c;
    private string state;
    
    public AddPrimaryContact(Contact c, string state )
    {
        this.c = c;
        this.state = state;
    }
    
    public void execute(QueueableContext context)
    {
        List<Account> ListAccount = [select ID,name, (select id,FirstName,lastName from contacts) from Account where BillingState = : state Limit 200];
        List<Contact> lstContact = new List<Contact>();
        for (Account acc : ListAccount)
        {
            Contact con =   c.clone(false,false,false,false);
            con.AccountId = acc.id;
            lstContact.add(con);
        }
        
        if (lstContact.size()>0)
        {
            insert lstContact;
        }
    }
    }