int side = 195;
boolean start = true;
boolean gameover = false;
boolean boxRemoved = false;
boolean isEmpty;
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
	if(start)
	{
	  initialDetection();
	}
	else {
		for (Boxes thisBox : box) {
			thisBox.show();
		}
    if(gameover) {
      text("GAME OVER", 400,400);
      noLoop();
    }
	}
	
	
}
// to ensure initial set up is correct
void initialDetection()
{
	for(int i = 0; i< box.size(); i++)
	{
		for(int j = box.size()-1; j > i; j--) //see if box matches other boxes
		{
		  if(box.get(i).equals(box.get(j)))
		  {
		  	box.get(i).setBoxValue(2*box.get(i).getValue());
		  	box.remove(j);
		  }
		  else if(box.get(i).getX() == box.get(j).getX() &&
		  	      box.get(i).getY() == box.get(j).getY())
		  {
		  	box.remove(j);
		  	box.add(new Boxes(10+195*(int)(Math.random()*4),10+195*(int)(Math.random()*4),2));
		  }	
		}
		
		box.get(i).show();
	}
	System.out.println(box.size());
	start = false;
}

void detection(String direction)
{

  if(direction.equals("up"))
  {
   for(int i = box.size()-1; i >= 0; i--) {
     boolean stop = false;
     while(box.get(i).getY() > 10 && !stop) {
     	box.get(i).upY();
     	
     	for(int j = 0; j < box.size(); j++) {
     		if(j != i) {
     		if(box.get(i).equals(box.get(j))) {
     			
     			box.get(j).setBoxValue(2*(box.get(j).getValue()));
     			box.remove(i);
     			i = box.size()-1;

     		}
     		else if(box.get(i).getX() == box.get(j).getX() &&
     			    box.get(i).getY() == box.get(j).getY() &&
     			    box.get(i).getValue() != box.get(j).getValue()) {
     			
     			box.get(i).downY();
     		    stop = true;
     		}
     	    }
     	}
     }
   }
  }
  if(direction.equals("down"))
  {
   for(int i = box.size()-1; i >= 0; i--) {
     boolean stop = false;
     while(box.get(i).getY() < 595 && !stop) {
     	box.get(i).downY();
     	for(int j = 0; j < box.size(); j++) {
     		if(j != i) {
     		if(box.get(i).equals(box.get(j))) {
     			box.get(j).setBoxValue(2*(box.get(j).getValue()));
     			box.remove(i);
     			i = box.size()-1;
     		}
     		else if(box.get(i).getX() == box.get(j).getX() &&
     			    box.get(i).getY() == box.get(j).getY() &&
     			    box.get(i).getValue() != box.get(j).getValue()) {
     			box.get(i).upY();
     		    stop = true;
     		}
     	    }
     	}
     }
   }
  }
  if(direction.equals("right"))
  {
   for(int i = box.size()-1; i >= 0; i--) {
     boolean stop = false;
     while(box.get(i).getX() < 595 && !stop) {
     	box.get(i).rightX();
     	for(int j = 0; j < box.size(); j++) {
     		if(j != i) {
     		if(box.get(i).equals(box.get(j))) {
     			box.get(j).setBoxValue(2*(box.get(j).getValue()));
     			box.remove(i);
                i = box.size()-1;
     		}
     		else if(box.get(i).getX() == box.get(j).getX() &&
     			    box.get(i).getY() == box.get(j).getY() &&
     			    box.get(i).getValue() != box.get(j).getValue()) {
     			box.get(i).leftX();
     		    stop = true;
     		}
     	    }
     	}
     }
   }
  }
  if(direction.equals("left"))
  {
   for(int i = box.size()-1; i >= 0; i--) {
     boolean stop = false;
     while(box.get(i).getX() > 10 && !stop) {
     	box.get(i).leftX();
     	for(int j = 0; j < box.size(); j++) {  // removing a box resets i
     		if(j != i) {
     		if(box.get(i).equals(box.get(j))) {
     			
     			box.get(j).setBoxValue(2*(box.get(j).getValue()));
     			box.remove(i);
     			i = box.size()-1;
     		}
     		else if(box.get(i).getX() == box.get(j).getX() &&
     			    box.get(i).getY() == box.get(j).getY() &&
     			    box.get(i).getValue() != box.get(j).getValue()) {
     			box.get(i).rightX();
     		    stop = true;
     		}
     	    }
     	}
     }
   }
  }			  	
}
void keyPressed()
 {
    if(key == CODED)
	{
	   if(keyCode == UP)
	   {
        detection("up");	
	      insertNewTile();
	   }
	   else if(keyCode == DOWN)
	   {
		    detection("down");	
	      insertNewTile();
	   }
	   else if(keyCode == LEFT)
	   {
        detection("left");
	      insertNewTile();
	   }
	   else if(keyCode == RIGHT)
	   {
	   	detection("right");	
	   	insertNewTile();
	   }
	}
 }	
 void insertNewTile()
 {
  isEmpty = true;
 	if(box.size() < 16)
    {
      int boxRandX = 10 + 195*(int)(Math.random()*4);
      int boxRandY = 10 + 195*(int)(Math.random()*4);
      for(Boxes thisBox : box) {
        if(thisBox.getX() == boxRandX && thisBox.getY() == boxRandY) {
          isEmpty = false;
        }
      }
      if(isEmpty) {
        box.add(new Boxes(boxRandX,boxRandY,2*((int)(Math.random()*2)+1)));
        System.out.println(box.size());
      }
      else {
        insertNewTile();
      }
    }
    else {
      gameover = true;
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
	public boolean equals(Boxes nextBox) {
       if(this.getX() == nextBox.getX() && this.getY() == nextBox.getY()
       	  && this.getValue() == nextBox.getValue()) {
       	return true;
       }
       else {
       	return false;
       }

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
 