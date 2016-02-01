package web.tool;

import java.io.File;

public class ToolTest {
  public static void main(String[] args) {
//    File src = new File("F:/hybrid2/Gallery/imgResize/festval02.jpg");
//    File dest = new File("F:/hybrid2/Gallery/imgResize/festval02_mini.jpg");
//    
//    Tool.imgResize(src, dest, 120, 80);
    
    String upDir = "F:/hybrid2/Gallery/imgResize";
    String src = "festval06.jpg";
    Tool.preview(upDir, src, 120, 80);
    
  }

}
