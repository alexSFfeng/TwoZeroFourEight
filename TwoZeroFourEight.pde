int side = 195;
boolean start = true;
boolean gameover = false;
boolean notHit = true;
boolean boxRemoved = false;
boolean isEmpty;
int globalNum;
ArrayList <Boxes> box;
void setup()
{
	size(800,800);
	background(0);
	fill(255);
	rect(10,10,780,780);
	box = new ArrayList <Boxes> ();
	for(int i = 4; i>0; i--)
	{

		box.add(new Boxes(10+195*(int)(Math.random()*4),10+195*(int)(Math.random()*4),2));
	}
}
void draw()
{		
	fill(255);
	rect(10,10,780,780);
	if(start = true)
	{
	  initialDetection();
	}
	else if(gameover = false)
	{

	   for(int i =0; i<box.size();i++)
	   {
	   	box.get(i).show();
	   }
	}
	
	
}
void initialDetection()
{
	for(int i = 0; i< box.size(); i++)
	{
		for(int j = box.size()-1; j > i; j--) //see if box matches other boxes
		{
		  if(box.get(i).getX() == box.get(j).getX() && box.get(i).getY() == box.get(j).getY())
		  {
			if(box.get(i).getValue() == box.get(j).getValue()) //compare the two values
		  	{
		  		box.get(i).setBoxValue(2*box.get(i).getValue());
		  		box.remove(j);
		  		j--;
		  	}
		  	else
		  	{
		  		box.remove(j);
		  		box.add(new Boxes(10+195*(int)(Math.random()*4),10+195*(int)(Math.random()*4),2));
		  	}
		  }	
		}
		
		box.get(i).show();
	}
	start = false;
}
void detection(String direction)
{
	for(int i = globalNum; i< box.size(); i++)
	{
		for(int j = box.size()-1; j > i; j--) //see if box matches other boxes
		{
		  if(box.get(i).getX() == box.get(j).getX() && box.get(i).getY() == box.get(j).getY())
		  {
		  	if(box.get(i).getValue() == box.get(j).getValue()) //compare the two values
		  	{
		  		box.get(i).setBoxValue(2*box.get(i).getValue()); //create new box and get rid of one of the box
		  		box.remove(j);
		  		j--;
		  		notHit = false;
		  		boxRemoved = true;
		  	}
		  	else 
		  	{
		  	if(direction.equals("up"))
		  	{
		  		box.get(i).downY();
		  		notHit = false;

		  	}
		  	else if(direction.equals("down"))
		  	{
		  		box.get(i).upY();
		  		notHit = false;

		  	}
		  	else if(direction.equals("left"))
		  	{
		  		box.get(i).rightX();
		  		notHit = false;
		  	}
		  	else
		  	{
		  		box.get(i).leftX();
		  		notHit = false;
		  	}	
		  	}
		  }
		}
	}
}
class Boxes
{
	private int r,g,b, x, y;
	private int boxValue;
	Boxes(int entryX, int entryY, int entryV)
	{
		x = entryX;
		y = entryY;
		boxValue = entryV;
		r = 148;
		g = 137;
		b = 137;
	}
	public void show()
	{
		strokeWeight(3);
 		fill(r,g,b,110);
		rect(x,y,side,side);
		fill(0);
		textSize(90);
		textAlign(CENTER);
		text(boxValue,x+(side/2),y+120);
	}
	public int getX()  {return x;} //return x position
	public int getY()  {return y;} //return y position
	public int getValue() {return boxValue;} //return boxValue
	public void setBoxValue(int a){boxValue = a;} // set box value
	public void upY() {y = y -195;}
	public void downY() {y = y + 195;}
	public void leftX() {x = x - 195;}
	public void rightX() {x = x + 195;}
 }
 void keyPressed()
 {
    if(key == CODED)
	{
	   if(keyCode == UP)
	   {
	     for(int i = 0; i < box.size(); i++)
	     {
	     	boxRemoved = false;
	     	notHit = true;
	     	while(box.get(i).getY()-195 >= 10 && notHit)
	     	{

	     	     box.get(i).upY();
	     	     globalNum = i;
                 detection("up");	


	     	}
	     }
	     addBox();
	   }
	   else if(keyCode == DOWN)
	   {
		
	   	for(int i = 0; i < box.size(); i++)
	     {
	     	boxRemoved = false;
	     	notHit = true;
	     	while(box.get(i).getY()+195 <= 595 && notHit)
	     	{
 
	     		 box.get(i).downY();
	     		 globalNum =i;
                 detection("down");	


	     	}
	     }
	     addBox();
	   }
	   else if(keyCode == LEFT)
	   {
		
		
	   	for(int i = 0; i < box.size(); i++)
	     {
			boxRemoved = false;
	     	notHit = true;
	     	while(box.get(i).getX() -195 >= 10 && notHit)
	     	{

	     		  box.get(i).leftX();
	     		  globalNum = i;
                  detection("left");

	     	}
	     }
	     addBox();
	   }
	   else if(keyCode == RIGHT)
	   {
		
		
	   	for(int i =0; i< box.size(); i++)
	   	{
	   		boxRemoved = false;
	   		notHit = true;
	   		while(box.get(i).getX()+195 <=595 && notHit)
	   		{

	   		    box.get(i).rightX();
	   		    globalNum = i;
	   			detection("right");	
	   			

	   		}
	   	}
	   	addBox();
	   }

	}
 }	
 void addBox()
 {
 	if(box.size() < 16)
    {
 	for(int i = 2; i>0; i--)
	{
		box.add(new Boxes(10+195*(int)(Math.random()*4),10+195*(int)(Math.random()*4),2));
	}
	initialDetection();
    }
 }