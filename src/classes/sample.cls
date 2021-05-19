public class sample {
    public void uploadPDF(String binaryPdfString, String key, String secret){
        String Date1 = Datetime.now().formatGMT('EEE,   dd MMM yyyy HH:mm:ss z');
        String formattedDateString = Datetime.now().formatGMT('EEE, dd MMM yyyy HH:mm:ss z');
        String bucketname = 'candidateresumeszencloud';
        String method = 'PUT';
        String filename = 'FileName';
        HttpRequest req = new HttpRequest();
        req.setMethod(method);
        req.setHeader('Host','s3.us-east-1.amazonaws.com');
        req.setEndpoint('https://s3.us-east-1.amazonaws.com' + '/'+ bucketname + '/' + filename);
        req.setHeader('Content-Length', string.valueOf(binaryPdfString.length()));
        req.setHeader('Content-Encoding', 'base64');
        req.setHeader('Content-Type', 'pdf');
        req.setHeader('Date', Date1);
        
        //get signature string
        String stringToSign = 'PUT\n\n\n'+formattedDateString+'\n\n/'+bucketname+'/'+filename;
        String signed = createSignature(stringToSign,secret);
        String authHeader = 'AWS' + ' ' + key + ':' + signed;
        req.setHeader('Authorization',authHeader);
        Blob PDF = EncodingUtil.base64Decode(binaryPdfString);
        req.setBodyAsBlob(PDF);
        Http http = new Http();
        
        try {
            //Execute web service call
            HTTPResponse res = http.send(req);
            System.debug('RESPONSE STRING: ' + res.toString());
            System.debug('RESPONSE STATUS: '+res.getStatus());
            System.debug('STATUS_CODE: '+res.getStatusCode());
            
        } catch(System.CalloutException e) {
            system.debug('AWS Service Callout Exception: ' + e.getMessage());
        }
        
    }
    
    public string createSignature(string canonicalBuffer,String secret){
        string sig;
        Blob mac = Crypto.generateMac('HMACSHA1', blob.valueof(canonicalBuffer),blob.valueof(secret));
        sig = EncodingUtil.base64Encode(mac);
        
        return sig;
        
    }
    
    public static void callAWS(){
        Attachment attach = [select Body,ContentType,Name from Attachment limit 1];
        String attachmentBody = EncodingUtil.base64Encode(attach.Body);
        String formattedDateString = Datetime.now().formatGMT('EEE, dd MMM yyyy HH:mm:ss z');
        String key = 'AKIAI3BQI5JZBVCFXIYA'; //AWS key
        String secret = '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'; //AWS Secret key
        String bucketname = 'candidateresumeszencloud'; //AWS bucket name
        String host = 's3.amazonaws.com';
        String method = 'PUT';
        String filename = attach.Id + '-' + attach.Name;
        HttpRequest req = new HttpRequest();
        req.setMethod(method);
        req.setEndpoint('https://' + bucketname + '.' + host + '/' + filename);
        req.setHeader('Host', bucketname + '.' + host);
        req.setHeader('Content-Length', String.valueOf(attachmentBody.length()));
        req.setHeader('Content-Encoding', 'UTF-8');
        req.setHeader('Content-type', attach.ContentType);
        req.setHeader('Connection', 'keep-alive');
        req.setHeader('Date', formattedDateString);
        req.setHeader('ACL', 'public-read-write');
        req.setBodyAsBlob(attach.Body);
        String stringToSign = 'PUT\n\n' + attach.ContentType + '\n' + formattedDateString + '\n' + '/' + bucketname + '/' + filename;
        String encodedStringToSign = EncodingUtil.urlEncode(stringToSign, 'UTF-8');
        Blob mac = Crypto.generateMac('HMACSHA1', blob.valueof(stringToSign),blob.valueof(secret));
        String signedKey  = EncodingUtil.base64Encode(mac);
        String authHeader = 'AWS' + ' ' + key + ':' + signedKey ;
        req.setHeader('Authorization',authHeader);
        String decoded = EncodingUtil.urlDecode(encodedStringToSign , 'UTF-8');
        Http http = new Http();
        HTTPResponse res = http.send(req);
        system.debug('result..'+res);
    }
}