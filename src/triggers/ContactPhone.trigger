trigger ContactPhone on Contact (After update) {

    Map<Id,String> accountAndPhonemap = new Map<Id,String>();
    Set<ID> aID = new set<ID>();
    List<Account> acclist = new List<Account>();
    if (trigger.isUpdate)
    {
    
    for (Contact con : Trigger.new)
    {
        if (con.Phone != null)
        {
             aid.add(con.AccountId);
            accountAndPhonemap.put(con.AccountId,con.Phone);
        }
    }
    
    for (Account a:[Select id,phone,(select id,phone from contacts) from Account where ID IN:aID])
                    {
                        a.Phone = accountAndPhonemap.get(a.id);
                        acclist.add(a);
                    }
                    
                    update acclist;
}
}