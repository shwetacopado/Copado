({
    packItem : function(component, event, helper) {
        event.getSource().set("v.disabled",true); // set the button to disabled
        component.set("v.item.Packed__c", true); // set the item's packed field to true
    }
})