import java.lang.*;

public class PhysXEngine{
    //Angle of launch
    private int angle;
    //Current horizontal acceleration
    private int Xaccel;
    //Current vertical acceleration
    private int Yaccel;
    //The current horizontal displacement
    private int Xdisplace;
    //The current vertical displacement
    private int Ydisplace;
    //Current velocity
    private int velocity;
    //Current horizontal velocity
    private int Xvelocity;
    //The initial vertical velocity
    private int YInitialVelocity;
    //The current vertical velocity
    private int Yvelocity;
    //The maximum height of the parabolic arc
    private int maxHeight;
    //The amount of time that the projectile has been airborne
    private int timeRunning;
    //The projectile's total airborne time
    private int timeTotal;
    //The total displacement that occurs during the parabolic arc
    private int range;

    //Sets velocity
    public void setVelocity(int v){
	velocity = v;
    }
    //Set angle
    public void setAngle(int a){
	angle = a;
    }
    //Sets vertical and horizontal velocity
    public void setXYVelocity(){
	Xvelocity = velocity * cos(angle);
	Yvelocity = velocity * sin(angle);
    }
    //Sets the current horizontal displacement
    public void setXDisplace(){
	Xdisplace = Xvelocity * timeRunning;
    }
    //Sets the current vertical displacement of the object.
    public void setYDisplace(){
	Ydisplace = YInitialVelocity * timeRunning + (1/2) * Yaccel * Math.pow(timeRunning, 2);
    }
    // Sets the final flight time of the object.
    public void setFlightTime(){
	timeTotal = (2*Yvelocity)/ Yaccel;
    }
    //Sets the range of the object
    public void setRange(){
	range = (Math.pow(velocity,2) * sin(2 * angle))/ 10;
    }
    //Sets the max height
    public void setMaxHeight(){
	maxHeight = Math.pow(velocity,2) * Math.pow(sin(angle),2) / 20;
    }
    //Generates the parabolic trajectory for the object.
    public Array generateParabolicPath(int angle, int velocity){
	int[]output = new int[6];
	setAngle(angle);
	setVelocity(v);
	setXYvelocity();
	output[0] = angle;
	output[1] = maxHeight;
	output[2] = range;
	output[3] = Xvelocity;
	output[4] = Yvelocity;
	output[5] = timeTotal;
    }

}
