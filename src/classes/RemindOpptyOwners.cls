global class RemindOpptyOwners implements schedulable {

    global void execute(SchedulableContext ctx)
    {
        List<Opportunity> opptys = [Select Id,Name,ownerID,CloseDate from Opportunity where IsClosed = False AND CloseDate<Today];
               TaskUtils.remindOwners(opptys);

    }
}