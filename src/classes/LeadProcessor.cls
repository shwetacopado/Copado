global class LeadProcessor implements database.Batchable<sobject> {
    
    global Database.QueryLocator start (Database.BatchableContext bc)
    {
        return Database.getQueryLocator([Select LeadSource from Lead]);
    }
    
    global void execute(Database.BatchableContext bc, List<Lead> scope)
    {
        //process each batch of records
        
        for (Lead templead : scope)
        {
            templead.leadsource = 'Dreamforce';
        }
            update scope;
    }
    
    global void finish(Database.BatchableContext bc){   }  

}