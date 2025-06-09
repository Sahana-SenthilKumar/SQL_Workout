//Queue Implementation

import java.util.*;

class StudentHelpDeskQueue{

    public static void main(String args[]){

        Queue<String> studentEntry = new LinkedList<>();

        //Adding students to the queue
        studentEntry.offer("Student1");
        studentEntry.offer("Student2");
        studentEntry.offer("Student3");
        studentEntry.offer("Student4");
        studentEntry.offer("Student5");

        //Displaying the full queue before processing
        System.out.println("Student Request Queue : " + studentEntry +"\n");

        //Processing each student in the queue one by one (FIFO)
        while(!studentEntry.isEmpty()){
            String student = studentEntry.poll();   //Fetch and remove the first student from the queue
            System.out.println("Processing request of : " + student);    //Display the student being processed
            //studentEntry.remove(student);
            System.out.println(student + " request is processed and removed from the queue\n");     //Confirm that the request has been handled
        }

    }

}
