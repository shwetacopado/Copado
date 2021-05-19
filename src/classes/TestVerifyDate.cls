@istest

private class TestVerifyDate {
   private static Date dateToday = date.today();

   private static Integer totalDays = Date.daysInMonth(dateToday.year(), dateToday.month());

    @istest static void testolddate()
    {
        date dat = VerifyDate.CheckDates(dateToday,dateToday.addDays(-1));
        system.assertEquals(date.newInstance(dateToday.year(), dateToday.month(), totalDays),dat);
    }
    
    @istest static void testlessthan30days()
       { 
        date dat = VerifyDate.CheckDates(dateToday,dateToday.addDays(20));
        System.assertEquals(dateToday.addDays(20), dat);

       }
    
    @isTest static void testmorethan30days()
    {
        date dat = VerifyDate.CheckDates(dateToday,dateToday.addDays(31));
        System.assertEquals(date.newInstance(dateToday.year(), dateToday.month(), totalDays), dat);
        
    }
}