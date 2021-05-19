public class ObjectNamesController{
    public Map<String, schema.SObjectType> allObjects {get;set;}
    public List<SelectOption> objNames {set;}
    public String selectedName  {get; set;}
     
    public ObjectNamesController(){

    }

    public List<SelectOption> getobjNames(){
        list<selectoption> objNames = new List<selectoption>();
        allObjects = schema.getGlobalDescribe();
        system.debug('allObjects'+allObjects );
        list<string> allNames = new list<string>(allObjects.keySet());
        system.debug('allNames'+allNames);
            for( String key1 : allNames){
                objNames.add(new SelectOption(key1,key1));
                system.debug('key1 '+key1 );
            }
        system.debug('Line22'+objNames); 
       return objNames;    
    }   
}