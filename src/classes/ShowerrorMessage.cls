public class ShowerrorMessage {
public Account account{get;set;}

public ShowerrorMessage(Apexpages.StandardController controller)
{
    account = new Account();
}
    public void save()
    {
        if (account.name=='' || account.Name==null)
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL,'Please Enter Account Name'));
        
        if (account.AccountNumber == '' || account.AccountNumber==null)
         ApexPages.addMessage(new ApexPages.message(Apexpages.Severity.ERROR,'Please enter Account Number'));
                              
        if (account.Phone=='' || account.Phone==null)
        Apexpages.addMessage(new ApexPages.message(Apexpages.Severity.WARNING,'Please enter the Account Phone Number'));
        
       if(account.site == '' || account.site == null)
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'Please       enter Account site'));
                              
      if(account.industry == '' || account.industry == null)
       ApexPages.addmessage(new    ApexPages.message(ApexPages.severity.CONFIRM,'Please enter Account industry    detail.'));
                              
              
    }

}