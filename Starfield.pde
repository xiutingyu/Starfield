//your code here
Particle [] bob;
void setup()
{
	size(800,800);
	background(255,255,255);
	bob=new Particle[100];
	for (int i=0; i<bob.length; i++)
	{
		bob[i] = new NormalParticle();
	}
	bob[0]=new OddballParticle();
	bob[1]=new JumboParticle();
}
void draw()
{
	fill(0,10,100,100);
	ellipse(400,400,20,20);
	for (int i=0; i<bob.length;i++){
	bob[i].move();
	bob[i].show();
	}//your code here
}

class NormalParticle implements Particle
{
	double x,y, speed,angle;
	int myColor;
	NormalParticle()
	{
		x=400;
		y=400;
		speed=5;
		angle=Math.random()*(2*PI);
		myColor=color(0,0,0);
	}
	public void move()
	{
		x+=Math.cos(angle)*speed;
		y+=Math.sin(angle)*speed;
		angle+=.01;
	}
	public void show()
	{
		ellipse ((float)x,(float)y,10,10);
	}//your code here
}

interface Particle
{
	public void show();
	public void move();//your code here
}

class OddballParticle implements Particle//uses an interface
{
	double myX,myY, speed,angle;
	int myColor;

	OddballParticle(){

		myX=400;
		myY=400;
		myColor=color(((int)(Math.random()*255)), ((int)(Math.random()*255)), ((int)(Math.random()*255)));
		speed=(int)(Math.random()*20);
		angle++;
	}
	public void move ()
	{
		myX=myX + (int)(Math.random()*10)-5;
	 	myY=myY + (int)(Math.random()*10)-5;
	 	if (myX< mouseX)
	 		myX+=(int)(Math.random()*5)-1;
	 	else
	 	    myX+=(int)(Math.random()*5)-3;
	 	if (myY< mouseY)
	 		myY+=(int)(Math.random()*5)-1;
	 	else
	 	    myY+=(int)(Math.random()*5)-3;
	}
	public void show ()
	{
		ellipse ((float)myX, (float)myY, 20,20);
	}
}
	//your code here

class JumboParticle extends NormalParticle//uses inheritance
{
	
	public void show ()
	{
		ellipse(0,0,20,20);
	}
}

