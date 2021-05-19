Public Class AccountUtils {

Public Static List<Account> AccountsByState(String st)

{
    List<Account> acctlist = [Select Id,Name from Account where BillingState=:st];
    return acctlist;
}


}