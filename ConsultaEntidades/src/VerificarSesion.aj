import javax.swing.JOptionPane;

public aspect VerificarSesion {	
    // Definir el pointcut, es decir, el punto donde ocurrirá la llamada al inicio de sesión.
    pointcut clickTable(): call(* *.consultar(..)); 
  //Advices. Se ejecutarán en el lugar indicado por el pointcut.
    before() : clickTable() {
        // MétodoInicioSesión
    	
    	if(!IniciarSesion.sesionIniciada && !Entidad.mensaje.isVisible()) {
    		System.out.println("Debe iniciar sesion antes");
			IniciarSesion.initialize();
    		
	    	}else if(IniciarSesion.sesionIniciada && !Entidad.mensaje.isVisible()) {
	    		Clientes.mensaje.setVisible(true);
	    	}
    	
    } 
    
    after() : clickTable()  {
        //Ya se inició sesión. (Puede imprimir un mensaje)
    	if(IniciarSesion.sesionIniciada) {
    		JOptionPane.showMessageDialog(null, "Inició sesion!");
    		Entidad.mensaje.setVisible(true);
	    	}else {
	    		JOptionPane.showMessageDialog(null, "Inicie sesion please");
	    	}
    	
    }  
}