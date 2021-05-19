Public Class OpportunityList2con {
 
   Public ApexPages.StandardSetController setCon
   {
        get{
        
              if (setCon==Null)
              
              {
                 setCOn = new ApexPages.StandardSetController(Database.getQueryLocator([Select Name,CloseDate from Opportunity]));
              }
              
                 return setCon;
        }
   
   
   set;
   
   }

  Public List<Opportunity> getOpportunities()
  {
    return (List<Opportunity>) setCon.getRecords();
  }
}