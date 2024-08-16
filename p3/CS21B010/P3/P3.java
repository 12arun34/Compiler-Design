import syntaxtree.*;
import visitor.*;


public class P3 {
   public static void main(String [] args) {
      try {
      
         
        
         Node root = new MiniJavaParser(System.in).Goal();
         GJDepthFirst g0 = new GJDepthFirst<>();
         root.accept(g0,null); // Your assignment part is invoked here.        // g0 is default gjdepthfirst.java
        // System.out.println("Program type checked successfully");
         
         
         //GJDepthFirst1 g1 = new GJDepthFirst1<>(); 
         //root.accept(g1,null);
         //System.out.println("Correct data structure used for storage");
         
         //GJDepthFirst2 g2 = new GJDepthFirst2<>(); 
         //root.accept(g2,null);
         //System.out.println("Program type checked successfully");
      }
      catch (ParseException e) {
         System.out.println(e.toString());
      }
   }
} 



