public class BtnDisableEnable {
    
    public boolean btn1 {get;set;}
    public boolean btn2 {get;set;}
    public boolean pb1{get;set;}
    public boolean pb2{get;set;}
    
    public BtnDisableenable()
    {
        btn1 = false;
        btn2 = false;
        PB1 = true;
        PB2 = true;
    }
    
    public void ClickBtn1()
    {
        btn1 = true;
        pb2 = false;
        
        btn2 = false;
        pb1  = true;
    }

    public void clickBtn2()
    {
        btn2 = true;
        pb1 =  false;
        
        btn1 = false;
        pb2  = true;
    }
}