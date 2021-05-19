global class DailyLeadProcessor implements Schedulable {
    
    global void execute(SchedulableContext ctx)
    {
        List<Lead> leads = new List<Lead>();
        leads = [select leadsource from lead where leadsource = null];
        
        if(!leads.isEmpty())
        {
            for(Lead l : leads)
            {
                l.LeadSource = 'Dreamforce';
            }
        }
        
    }

}