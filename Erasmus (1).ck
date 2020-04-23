SndBuf sb  => Pan2 sbPan  => dac;
SndBuf sb2 => Pan2 sb2Pan => dac;

1  => sb2Pan.pan;
-1 => sbPan.pan;
.7 => sb2.gain;        
.7 => sb.gain;

fun void foo(){
    while (true){
        "C:\\Users\\Thomas\\Desktop\\ErasmusDarwin\\splices\\42 (" + Math.random2( 1 , 27387 ) + ").wav" =>  string filename;
        filename => sb.read;  
        sb.length() => now;
        <<<sb.length()>>>;
    }
}

fun void bar(){
    while (true){
        "C:\\Users\\Thomas\\Desktop\\ErasmusDarwin\\splices\\42 (" + Math.random2( 1 , 27387 ) + ").wav" =>  string filename2;
        filename2 => sb2.read;  
        sb2.length() => now;
        <<<sb2.length()>>>;

    }
}
    
spork ~ foo();
    
3.5::second => now;
    
spork ~ bar();
/*
spork ~ foo(); 
spork ~ bar();
*/
   
while( true ){
    1::second => now;
}