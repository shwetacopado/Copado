@isTest
private class AutoUnqualifyLeadstest {
@testsetup
    
    static void setupTest()
    {
        List<lead> leadLoad = test.loadData(Lead.sobjectType, 'testLeadsAutoUnqual');
        system.debug(leadLoad);
    }
    
    @istest
    static void testLeads()
    {
        test.startTest();
        AutoUnqualifyLeads aul = new AutoUnqualifyleads();
        Id batchId = Database.executeBatch(aul);
        test.stopTest();
            
        System.assertEquals(3,[Select count() from lead where Status = 'Unqualified']);   
    }
}