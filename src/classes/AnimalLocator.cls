public class AnimalLocator
{
 public static String getAnimalNameById(integer id)
 {
 Http http = new Http();
 HttpRequest request = new HttpRequest();
 request.setEndPoint('https://th-apex-http-callout.herokuapp.com/animals/' +ID);
 request.setMethod('GET');
 HttpResponse response = http.send(request);
 String strResp = '';
 system.debug('******response '+response.getStatusCode());
 system.debug('******response '+response.getBody());

 // if the request is successful, parse the JSON response.
 
 if(response.getStatusCode()==200)
 {
  // Deserializes the JSON string into collections of primitive data types.
  MAP<String,Object> results = (MAP<String,Object>)JSON.deserializeUntyped(response.getBody());
  // Cast the values in the 'animals' key as a list
  Map<string,object> animals = (map<string,object>) results.get('animal');
  System.Debug('Recieved the following animals:'  + animals);
  strResp = string.valueof(animals.get('name'));

     System.Debug('strResp >>>>>>' + strResp);
 }
 
    return strResp;
 }
}