@RestResource(urlMapping='/Cases/*')

global with sharing class CaseManager{

@HttpGet

global static Case getCasebyId()
{
  RestRequest request = RestContext.request;
  String CaseId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
  Case result = [Select CaseNumber,Subject,Status,Origin,Priority from Case Where ID = :caseid];
  return result;
}
@HttpPost
global static ID createCase(String subject,String status,String origin,String priority)
{
  Case thisCase =  new Case(
  Subject = subject,
  Status  = status,
  Origin  = origin,
  Priority = priority);
  insert thiscase;
  return thiscase.id;
}

@HttpDelete
global static void DeleteCase()
{
  RestRequest request = RestContext.request;
  String CaseID = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
  Case thisCase = [Select Id from Case where Id = :CaseID ];
  delete thisCase;
}

@HttpPut
global static ID upsertCase(String subject,String status,String origin,String priority,String id)
{
  Case thisCase = new Case(
  Id      = id,
  Subject = subject,
  Origin  = origin,
  Priority= priority);
  upsert thisCase;
  return thisCase.Id;
}

@HttpPatch
global static ID updateCaseFields()
{
 RestRequest request = RestContext.request;
 String caseId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
 Case thisCase = [Select Id from case where id = :caseId];
 // Deserialize the JSON string into name-value pairs
 Map<String,Object> params = (Map<String,Object>)JSON.deserializeUnTyped(request.requestbody.tostring());
 
 //iterate through each parameter field and value
 for (String fieldName : params.keySet())
 {
   // Set the field and value on the Case sObject
   thisCase.put(fieldName,params.get(fieldName));
 }
 update thisCase;
 return thisCase.Id;
}
}