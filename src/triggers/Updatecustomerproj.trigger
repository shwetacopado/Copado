trigger Updatecustomerproj on Customer_Project__c (After insert) {

  // List<Customer_Project__c> cp = new List<Customer_Project__c	>();
    List<Opportunity> opps = new List<Opportunity>();
    for(Customer_Project__c cps : trigger.new)
    {
       if (cps.Status__c == 'Active')
        {
            Opportunity opp = new Opportunity(id=cps.Opportunity__c);
           opp.Active_Customer_project__c = True;
           
           // cp.add(cps);
             opps.add(opp);
        }
        
           }
    //insert cp;
     update opps;
}