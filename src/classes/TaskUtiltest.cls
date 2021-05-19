@istest
private class TaskUtiltest {

    @istest static void testtaskpriority()
    {
        string pri = Taskutil.getTaskPriority('NY');
        system.assertEquals('Normal',pri);
    }
    
    @istest static void testhighpriority()
    {
         string pri = Taskutil.getTaskPriority('CA');
         system.assertEquals('High',pri);
    }
    
    @istest static void testTaskPriorityInvalid()
    {
        string pri = Taskutil.getTaskPriority('Monaca');
        system.assertEquals('null',pri);
    }
}