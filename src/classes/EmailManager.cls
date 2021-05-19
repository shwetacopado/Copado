public with sharing class EmailManager 
{
 //public method
 public static void sendemail(String address,String subject,String body)
 {
   //Create an email message object
   Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
   String[] toAddresses = new String[] {address};
   mail.setToAddresses(toAddresses);
   mail.setsubject(subject);
   mail.setplainTextBody(body);

 }

}