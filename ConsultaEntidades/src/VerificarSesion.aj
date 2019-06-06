import javax.swing.JOptionPane;

public aspect VerificarSesion {	
    // Definir el pointcut, es decir, el punto donde ocurrir� la llamada al inicio de sesi�n.
    pointcut clickTable(): call(* *.consultar(..)); 
  //Advices. Se ejecutar�n en el lugar indicado por el pointcut.
    before() : clickTable() {
        // M�todoInicioSesi�n
    	
    	if(!IniciarSesion.sesionIniciada && !Entidad.mensaje.isVisible()) {
    		System.out.println("Debe iniciar sesion antes");
			IniciarSesion.initialize();
    		
	    	}else if(IniciarSesion.sesionIniciada && !Entidad.mensaje.isVisible()) {
	    		Clientes.mensaje.setVisible(true);
	    	}
    	
    } 
    
    after() : clickTable()  {
        //Ya se inici� sesi�n. (Puede imprimir un mensaje)
    	if(IniciarSesion.sesionIniciada) {
    		JOptionPane.showMessageDialog(null, "Inici� sesion!");
    		Entidad.mensaje.setVisible(true);
	    	}else {
	    		JOptionPane.showMessageDialog(null, "Inicie sesion please");
	    	}
    	
    }  
}