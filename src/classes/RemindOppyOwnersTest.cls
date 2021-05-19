@isTest
private class RemindOppyOwnersTest {

    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    
    static testmethod void testScheduledJob()
    {
        List<Opportunity> opptys = new List<Opportunity>();
        Date closeDate = Date.today().addDays(-7);
        for (Integer i=0;i<10;i++)
        {
            Opportunity o = new Opportunity(Name = 'Opportunity'+i,CloseDate=closeDate,StageName='Prospecting');
            opptys.add(o);            
        }
        insert opptys;
        //get the IDs of the opportunities we just inserted
        Map<Id,Opportunity> opptyMap = new Map<Id,Opportunity>(Opptys);
        List<Id> opptyIds            = new List<Id>(opptyMap.keySet());
        Test.startTest();
        String jobId = System.Schedule('ScheduleApexTest',CRON_EXP,new RemindOpptyOwners());
        List<Task> lt = [Select Id from Task where whatId IN: opptyIds];
        Test.stopTest();
   
        lt = [Select id from Task where WhatId IN :opptyIds];
        System.assertEquals(opptyids.size(),lt.size(),'Tasks were not created');
        
    }
}