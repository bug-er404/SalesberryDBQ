/*******************************************************
 Class that overrides Printstream class to redirect
 standard output stream to a JTextArea (GUI).
 @author Salil Maharjan
 @since 11/26/2019
  ******************************************************** */
package salesberryapp;

import java.io.IOException;
import java.io.OutputStream;

import javax.swing.*;
//The java.io.PrintStream class is way too slow. A glance at the source code reveals the problem - the methods "public void print( String s )" and "public void print( char[] c )" are implemented by looping over all the characters in the string or array and calling write() once for each character.

public class textOutputStream extends OutputStream {
    // *********************************************************
    // ******************** Member Variable ********************
    // *********************************************************
    private JTextArea textArea;

    // *********************************************************
    // ******************** Class Constructor ******************
    // *********************************************************
    public textOutputStream(JTextArea textArea) {
        if(textArea==null)
            throw new IllegalArgumentException("Textarea is not valid!");
        this.textArea = textArea;
    }

    // *********************************************************
    // **************** Write Function Override  ***************
    // *********************************************************
    @Override
    public void write(int b) throws IOException {
        // redirects data to the text area
        textArea.append(String.valueOf((char) b));
        // scrolls the text area to the end of data
        textArea.setCaretPosition(textArea.getDocument().getLength());
        // keeps the textArea up to date
        textArea.update(textArea.getGraphics());
    }

}
