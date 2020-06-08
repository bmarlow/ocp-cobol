IDENTIFICATION DIVISION.
PROGRAM-ID. HELLO-WORLD.

DATA DIVISION.
   WORKING-STORAGE SECTION.
   01 WS-CNT PIC 99(1) VALUE 0. 

PROCEDURE DIVISION.
    DISPLAY '<html>'.
    DISPLAY '<head>'.
    DISPLAY '<meta http-equiv="refresh" content="2">'.
    DISPLAY '<title>COBOL On OpenShift</title>'.
    DISPLAY '</head>'.
    DISPLAY '<body>'.
    DISPLAY '<img src=gnu-cobol.jpg width="200" height="200"> <img src=openshift.png width="200" height="200"><p>'.
    DISPLAY '<h1>COBOL running on OpenShift</h1>'.
    DISPLAY 'A simple for-loop generated with COBOL:<p>'.

    A-PARA.
    PERFORM B-PARA WITH TEST AFTER UNTIL WS-CNT>9.
    
    DISPLAY '<b>This content brought to you by:</b><p>'.
    DISPLAY '<i>COBOL(TM)- The code so good it will outlive you.</i>'.
    DISPLAY '<br><br><br><br><br><br><br><br><br><br><br><br>'.


    STOP RUN.
   
    B-PARA.
    DISPLAY 'COUNTING WITH COBOL! : 'WS-CNT' <p>'.
    ADD 1 TO WS-CNT.

