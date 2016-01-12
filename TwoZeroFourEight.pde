int side = 195;
ArrayList <Boxes> box;
void setup()
{
	size(800,800);
	background(0);
	fill(255);
	rect(10,10,780,780);
	box = new ArrayList <Boxes> ();
	for(int i = 5; i>0; i--)
	{

		box.add(new Boxes(10+195*(int)(Math.random()*i),10+195*(int)(Math.random()*i),2));
	}
}
void draw()
{
	for(int i = 0; i< box.size(); i++)
	{
		for(int j = box.size()-1; j > i; j--)
		{
		  if(box.get(i).getX() == box.get(j).getX() && box.get(i).getY() == box.get(j).getY())
		  {
		  	if(box.get(i).getValue() == box.get(j).getValue())
		  	{
		  		box.get(i).setBoxValue(2*box.get(i).getValue());
		  		box.remove(j);
		  		j--;
		  	}
		  	else
		  	{
		  		box.remove(j);
		  		box.add(new Boxes(10+195*(int)(Math.random()*i),10+195*(int)(Math.random()*i),2));
		  		j ++;
		  	}
		  }	
		}
		
		box.get(i).show();
		//box.get(i).move();
	}
}
interface generalBox
{
	void move();
	void show();
}

class Boxes
{
	int r,g,b, x, y;
	int boxValue;
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
		strokeWeight(5);
 		fill(r,g,b,110);
		rect(x,y,side,side);
		fill(0);
		textSize(104);
		textAlign(CENTER);
		text(boxValue,x+(side/2),y+120);
	}
	public int getX()  {return x;} //return x position
	public int getY()  {return y;} //return y position
	public int getValue() {return boxValue;} //return boxValue
	public void setBoxValue(int a){boxValue = a;} // set box value
	public void move()
	{
		if(key == CODED)
		{
		
		}
	}	
}