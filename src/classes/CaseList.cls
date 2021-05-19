public class CaseList {

    public List<Case> lstcase{get;set;}
    public CaseList()
    {
        List<case> caseList = [Select Id,CaseNumber,Account.Name,Contact.Name from Case order by createddate desc];
        if(caseList!=null && caseList.size()>0)
        {
            lstcase=caseList;
        }
        else
        {
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'No Case found');
            Apexpages.addMessage(myMsg);
        }
    }
}