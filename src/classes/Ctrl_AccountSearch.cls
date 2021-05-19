public with sharing class Ctrl_AccountSearch

{
    public list<Account> accounts {get;set;}
    public String name {get; set;}
    
    public Ctrl_AccountSearch()
    {
        accounts = new List<Account>();
    }
    
    public pageReference SearchAccounts()
    {
        accounts = [Select Id,Name from Account where Name =:name];
        return null;
    }
}