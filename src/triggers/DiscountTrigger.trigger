trigger DiscountTrigger on Book__c (before insert,before update) {
    List<Book__c> books = Trigger.new;
    for (Book__c b : books) 
    {
        b.Price__c *=0.9;
    }
}