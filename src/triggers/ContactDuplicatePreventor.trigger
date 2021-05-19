trigger ContactDuplicatePreventor on Contact (before insert,before update) {
    
    Map<String,Contact> ConMap = new Map<String,Contact>();
    Set<id> setContID = new set<id>();
    for (Contact c : System.Trigger.new)
    {
        if ((c.Email != null) && (System.Trigger.isInsert || (c.Email != System.Trigger.oldMap.get(c.Id).Email)) ) 
        {
            setContID.add(c.Id);
            if (ConMap.containsKey(c.email))
            {
                c.email.addError('Another contact has same email address');
            }
            else {
                ConMap.put(c.Email, c);
            }
        }
    }

    for (Contact contact : [Select email from Contact where email IN:ConMap.keySet() and Id not in:setContID] )
    {
        contact.Email.addError('A Contact with this email address already exists');
    }
}