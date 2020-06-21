class FunctionGenerate{
	private static String funcSeq;
	
 public FunctionGenerate(){funcSeq=new String();} 
 public String generateFunc()
	{String func=new String(""+ ((int)(Math.random()*10000)) );
	 funcSeq=func;
	 return func;}
 public int interpretFunc(String func,int num,int ... op){
	int res=num;
	int i=0;
	if(func == null)
		func=funcSeq;
	for(char c : func.toCharArray())
		{if(i<op.length)
		   switch(c)
			{case '0': res=unaryneg(res);break;
			 case '1': res=add(res,op[i++]);break;
			 case '2': res=sub(res,op[i++]);break;
			 case '3': res=mul(res,op[i++]);break;
			 case '4': res=div(res,op[i++]);break;
			 case '5': res=mod(res,op[i++]);break;
			 case '6': res=and(res,op[i++]);break;
			 case '7': res=or(res,op[i++]);break;
			 case '8': res=not(res);break;
			 case '9': res=(int)Math.pow(res,op[i++]);break;
			 default : break;
			}
		 else break;
		 System.out.println(res);
		}
	return Math.abs(res);
	}
 public int unaryneg(int num){return (-num);}
 public int add(int a,int b){return a+b;}
 public int sub(int a,int b){return a-b;}
 public int mul(int a,int b){return a*b;}
 public int div(int a,int b){if(b != 0) return ((int)a/b);
 			     else       return a;}
 public int mod(int a,int b){if(b != 0) return ((int)a/b);
			     else       return a;}
 public int and(int a,int b){return a&b;}
 public int  or(int a,int b){return a|b;}
 public int not(int a)	    {return ~a;}
}