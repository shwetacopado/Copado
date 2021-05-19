Public Class AccountHandler

{
  Public static Account insertNewAccount(String AcName)
  
  {
  
     
        Account acc = new Account(Name = AcName);
       
       
   try
   {
      insert acc;
   }
     
     Catch(System.DmlException e)
     {
        System.debug('Account not created');
        return null;
     }
     
  
        return acc;
  
  
  }
  
  

}