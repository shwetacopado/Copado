global class AutoUnqualifyLeads implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start (Database.BatchableContext BC)
    {
        String query = 'Select Id,status,LastActivityDate' + 'from lead' + 'Where CreatedDate < Last_N_Days:60' + 'AND Days_Since_Last_Activity__c>10' + 'AND isConverted = false'
            + 'AND Status !='+' \'Unqualified\' ';
        return Database.getQueryLocator(query);
    }
global void execute(Database.BatchableContext bc,List<Lead> scope)
{
    List<lead>leads = new List<Lead>();
    for(Lead l : scope)
    {
       l.status = 'Unqualified';
        system.debug(l);
        leads.add(l);
    }
    update leads;
    }    
    
   global void finish(Database.BatchableContext bc)
   {
       
   }
    

    
}