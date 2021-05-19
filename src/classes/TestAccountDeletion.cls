@istest
private class TestAccountDeletion {
    @istest static void TestDeleteAccountWithOneOpportunity()
    {
      //test data setup
       // Create one account with one opportunity by calling a utility method
Account[] accts = TestDataFactory.createAccountsWithOpps(1,1);
     //perform test
    
      Test.startTest();
      Database.DeleteResult result = Database.delete(accts[0],false);
      Test.stopTest();
      // verify 
      // in this the deletion should have been stopped by the trigger,so verify that we got an error
      System.assert(!result.isSuccess());
      System.assert(result.geterrors().size()>0);
      System.assertEquals('Cannot delete account with related opportunities.',result.getErrors()[0].getMessage());  
     }
    
    @istest static void TestDeleteAccountWithNoOpportunities()
    {
        //test Data setup
        //Create one account with no opportunities by calling a utility method
       Account[] accts = TestDataFactory.createAccountsWithOpps(1,0);

        //perform test
        
        Test.startTest();
        Database.DeleteResult result = Database.delete(accts[0],false);
        Test.stopTest();
        //verify that delete was sucessful
        System.assert(result.isSuccess());
    }
    
    @istest static void TestDeleteBulkAccountsWithOneOpportunity()
    {
        //test data setup
        //create accounts with one opportunity by calling utility method
       Account[] accts = TestDataFactory.createAccountsWithOpps(200,1);

        //perform test
        Test.startTest();
        Database.DeleteResult[] results = Database.delete(accts, false);

        Test.stopTest();
        //verify for each record
        // In this case the deletion should have been stopped by the trigger
        //so check we got back an error
        for (Database.DeleteResult dr : results)
        {
            System.assert(!dr.isSuccess());
            System.assert(dr.getErrors().size()>0);
            System.assertEquals('Cannot delete account with related opportunities.',dr.getErrors()[0].getMessage());
                
        }
    }
     @istest static void TestDeleteBulkAccountsWithNoOpportunity()
    {
        //test data setup
        //create accounts with one opportunity by calling utility method
 Account[] accts = TestDataFactory.createAccountsWithOpps(200,0);

        //perform test
        Test.startTest();
          Database.DeleteResult[] results = Database.delete(accts, false);

        Test.stopTest();
        //verify for each record
        // In this case the deletion should have been stopped by the trigger
        //so check we got back an error
        for (Database.DeleteResult dr : results)
        {
           System.assert(dr.isSuccess());

                         
        }
    }
}