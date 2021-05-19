public with sharing class FileUploadController {
    
    
    @AuraEnabled
    public static void saveChunk(Id parentId, String fileName, String base64Data, String contentType, String fileId) {
        // check if fileId id ''(Always blank in first chunk), then call the saveTheFile method,
        //  which is save the check data and return the attachemnt Id after insert, 
        //  next time (in else) we are call the appentTOFile() method
        //   for update the attachment with reamins chunks   
        if (fileId == '') {
            saveTheFile(parentId, fileName, base64Data, contentType);
        } else {
            appendToFile(fileId, base64Data); 
        }
        
        //  return Id.valueOf(fileId);
    }
    
    @AuraEnabled
    public static void appendToFile(Id fileId, String base64Data) {
        base64Data = EncodingUtil.urlDecode(base64Data, 'UTF-8');
        
        Attachment a = [
            SELECT Id, Body
            FROM Attachment
            WHERE Id =: fileId
        ];
        
        String existingBody = EncodingUtil.base64Encode(a.Body);
        
        a.Body = EncodingUtil.base64Decode(existingBody + base64Data);
        
        update a;
    }
    
    @AuraEnabled
    public static void saveTheFile(Id parentId, String fileName, String base64Data, String contentType) {
        base64Data = EncodingUtil.urlDecode(base64Data, 'UTF-8');
        Candidate__c candidate=[select id,name from Candidate__c where id=:parentId];
        fileName =  candidate.name;
        system.debug('base64Data..'+base64Data);
        system.debug('contentType..'+contentType);
        uploadToAmazonS3(fileName,candidate.name, EncodingUtil.base64Decode(base64Data),contentType);
        
    }
    
    @AuraEnabled
    public static void uploadToAmazonS3 (String fileN,string candidateNumber,blob base64Data,string contentType) {
        system.debug('candidateNumber@@'+candidateNumber);
        String key = 'AKIAI3BQI5JZBVCFXIYA';
        String secret = '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';
        String attachmentBody = EncodingUtil.base64Encode(base64Data);
        //  String base64Data = att.toString();
        String formattedDateString = Datetime.now().formatGMT('EEE, dd MMM yyyy HH:mm:ss z');
        
        String bucketname = 'awstestname';
        String host = 's3.amazonaws.com';
        String method = 'PUT';
        String filename =  fileN;
        string url = 'https://' + bucketname + '.' + host + '/' +candidateNumber + '/' + filename;
        HttpRequest req = new HttpRequest();
        req.setMethod(method);
        req.setEndpoint('https://' + bucketname + '.' + host + '/' +candidateNumber + '/' + filename);
        req.setHeader('Host', bucketname + '.' + host);
        req.setHeader('Content-Length', String.valueOf(attachmentBody.length()));
        req.setHeader('Content-Encoding', 'UTF-8');
        req.setHeader('Content-type', contentType);
        req.setHeader('Connection', 'keep-alive');
        req.setHeader('Date', formattedDateString);
      //  req.setHeader('acl', 'public-read');
      req.setHeader('x-amz-acl', 'public-read-write');

        // req.setBody(base64Data);
        Blob blobBody = EncodingUtil.base64Decode(attachmentBody);
        req.setBodyAsBlob(blobBody);
        
        String stringToSign = 'PUT\n\n' +
            ContentType + '\n' +
            formattedDateString +'\nx-amz-acl:public-read-write\n/'+ bucketname + '/' + candidateNumber + '/' + filename;
        
        String encodedStringToSign = EncodingUtil.urlEncode(stringToSign, 'UTF-8');
        Blob mac = Crypto.generateMac('HMACSHA1', blob.valueof(stringToSign),blob.valueof(secret));
        String signed = EncodingUtil.base64Encode(mac);
        String authHeader = 'AWS' + ' ' + key + ':' + signed;
        req.setHeader('Authorization',authHeader);
        String decoded = EncodingUtil.urlDecode(encodedStringToSign , 'UTF-8');
        
        Http http = new Http();
        HTTPResponse res = http.send(req);
        System.debug('*Resp:' + String.ValueOF(res.getBody()));
        System.debug('RESPONSE STRING: ' + res.toString());
        System.debug('RESPONSE STATUS: ' + res.getStatus());
        System.debug('STATUS_CODE: ' + res.getStatusCode());
        system.debug('res@@'+res.getBody());
        
        list<Candidate__c> lisOfCandidates = [select id, name, AWS_URL__c  from Candidate__c where name=:candidateNumber];
        system.debug('lisOfCandidates'+lisOfCandidates.size());
        if(lisOfCandidates.size() >0){
            lisOfCandidates[0].AWS_URL__c = url;
            upsert lisOfCandidates;
            
            
        }
    }
    @AuraEnabled
    public static string getFilesFromAWSTest (ID candidateNumber) {
        
        /*system.debug('candidateNumber@@'+candidateNumber);
String formattedDateString = Datetime.now().formatGMT('EEE, dd MMM yyyy HH:mm:ss z');
list<Candidate__c> lisOfCandidates = [select id, name from Candidate__c where id=:candidateNumber];
string candidateno = lisOfCandidates[0].name;
system.debug('candidateno@@'+candidateno);
String bucketname = 'awstestname';
String host = 's3.amazonaws.com';
String key = 'AKIAI3BQI5JZBVCFXIYA';
String secret = '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';

system.debug('formattedDateString..'+formattedDateString);
String stringToSign = 'GET\n\n\n'  +
formattedDateString + '\n' +
'/' + candidateno+ '/' ;

system.debug('stringToSign..'+stringToSign);
String encodedStringToSign = EncodingUtil.urlEncode(stringToSign, 'UTF-8');
system.debug('encodedStringToSign..'+encodedStringToSign);

Blob mac = Crypto.generateMac('HMACSHA1', blob.valueof(stringToSign),blob.valueof(secret));
String signed = EncodingUtil.base64Encode(mac);
String authHeader = 'AWS' + ' ' + key + ':' + signed;

HttpRequest req = new HttpRequest();
req.setMethod('GET');
req.setEndpoint('https://' + bucketname + '.' + host  );
req.setHeader('Host', host);

req.setHeader('Date', formattedDateString);
req.setHeader('Authorization',authHeader);
//  String decoded = EncodingUtil.urlDecode(encodedStringToSign , 'UTF-8');
Http http = new Http();
HttpResponse res = http.send(req);
system.debug('res@@..'+res);
system.debug('res@@..'+res.getBody());
system.debug('res@@..'+res.getStatus()); */
        
        list<Candidate__c> lisOfCandidates = [select id, name from Candidate__c where id=:candidateNumber];
        string candidateno = lisOfCandidates[0].name;
        String key = 'AKIAI3BQI5JZBVCFXIYA';
        String secret = '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';
        
        String bucketName = 'awstestname';
        String fileName = candidateno +'/' +candidateno;
        String formattedDateString = Datetime.now().format('EEE,   dd MMM yyyy HH:mm:ss z');
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setHeader('Date', formattedDateString);
        req.setHeader('Authorization',createAuthHeader('GET',fileName ,formattedDateString ,bucketName ,key,secret));
        Set<String> getParams = new Set<String> {
            'prefix=' + EncodingUtil.urlEncode(fileName+'/','UTF-8'),
                'delimiter=' + EncodingUtil.urlEncode('/', 'UTF-8')
                };
                    //https://s3.amazonaws.com/awstestname/C-00017/Shweta_Chadha-converted.pdf
                    //String endpointBase = 'https://s3.amazonaws.com/awstestname/C-00017/C-00017';
                    String endpointBase = 'https://'+'s3.amazonaws.com'+'/'+bucketName+'/'+candidateno+'/'+candidateno;
        //   system.debug('endpointBase@@@'+req.);
        //  String endpointBase = 'https://' + bucketname + '.s3.amazonaws.com/' +'C-00015/'+fileName;
        //  
        //s3://awstestname/C-00015/Shweta_Chadha-converted.pdf
        req.setEndpoint(endpointBase + '?' + 'prefix=' + EncodingUtil.urlEncode(fileName+'/','UTF-8')+'&delimiter=' + EncodingUtil.urlEncode('/', 'UTF-8'));
        string url = endpointBase + '?' + 'prefix=' + EncodingUtil.urlEncode(fileName+'/','UTF-8')+'&delimiter=' + EncodingUtil.urlEncode('/', 'UTF-8');
        system.debug('url@@'+url);
        String stringToSign = 'GET\n\n' +
            'pdf' + '\n' +
            formattedDateString + '\n' + 
            '/' + bucketName + '/' + fileName;
        
        Http http = new Http();
        
        HTTPResponse res = http.send(req);
        
        Blob b = res.getBodyAsBlob();
        string Contenttype=res.getHeader('Content-Type');
        system.debug('end point....'+ res.getStatusCode());
        system.debug('Blob##'+res.getHeader('Content-Type'));
        
        string extension;
        if(Contenttype == 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'){
            extension='doc';
        }
        if(Contenttype == 'application/pdf'){
            extension='pdf';
        }
        
        if(res.getStatusCode()==200){
        list<contentDocument> ContentVersionList=[select id,Title from contentDocument  where title='AwsCandidateFile'];   
        if(ContentVersionList.size()>0){
            Delete  ContentVersionList;
        }
        
        ContentVersion cont = new ContentVersion();
        cont.Title = 'AwsCandidateFile';
        cont.PathOnClient = 'file_' + Datetime.now().getTime()+'.'+extension;
        cont.VersionData = b;
        cont.Origin = 'H';
        insert cont;      
       /* ContentDocumentLink cdl = new ContentDocumentLink();
        cdl.ContentDocumentId = [SELECT Id, ContentDocumentId FROM ContentVersion WHERE Id =: cont.Id].ContentDocumentId;
        cdl.LinkedEntityId = candidateNumber;
        cdl.ShareType = 'V';
       insert cdl;*/
        //  system.debug('res..'+cont);
        /*  list<Attachment> attachmentList=[select id,Name from Attachment where Name='AwsCandidateFile'];   
if(attachmentList.size()>0){
Delete  attachmentList;
}
Attachment attachment = new Attachment();
attachment.ParentId = candidateNumber; // Something you want to link the attachment to
attachment.Name = 'AwsCandidateFile';
attachment.ContentType = ContentType;
attachment.Body = b;

insert(attachment); 
*/
        
        return  [SELECT Id, ContentDocumentId FROM ContentVersion WHERE Id =: cont.Id].ContentDocumentId;
        }
        
        return null;
        /*  
HttpRequest req = new HttpRequest();
req.setMethod('GET');
//String endpoint ='https://xxxxxx.s3.amazonaws.com/photo';
String bucketName = 'awstestname';
String fileName = 'Shweta_Chadha-converted'+'.pdf';
String formattedDateString = Datetime.now().format('EEE,   dd MMM yyyy HH:mm:ss z');
req.setHeader('Date', formattedDateString);
String stringToSign = 'GET\n\n'+formattedDateString+'\n/'+bucketName +'/candidateno/'+fileName;
Blob mac = Crypto.generateMac('HMACSHA1', blob.valueof(stringToSign),blob.valueof('AKIAI3BQI5JZBVCFXIYA'));
String sig = EncodingUtil.base64Encode(mac);
String auth = 'AWS' + ' ' + 'AKIAI3BQI5JZBVCFXIYA' + ':' + sig;
req.setHeader('Authorization',auth);
String endpointBase = 'https://s3.console.aws.amazon.com/s3/buckets/awstestname/C-00015/?region=us-east-1&tab=overview';
//system.debug(' guid '+guid);
req.setEndpoint(endpointBase );
Http http = new Http();
HTTPResponse res = http.send(req);
string photoString;
photoString = res.getBody();
photoString='data:'+res.getHeader('Content-Type')+';base64,'+EncodingUtil.base64Encode(res.getBodyAsBlob());
system.debug('photoString@@'+photoString);
system.debug('res'+res);
system.debug('res'+res.getBody());

Blob b = res.getBodyAsBlob();
system.debug('Blob##'+b);

Attachment attachment = new Attachment();
attachment.ParentId = candidateNumber; // Something you want to link the attachment to
attachment.Name = 'attachmentName';
//attachment.ContentType = 'application/pdf';
attachment.Body = b;

insert(attachment);*/
        
    }
    
    public static string createAuthHeader(String method,String filename,String formattedDateString,String bucket,String key,String secret){
        string auth;
        String stringToSign = method+'\n\n\n'+formattedDateString+'\n/'+bucket +'/'+filename;
        Blob mac = Crypto.generateMac('HMACSHA1', blob.valueof(stringToSign),blob.valueof(secret));
        String sig = EncodingUtil.base64Encode(mac);
        auth = 'AWS' + ' ' + key + ':' + sig;
        return auth;
        
    }
    
    
    /* @AuraEnabled
public static void getFilesFromAWS (ID candidateNumber) {

system.debug('candidateNumber@@'+candidateNumber);

list<Candidate__c> lisOfCandidates = [select id, name from Candidate__c where id=:candidateNumber];
string candidateno = lisOfCandidates[0].name;
system.debug('candidateno@@'+candidateno);

String key = 'AKIAI3BQI5JZBVCFXIYA';
String secret = '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';
string bucketName = 'awstestname';
String endpoint ='https://s3.console.aws.amazon.com/s3/buckets/bucketName/'+candidateno+'/?region=us-east-2&tab=overview';
system.debug('endpoint@@'+endpoint);
Http http=new Http();

HttpRequest request=new HttpRequest();
request.setMethod('GET');
request.setEndpoint(endpoint);
request.setHeader('Authorization', key); 

HTTPResponse res = http.send(request);
system.debug('res@@..'+res);
system.debug('res@@..'+res.getBody());
system.debug('res@@..'+res.getStatus());



}*/
}