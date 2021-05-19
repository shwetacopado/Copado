({
    doSave: function(component, event, helper) {
        var files=component.find("fileId").get("v.files");
       // alert(files);
        if (files != null && files.length > 0) {
            helper.uploadHelper(component, event);
        } else {
            //alert('Please Select a Valid File');
             var sMsg = '\n';
                    sMsg += 'Please Select a Valid File';
                    
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        mode: 'pester',
                        message: sMsg,
                        type : 'error'
                    });
                    toastEvent.fire();
            
        }
    },
    
    handleFilesChange: function(component, event, helper) {
        var fileName = 'No File Selected..';
        if (event.getSource().get("v.files").length > 0) {
            fileName = event.getSource().get("v.files")[0]['name'];
        }
        component.set("v.fileName", fileName);
    },
    
     viewAWSFile: function(component, event, helper) {
         //alert('in');
         helper.viewAWSFileHelper(component, event);
     },
    
    closeModel: function(component, event, helper) {
        // for Close Model, set the "hasModalOpen" attribute to "FALSE"  
       // component.set("v.hasModalOpen", false);
        component.set("v.docId" , null); 
    },
})