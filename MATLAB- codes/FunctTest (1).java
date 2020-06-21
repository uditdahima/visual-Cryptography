class FunctTest{
 public static void main(String ... args)
	{FunctionGenerate g=new FunctionGenerate();
	 String func=g.generateFunc();
	 int a=10;
	 System.out.println("Random Function : "+func);
	 System.out.println("Value Before Random Function Generator Application: "+a);
 	 System.out.println("Value After  Random Function Generator Application: "+g.interpretFunc(func,a,5,5,5,10,1)); a+=1;
	 System.out.println("Random Function : "+func);
	 System.out.println("Value Before Random Function Generator Application: "+a);
	 System.out.println("Value After  Random Function Generator Application: "+g.interpretFunc(func,a,5,5,5,10,1)); a+=1;
	 System.out.println("Random Function : "+func);
	 System.out.println("Value Before Random Function Generator Application: "+a);
	 System.out.println("Value After  Random Function Generator Application: "+g.interpretFunc(func,a,5,5,5,10,1));
	}
}