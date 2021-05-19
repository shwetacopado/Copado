public class ContactSaveExtension {
    
    Contact newCon;
    public ContactSaveExtension(Apexpages.StandardController con)
    {
        this.newCon = (Contact)con.getRecord();
    }
    

}