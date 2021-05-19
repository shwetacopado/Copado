public class Changeownerrelationship {
    public void updateContactRelationshipNameByOwner(list<Contact_Relationship__c> cont_rel)
    {
       // Map<Id,Id> map_id_Own = new Map<Id,Id>();
    Map<Id,String> map_id_name = new Map<Id,String>();
    set<id> Idset = new set<id>();
    for(Contact_Relationship__c List_recs:cont_rel)
    {
        Idset.add(List_recs.OwnerId);
    }
    
    list<user> u = [Select id,Name from user where id in:Idset];
    for(user list_user : u)
    {
        map_id_name.put(list_user.id,list_user.Name);
    }
    for(Contact_Relationship__c List_recs:cont_rel)  
    {
        if (List_recs.Ownerid != null)
        {
            List_recs.Name = map_id_name.get(List_recs.OwnerId);
        }
    }
    }

}