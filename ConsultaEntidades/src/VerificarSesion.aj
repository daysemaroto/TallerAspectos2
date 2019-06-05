public aspect VerificarSesion {	
    // Definir el pointcut, es decir, el punto donde ocurrirá la llamada al inicio de sesión.
    pointcut nombrePointcut(): call(* consultar*(..)); 
  //Advices. Se ejecutarán en el lugar indicado por el pointcut.
    before() : nombrePointcut() {
        // MétodoInicioSesión
    	
    	if(!IniciarSesion.sesionIniciada && !Entidad.mensaje.isVisible()) {
    		System.out.println("Debe iniciar sesion antes");
			IniciarSesion.initialize();
    		
	    	}else if(IniciarSesion.sesionIniciada && !Entidad.mensaje.isVisible()) {
	    		Clientes.mensaje.setVisible(true);
	    	}
    	
    } 
    
    after() : nombrePointcut()  {
        //Ya se inició sesión. (Puede imprimir un mensaje)
    	if(IniciarSesion.sesionIniciada) {
    		System.out.println("Ya inicio sesion.");
    		Entidad.mensaje.setVisible(true);
	    	}else {
	    		System.out.println("Inicie Sesion please");
	    	}
    	
    }  
}