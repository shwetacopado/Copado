trigger Obje1obj2 on Obj1__c (before insert,before update) {
    
    List<Obj2__c> objlist = new List<Obj2__c>();
    Set <Obj2__c>objset = new Set<Obj2__c>();
    
    for (Obj1__C oj1 : Trigger.new)
    {
         	 if (oj1.Obj2__c!=null && oj1.Qunatity__c!= null)
             {
                  Obj2__c obj2 = new Obj2__c();
                 obj2.Id = oj1.obj2__c;
                 obj2.Name = oj1.Name;
                 obj2.Amount__c = oj1.Qunatity__c;
                 objset.add(obj2);
             }}
        
    objlist.addAll(objset);
    update objlist;
    

}