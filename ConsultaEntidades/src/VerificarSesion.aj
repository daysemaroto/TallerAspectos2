public aspect VerificarSesion {	
    // Definir el pointcut, es decir, el punto donde ocurrir� la llamada al inicio de sesi�n.
    pointcut nombrePointcut(): call(* consultar*(..)); 
  //Advices. Se ejecutar�n en el lugar indicado por el pointcut.
    before() : nombrePointcut() {
        // M�todoInicioSesi�n
    	
    	if(!IniciarSesion.sesionIniciada && !Entidad.mensaje.isVisible()) {
    		System.out.println("Debe iniciar sesion antes");
			IniciarSesion.initialize();
    		
	    	}else if(IniciarSesion.sesionIniciada && !Entidad.mensaje.isVisible()) {
	    		Clientes.mensaje.setVisible(true);
	    	}
    	
    } 
    
    after() : nombrePointcut()  {
        //Ya se inici� sesi�n. (Puede imprimir un mensaje)
    	if(IniciarSesion.sesionIniciada) {
    		System.out.println("Ya inicio sesion.");
    		Entidad.mensaje.setVisible(true);
	    	}else {
	    		System.out.println("Inicie Sesion please");
	    	}
    	
    }  
}