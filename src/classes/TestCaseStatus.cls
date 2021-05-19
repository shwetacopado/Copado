@isTest
public class TestCaseStatus {
    
@isTest static void nocasetoday()
{
    Contact con = new Contact();
    con.LastName = 'Snow';
    insert con;
    
    Case myCase      = new Case();
    myCase.ContactId = con.Id;
    myCase.Status    = 'New';
    
    Case updatedcase = [Select Status from Case where Id=:myCase.Id];
    System.assertEquals('New', updatedcase.Status);
}
    
@isTest  static void threecasesTodayonContact()
{
    
    Contact con = new Contact();
    con.LastName = 'Snow';
    insert con;
    
    List<Case> oldcases = new List<Case>();
    for(Integer i = 0;i<2; i++)
    {
        Case oldcase = new case();
        oldcase.ContactId = con.id;
        oldcases.add(oldcase);
    }   
     insert oldcases;
    
    Case mycase = new Case();
    mycase.ContactId = con.Id;
    insert mycase;
    
    Case UpdatedCase = [Select id from Case where Id =:mycase.Id];
    
    System.assertEquals('Closed', UpdatedCase.Status);
    
} 
    @istest static void fourcasesTodayOnAccount()
    {
        Account acc = new Account();
        acc.Name = 'Winterfall Hotels';
        insert acc;
        
        List<Case> oldcases = new List<Case>();
        for (Integer i =0; i<3; i++)
        {
            Case oldcase = new Case();
            oldcase.AccountId = acc.Id;
            oldcases.add(oldcase);
        }
        insert oldcases;
    
    Case mycase = new Case();
    mycase.AccountId = acc.Id;
    
    insert mycase;
    Case updatedcase = [select Status from Case where Id = :mycase.Id];
    System.assertEquals('Closed', updatedcase.Status);
}
}