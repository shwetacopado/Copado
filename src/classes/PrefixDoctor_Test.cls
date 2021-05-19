@istest 

public class PrefixDoctor_Test {
   public static testmethod void PreDoctor()
   {
       Lead a = new Lead();
       a.FirstName = 'Lokesh';
       a.LastName  = 'Kumar';
       a.Company  = 'INFA';
       a.Status   =  'Open - Not Contacted';
       insert a;
       System.assertEquals('Dr. Lokesh Kumar', a.Name);
       
   }

}