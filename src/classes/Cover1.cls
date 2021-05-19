public class Cover1{
    private static List<codecov> coverlist = new List<codecov>();
    private static List<Jsondat> jd = new List<Jsondat>(); 
    public class Jsondat
    {
        public String ApexClassOrTriggerId; 
        public Integer NumLinesCovered; 
        public Integer NumLinesUncovered;
      
        public Integer percent;
       
    }
    public class codecov
    {
        public String ApexClassName; 
        public Integer NumLinesCovered; 
        public Integer NumLinesUncovered;
        public  Integer percent;
     
    }
    public class CoverageWrapper
    {
    list<Jsondat> records;
    }
    public void basicAuthCallout()
    {
        HttpRequest req = new HttpRequest();
        req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionID());
        req.setHeader('Content-Type', 'application/json');
        req.setEndpoint(URL.getSalesforceBaseURL().toExternalForm()+'/services/data/v37.0/tooling/query/?q=Select+ApexClassorTriggerId,NumLinesCovered,NumLinesUncovered,Coverage+from+ApexCodeCoverageAggregate');
        req.setMethod('GET');
        Http h = new Http();
        HttpResponse res = h.send(req);      
        CoverageWrapper acca = (CoverageWrapper)System.JSON.deserialize(res.getBody(),CoverageWrapper.class); 

        for(Jsondat covList : acca.records)
        {
            codecov coList = new codecov();
            coList.ApexClassName=CovList.ApexClassorTriggerId;
            coList.NumLinesCovered=CovList.NumLinesCovered;
            coList.NumLinesUncovered=CovList.NumLinesUncovered;
           // colist.Coverage= CovList.Coverage;
            //colist.TotalLines = CovList.NumLinesCovered + CovList.NumLinesUncovered;
            if ((CovList.NumLinesCovered + CovList.NumLinesUncovered) !=0)
            {
            colist.percent=((CovList.NumLinesCovered) / (CovList.NumLinesCovered + CovList.NumLinesUncovered))*100;
            
            }
           if ((CovList.NumLinesCovered + CovList.NumLinesUncovered)==0)
            {        
            colist.percent = 0;
           }
            coverlist.add(coList);
        }
        
         
        sendEmail(createMailBody(coverlist));
    }
        public static void sendEmail(String body){
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

        mail.setSenderDisplayName('Salesforce Admin');
        mail.setSubject('Coverage Status');
        String mailBody = body; 
        mail.setHtmlBody(mailBody);
        List<String> sendTo = new List<String>();  
        sendTo.add('shwetachadha27@gmail.com');
        mail.setToAddresses(sendTo);            
        mails.add(mail);
        Messaging.sendEmail(mails);
    }   
    public static String createMailBody(List<codecov> results){
        String mailBody = '<html><body>';
        mailBody = mailBody + '<b>Code Coverage Status as of '+ System.now() + '</b><br/><br/>';
        mailBody = mailBody + '<table style="width:100%" border="1">';
        mailBody = mailBody + '<tr>'+
            '<td bgcolor="Blue"><b><font color="white">Class Name ID</font></b></td>'+
            // '<td bgcolor="Blue"><b><font color="white">Class Name</font></b></td>'+
            '<td bgcolor="Blue"><b><font color="white">NumLinesCovered</font></b></td>'+
            '<td bgcolor="Blue"><b><font color="white">NumLinesUncovered</font></b></td>'+
           // '<td bgcolor="Blue"><b><font color="white">Coverage</font></b></td>'+
            '<td bgcolor="Blue"><b><font color="white">percent</font></b></td>'+
            '</tr>';
        for(codecov result : results){
          // id idval= result.ApexClassName;
          //  string Classname= [select id, name from apexclass where id=: idval limit 1].name;   
            
            mailBody = mailBody + '<tr>';
            mailBody = mailBody + '<td>' + result.ApexClassName+ '</td>';
            //mailBody = mailBody + '<td>' + [select id, name from apexclass where id=: result.ApexClassName limit 1].name + '</td>';
            mailBody = mailBody + '<td>' + result.NumLinesCovered + '</td>';
            mailBody = mailBody + '<td>' + result.NumLinesUncovered+ '</td>';
           // mailBody = mailbody + '<td>' + result.Coverage+ '</td>';
            mailBody = mailbody + '<td>' + result.percent+ '</td>';
            mailBody = mailBody + '</tr>';
        }
        mailBody = mailBody + '</table>';
        mailBody = mailBody + '</body></html>';
        return mailBody;
        
    }}