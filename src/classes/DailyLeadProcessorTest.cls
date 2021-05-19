@istest
public class DailyLeadProcessorTest {
   
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    static testmethod void testscheduledJob()
    {
        List<Lead> leads = new List<Lead>();
        for (integer i=0; i<200; i++)
        {
            leads.add(new Lead(LastName='Dreamforce'+i, Company='Test1 Inc.', Status='Open - Not Contacted'));
        }
        insert leads;
        
        test.startTest();
        String jobId = System.schedule('DailyLeadProcessor', CRON_EXP, new DailyLeadProcessor());

    }

}