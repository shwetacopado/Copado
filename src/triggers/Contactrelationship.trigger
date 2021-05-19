trigger Contactrelationship on Contact (after insert) {
    
  if(trigger.isAfter)
 {
 if(trigger.isInsert)
 {
   ContactRelationship conrel = new ContactRelationship();
     conrel.createContactRelationshipByContact(trigger.new);
 }}}