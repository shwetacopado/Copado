public class HelloWorld 
{

public void addHelloWorld(List<account> accs)
{
   for (Account a : accs)
   {
   
      if (a.Hello__c != 'World')
      {
         a.Hello__c = 'World';
      }
   
   }
}
   
}