@istest
private class LeadProcessorTest {

    @testsetup
    static void setup()
    {
        List<Lead> testlead = new List<Lead>();
        //insert 200 records
        for (integer i=0; i<200; i++)
        {
            testlead.add(new Lead(FirstName = 'Lead'+i, LastName = 'Last',Company = 'company'+i));
        }
        insert testlead;
    }
     static testmethod void test()
     {
         Test.startTest();
         LeadProcessor Lp = new LeadProcessor();
         Id batchId = Database.executeBatch(Lp);
         Test.stopTest();
         System.assertEquals(200, [select count() from Lead where LeadSource = 'Dreamforce']);
     }
}