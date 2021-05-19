trigger changeowner on Contact_Relationship__c (before update) {
    
    Changeownerrelationship cr = new Changeownerrelationship();
    cr.updateContactRelationshipNameByOwner(trigger.new);
}