public class SOSLSearchController {
    
    Public List<Opportunity> optyList{get;set;}
    Public List<Contact> conList{get;set;}
    Public List<account> accList{get;set;}
    
    Public String searchstr{get;set;}
    
    public void searchSOSLmethod()
    {
        optyList = new List<Opportunity>();
        conList  = new List<contact>();
        accList  = new List<Account>();
        if(searchstr.length()>1)
        {
            String inputstring = '*'+searchstr+'*';
            String searchQuery = 'FIND \''+inputstring+ '\' IN ALL FIELDS RETURNING Account (Id,Name,type,rating),Contact(name,email),Opportunity(name,stagename)';
            
            List<List<sObject>>searchList = search.query(searchQuery);
            accList = ((List<Account>)searchList[0]);
            conList = ((List<Contact>)searchList[1]);
            optyList = ((List<Opportunity>)searchList[2]);
            if(accList.size()==0 && conList.size()==0 && optyList.size()==0)
            {
                apexpages.addMessage(new apexpages.Message(apexpages.Severity.ERROR,'Sorry,No result found with matching string'));
                return;
            }
        }
        else
        {
                   apexPages.addmessage(new apexpages.message(apexpages.severity.Error, 'Please enter at least 2 characters..'));
           return;
        }
    }

}