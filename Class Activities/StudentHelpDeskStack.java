//Stack Implementation

import java.util.*;

class StudentHelpDeskStack{

    static Stack<String> stack = new Stack<>();
    
    //Method to process and remove student request at index 0 (bottom of the stack)
    public static void undo(){
        //if(!stack.isEmpty()) 
        System.out.println(stack.remove(0) +" request is processed and removed from stack \n");
    }

    public static void main(String args[]){

        
        //Adding student requests to the stack
        stack.push("Student1");
        stack.push("Student2");
        stack.push("Student3");
        stack.push("Student4");
        stack.push("Student5");

        //Displaying the current stack (top is the last added) before processing
        System.out.println("Student Request Stack : " + stack +"\n");

        //Loop to process each student request starting from the bottom (index 0), to get FIFO effect
        while(!stack.isEmpty()){
            String student = stack.get(0);  //This will fetch the element at index 0
            System.out.println("Processing request of : " + student);
            undo();     // Remove the student from the stack after processing

            //System.out.println("Student Request Stack : " + stack +"\n");
        }

    }

}
