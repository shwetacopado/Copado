Global class scheduledBatchable implements Schedulable {
    
    global void execute(SchedulableContext SC)
    {
        Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage>();
            list<opportunity> opp = [Select id,name from opportunity where createddate = Today];
            if(opp.size() ==0)
            {
                Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
                //Set recipients
                message.toaddresses = new String[] {'shwetachadha27@gmail.com'};
                message.optoutpolicy = 'Filter';
                message.subject = 'Opportunity not created';
                message.plaintextbody = 'please create the opportunity';
                messages.add(message);
                Messaging.SendEmailResult[] results = Messaging.SendEmail(messages);
                
                if (results[0].success)
                {
                    System.debug('The email was sent successfully');
                }
                
                else {
                      System.debug('The email failed to send: ' + results[0].errors[0].message);
                    
                }
            }
    }

}