@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing Class AccountManager
{
  @HttpGet
  Global static Account getAccount()
  {
    RestRequest request = RestContext.request;
    //grab the account ID form the end of the URL
    String AccountId    = request.requestURI.substringBetween('Accounts/', '/contacts');
    Account result = [Select Id,Name,(select Id,Name from Contacts) from Account where Id =:AccountId];
    return result;
  }
}