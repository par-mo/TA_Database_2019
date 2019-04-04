SET SERVEROUTPUT ON

*The idea is to print an argument on the console, which is passed inside dbms_output.put_line.


Moreover, the main reason behind is that whatever we pass inside dbms_output.put_line, it will be internally stored inside a buffer in SGA (Shared Global Area) memory area up to 2000 bytes. This buffer is only created when we use  dbms_output package. Furthermore, we need to set the environment variable only once for a session. Also, in order to fetch it from that buffer, we need to set the environment variable for the session. 



