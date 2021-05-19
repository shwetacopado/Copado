public with sharing class AccounttriggerHandler
{
  public static void CreateAccounts(List<Account> accts)
  {
    For (account a : accts)
    {
         if(a.ShippingState != a.BillingState)
         {
           a.ShippingState = a.BillingState;
         }
    }

  }
}