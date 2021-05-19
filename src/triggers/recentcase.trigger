trigger recentcase on Case (after insert) {

    for (Case mycase : Trigger.new)
    {
        if (mycase.ContactId !=null)
        {
            Contact mycon = [Select Id from Contact where Id=:myCase.ContactId];
            mycon.OwnerId = mycase.CreatedById;
            update mycon;
        }
        
        if (mycase.AccountId !=null)
            
        {
            Account myacc = [Select Id from Account where Id=:mycase.AccountId];
            myacc.OwnerId = mycase.CreatedById;
        }
        
    }
}