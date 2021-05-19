@isTest

Public Class TestFindDupe {

  Static testmethod void testdupes()
  {
    // Let's create our records from scratch
    Contact c = new Contact();
    c.FirstName = 'Stephan';
    c.LastName = 'Curry';
    c.Email = 'stephcurry@gsw.com';
    insert c;

    // Now Let's create a dupe Lead
    Lead dupeLead = new Lead();
    dupeLead.FirstName = 'steph';
    dupeLead.LastName = 'Curry';
    dupeLead.Company = 'Golden State Warroirs';
    dupeLead.Email = 'stephcurry@gsw.com';

    // This is a special way of doing risky things

    try
    {
        insert dupeLead;
    }

    Catch (Exception e)
    {
        System.Debug('An Error happened,as predicted');
    }

    //Now try to find out the dupe lead

    List<Lead> dupes = [Select Id from Lead where Email = 'stephcurry@gsw.com'];
    System.assertEquals(0,dupes.size());

    // Now we break the trigger by inserting the non-dupe value

    Lead legitLead = new Lead();
    legitLead.FirstName = 'David';
    legitLead.LastName = 'Lee';
    legitLead.Company = 'informatica';
    legitLead.Email = 'dlee@gsw.com';

     insert legitLead;

     // Now try to find out the legit lead, by email

     List<Lead> legits = [Select Id from lead where Email = 'dlee@gsw.com'];
     System.assertEquals(1,legits.size());
    }


  }