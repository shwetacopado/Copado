public with sharing class ProfileController {

    public ProfileController(){
        String[] Environment = new String[] {'production','Sandbox'};
            this.chooseEnvironment = new SelectOption[]{};
                for (String c : Environment)
            {
                this.chooseEnvironment.add(new SelectOption(c,c));
            }
            }

public SelectOption[] chooseEnvironment {
    public get;
    private set;
}
    
}