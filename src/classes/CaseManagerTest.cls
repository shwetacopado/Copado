@isTest
public class CaseManagerTest {

    @isTest static void testGetCasebyId()
    {
        Id recordId = createtestRecord();
        //set up a test request
        RestRequest request = new RestRequest();
        request.requestURI  = 'https://ap1.salesforce.com/services/apexrest/Cases/'+recordId;
        request.httpMethod  = 'Get';
        RestContext.request =  request;
        //call the method to test
        Case ThisCase       =  CaseManager.getCasebyId();
        //Verify results
        System.assert(ThisCase!=null);
        System.assertEquals('Test Record',thisCase.Subject);
     }
    
    @isTest static void testCreateCase()
    {
        //Call the method to test
        ID thisCaseId = CaseManager.createcase('Ferocious chipmunk', 'New', 'Phone', 'Low');
        //Verify Results
        
        System.assert(thisCaseId !=Null);
        Case thisCase = [Select Id,Subject from Case where Id =: thisCaseId];
        System.assert(thisCase != Null);
        system.assertEquals(thisCase.Subject,'Ferocious chipmunk');
     }
    
    @isTest static void testDeletecase()
    {
        Id recordId = createtestRecord();
        //set up a test request
        
        RestRequest request = new RestRequest();
        request.requestURI = 'https://ap1.salesforce.com/services/apexrest/Cases/'+recordId;
        request.httpMethod = 'Get';
        RestContext.request = request;
        // call the method to test
        CaseManager.DeleteCase();
        //verify record is deleted
        List<Case> cases = [Select Id from Case where Id = :recordid];
        System.assert(cases.size()==0);
    }
   
    @isTest static void testUpsertCase()
    {
        //1. insert new record
        ID case1Id = CaseManager.upsertCase('Ferocious chipmunk', 'New', 'Phone', 'Low', null);
        // verify new record was created
        System.assert(case1Id!=null);
        Case case1 = [Select Id,Subject from Case where Id =:case1Id];
        System.assert(case1!=null);
        System.assertEquals(case1.Subject,'Ferocious chipmunk');
        //2. Update status of existing record
        ID case2Id = CaseManager.upsertCase('Ferocious chipmunk', 'Working', 'Phone', 'Low', case1Id);
        //verify record was updated
        System.assertEquals(case1Id,case2Id);
        Case case2 = [Select Id,status from Case where Id = :case2Id];
        System.assert(case2 != null);
        System.assertEquals(case2.Status,'Working');
     }
    
    @isTest static void testUpdateCaseFields()
    {
        Id recordId         = createTestRecord();
        RestRequest request = new RestRequest();
        request.requestURI  = 'https://yourInstance.salesforce.com/services/apexrest/Cases/'+ recordid;
        request.httpMethod  = 'Patch';
        request.addHeader('Content-Type','application/json');
        request.requestBody = Blob.valueOf('{"status": "Working"}');
        RestContext.request = request;
        //update status of exisitng record to Working
        ID thisCaseId       = CaseManager.updateCaseFields();
        //verify record was updated
        System.assert(thisCaseId!=null);
        Case thisCase       = [select id,Status from Case where Id=:thisCaseId];
        System.assert(thisCase!=null);
        System.assertEquals(thisCase.Status,'Working');
    }
    
    //Helper Method
    
    static Id createTestRecord()
    {
        //create test record
            Case caseTest = new Case(
            Subject =  'Test record',
            Status  =  'New',
            Origin  =  'Phone',
            Priority=   'Medium');
           insert caseTest;
           return caseTest.Id;
    }
}