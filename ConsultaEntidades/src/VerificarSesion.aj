public aspect VerificarSesion {	
    // Definir el pointcut, es decir, el punto donde ocurrirá la llamada al inicio de sesión.
    pointcut nombrePointcut(): call(* consultar*(..)); 
  //Advices. Se ejecutarán en el lugar indicado por el pointcut.
    before() : nombrePointcut() {
        // MétodoInicioSesión
    	
    	
    } 
    after() : nombrePointcut()  {
        //Ya se inició sesión. (Puede imprimir un mensaje)
    	//System.out.println("Ya inicio sesion.");
    }  
}