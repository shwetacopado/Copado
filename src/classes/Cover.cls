public class Cover{
    private static List<codecov> coverlist = new List<codecov>();
    private static List<Jsondat> jd = new List<Jsondat>(); 
     
          

    public class Jsondat
    {   
      
        public String ApexClassOrTriggerId; 
        public ApexClassOrTrigger  ApexClassOrTrigger;
        //public String Coverage;
        public Integer NumLinesCovered; 
        public Integer NumLinesUncovered;
        public Integer percent;
        public Integer TotalLines;
       
    }
    public class codecov
    {
        
        public String ApexClassName; 
        public ApexClassOrTrigger ApexClassorTrigger;
       // public String Coverage;
        public Integer NumLinesCovered; 
        public Integer NumLinesUncovered;
        public  Integer percent;
        public Integer TotalLines;
       
    }
    
    
    public class CoverageWrapper
    {
    list<Jsondat> records;
    }
    
    public class ApexClassOrTrigger
    
    {
      string Name;
      
         
    }
    
       
    public void basicAuthCallout()
    {
        HttpRequest req = new HttpRequest();
        req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionID());
        req.setHeader('Content-Type', 'application/json');
        //req.setEndpoint(System.URL.getSalesforceBaseURL().toExternalForm()+'/services/data/v37.0/tooling/query/?q=SELECT+ApexClassOrTriggerId,ApexClassorTrigger.Name,+NumLinesCovered,+NumLinesUncovered+FROM+ApexCodeCoverageAggregate++WHERE+NumLinesCovered+=+0+AND+NumLinesUncovered+!=+NULL+ORDER+BY+ApexClassOrTrigger.Name');
req.setEndpoint(System.URL.getSalesforceBaseURL().toExternalForm()+'/services/data/v37.0/tooling/query/?q=SELECT+ApexClassOrTriggerId,+ApexClassOrTrigger.Name,+NumLinesCovered,+NumLinesUncovered+FROM+ApexCodeCoverageAggregate+WHERE+ApexClassOrTriggerId+!=+NULL+AND+ApexClassOrTrigger.Name+!=+NULL+AND+(NumLinesCovered+>+0+OR+NumLinesUncovered+>+0)+AND+NumLinesCovered+!=+NULL+AND+NumLinesUncovered+!=+NULL+ORDER+BY+ApexClassOrTrigger.Name');
        req.setMethod('GET');
        Http h = new Http();
        HttpResponse res = h.send(req);  
         
        CoverageWrapper acca = (CoverageWrapper)System.JSON.deserialize(res.getBody(),CoverageWrapper.class); 
     // system.debug('******'+acca);
     
         
        for(Jsondat covList : acca.records)
        {
            codecov coList = new codecov();
            coList.ApexClassName=CovList.ApexClassorTriggerId;
            colist.ApexClassOrTrigger=CovList.ApexClassorTrigger;
            coList.NumLinesCovered=CovList.NumLinesCovered;
            coList.NumLinesUncovered=CovList.NumLinesUncovered;
            colist.TotalLines = CovList.NumLinesCovered + CovList.NumLinesUncovered;
            colist.percent=CovList.NumLinesCovered*100/colist.TotalLines;
             coverlist.add(coList);
             
         }
        
     
       //CodeCoverage__c cc = [select Name,TestClassName__c,NumLinesCovered__c,Percent__c,Total__c from CodeCoverage__c limit 1];
        
         
      
         for(codecov result : coverlist)
         
           //  for (CodeCoverage__c cc : ccov)
        // {
          // if (cc.name == NULL)
          // {
        
         {
         CodeCoverage__c cc      = new CodeCoverage__c();
          string ClassName = String.valueOf(result.ApexClassorTrigger);
          String ClassOrTriggerName = ClassName.substring(25, className.length()-1); 
        // string ClassName = String.valueOf(result.ApexClassorTrigger);
       // string  ClassOrTriggerName = ClassName.substring(25,ClassName.length()-1);  
         cc.TestClassName__c     = ClassOrTriggerName;
         cc.NumLinesCovered__c   = result.NumLinesCovered;
         cc.NumLinesUncovered__c = result.NumLinesUncovered;
         cc.Percent__c           = result.percent;
         cc.Total__c             = result.TotalLines;
         system.debug(result.TotalLines+'test');
         insert cc;
         }
          
        
         
  /* sendEmail(createMailBody(coverlist));
    }
        public static void sendEmail(String body){
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

        mail.setSenderDisplayName('Salesforce App Enginner');
        mail.setSubject('Coverage Status');
        String mailBody = body; 
        mail.setHtmlBody(mailBody);
        List<String> sendTo = new List<String>();  
        sendTo.add('schadha@informatica.com');
        mail.setToAddresses(sendTo);            
        mails.add(mail);
        Messaging.sendEmail(mails);
    }   
    public static String createMailBody(List<codecov> results){
    
          
        String mailBody = '<html><body>';
        mailBody = mailBody + '<b>Code Coverage Status as of ' + System.now() + '</b><br/><br/>';
        mailBody = mailBody + '<table style="width:100%" border="1">';
        mailBody = mailBody + '<tr>'+
            '<td bgcolor="Blue"><b><font color="white">ApexClass/TriggerID</font></b></td>'+
             '<td bgcolor="Blue"><b><font color="white">ApexClass/TriggerName</font></b></td>'+
            '<td bgcolor="Blue"><b><font color="white">NumLinesCovered</font></b></td>'+
            '<td bgcolor="Blue"><b><font color="white">NumLinesUncovered</font></b></td>'+
            '<td bgcolor="Blue"><b><font color="white">TotalLines</font></b></td>'+
            '<td bgcolor="Blue"><b><font color="white">percent</font></b></td>'+
            
            '</tr>';
          for(codecov result : results){
          string ClassName = String.valueOf(result.ApexClassorTrigger);
          String ClassOrTriggerName = ClassName.substring(25, className.length()-1);  
            //string str = 'result.ApexClassorTrigger';
            mailBody = mailBody + '<tr>';
            mailBody = mailBody + '<td>' + result.ApexClassName+ '</td>';
            mailBody = mailBody + '<td>' + ClassOrTriggerName+ '</td>';
            system.debug(Classname);
            mailBody = mailBody + '<td>' + result.NumLinesCovered + '</td>';
            mailBody = mailBody + '<td>' + result.NumLinesUncovered+ '</td>';
            mailBody = mailbody + '<td>' + result.TotalLines+ '</td>';
            mailBody = mailbody + '<td>' + result.percent+ '</td>';
            mailBody = mailBody + '</tr>';
        }
        mailBody = mailBody + '</table>';
        mailBody = mailBody + '</body></html>';
        return mailBody; */
    }
    
    }