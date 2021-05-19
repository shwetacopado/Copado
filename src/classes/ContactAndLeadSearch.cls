public class ContactAndLeadSearch
{

  public static List<List<sobject>> searchContactsAndLeads(string LName )
  
  {
    List<List<sobject>> searchlist = [FIND 'Smith' IN ALL FIELDS RETURNING ACCOUNT(name),Lead(Name)];
  
     return searchlist;
}
}