@isTest
private class HelloWorldTest {

  @isTest static void UpdateLead() {

  	Lead myLead = new Lead();
  	myLead.FirstName = 'Shweta';
  	myLead.Lastname  = 'Chadha';
  	myLead.Company   = 'Informatica';
  	Insert myLead; 
  	myLead.Company   =  'sfdc99';
  	update myLead;
    
  }
}