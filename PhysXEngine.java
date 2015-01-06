public class PhysXEngine{
    private int Xaccel;
    private int Yaccel;
    private int Xdisplace;
    private int Ydisplace;
    private int Xvelocity;
    private int YInitialVelocity;
    private int Yvelocity;
    private int maxHeight;
    private int time;

    public void gravity{
	
    }

    public void horizontalMotion{
	Xdisplace = Xvelocity * time;
    }

    public void verticalMotion{
	Ydisplace = YInitialVelocity * time + (1/2)
    }
}