trigger CaseStatus on Case (before insert) {

   for (Case mycase : Trigger.new)
   {
       if (mycase.ContactId != null)
       {
           List <Case> c = [Select id from Case where ContactId =: mycase.ContactId and createddate = Today];
           
           if (c.size()>=2)
           {
               mycase.Status = 'Closed';
           }
       }
       if( mycase.AccountId != null)
       {
           List<Case> c1 = [Select Id from Case where AccountId=:mycase.AccountId and createddate = Today];
           
           
           if (c1.size()>=3)
           {
               mycase.Status = 'Closed';
           }
       }
   }
}