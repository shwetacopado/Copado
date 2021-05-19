trigger OpportunityLineItemTrigger on OpportunityLineItem (After Update) {
    List<Id> oppIds = new List<id>();
    Decimal ContractLengthMonths = 0;
    
    if (trigger.isAfter)
    {
        for (OpportunityLineItem oli3 :trigger.new)
        {
            oppIds.add(oli3.opportunityId);
            List<OpportunityLineItem> allOLI = [Select id,Number_of_Months__c from OpportunityLineItem where OpportunityId in:oppIds];
            List<Opportunity> oppstoupdate    = [Select id,Contract_Length_Months__c from Opportunity where id in:oppIds];
            
            if(allOLI.size() > 0)
            {
                for(OpportunityLineItem alloli2 : allOLI)
                {
                    if (alloli2.Number_of_Months__c > ContractLengthMonths)
                        ContractLengthMonths = alloli2.Number_of_Months__c;
                }
            }
         for (Opportunity oppUpdate : oppsToUpdate)
             oppUpdate.Contract_Length_Months__c = ContractLengthMonths;
        
        }
        
    }
}