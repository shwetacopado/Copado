Trigger FindDupes on Lead(before insert,before update)
{
  for(Lead myLead : Trigger.new)
{
   if (myLead.Email != null)
    {

      List<Contact> dupes = [Select Id from Contact where Email = :myLead.Email];
       

       if (dupes.size() > 0)
       {
         myLead.Dupe_Contact__c = dupes[0].Id;
         //Display error Messgae
         myLead.addError('There is already a contact with this email address!' + myLead.Dupe_Contact__c);
        }
         else
       
        {

            myLead.Dupe_Contact__c = null;
        }

       }
    }

}