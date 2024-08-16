import java.util.HashMap;
import java.util.Map;

import syntaxtree.*;
import visitor.*;

public class Main {
   public static void main(String [] args) {
      try {
         Node root = new microIRParser(System.in).Goal();
         GJDepthFirst g0 = new GJDepthFirst<>();
        
         Object var = root.accept(g0,null); // Your assignment part is invoked here.

//          Integer LineCount = var.keySet().iterator().next();
//          HashMap<String, Integer> LevelMap = new HashMap<>();
//          LevelMap.putAll(var.get(LineCount));
//          for (Map.Entry<String, Integer> entry : LevelMap.entrySet()) {
//         System.out.println("Key: " + entry.getKey() + ", Value: " + entry.getValue());
// }
          GJDepthFirst1 g1 = new GJDepthFirst1<>();
         root.accept(g1,var);

         System.out.println("Program parsed by Arun successfully");
      }
      catch (ParseException e) {
         System.out.println(e.toString());
      }
   }
} 



