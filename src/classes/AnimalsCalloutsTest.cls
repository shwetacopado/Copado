@isTest
Private Class AnimalsCalloutsTest {
 
@isTest static void testgetCallout()
{
    // create the Mock response based on the static resource
    StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
    mock.setStaticResource('GetAnimalResource');
    mock.setStatusCode(200);
    mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
    //Associate the callout with a mock response
    Test.setMock(HttpCalloutMock.class,mock);
    //call method to test
    HttpResponse result = AnimalsCallouts.makeGetCallout();
    //verify mock response is not null
    System.assertNotEquals(null,result,'the callout returned a null response.');
    //verify status code
    System.assertEquals(200,result.getStatusCode(),'the status code is not 200.');
    //verify content type
    System.assertEquals('application/json;charset=UTF-8',result.getHeader('Content-Type'),'The content type value is not expected.');
    //verify the array 
    Map<String,Object> results = (Map<String,Object>)JSON.deserializeUntyped(result.getBody());
    List<Object> animals = (List<Object>) results.get('anilmals');
    System.assertEquals(3,animals.size(),'the array should only contain 3 items');
    
}    
    

}