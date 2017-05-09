package br.com.andrelfreis.app3f.interceptor;


import static com.google.common.base.Throwables.getRootCause;

import javax.enterprise.context.RequestScoped;

import br.com.caelum.vraptor.AroundCall;
import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.interceptor.ExceptionHandlerInterceptor;
import br.com.caelum.vraptor.interceptor.SimpleInterceptorStack;

@Intercepts(before=ExceptionHandlerInterceptor.class)
@RequestScoped
public class ApplicationExceptionInterceptor {

	@AroundCall
	public void intercept(SimpleInterceptorStack stack) {
		
		try {
			stack.next();
		} 
		catch (Exception e) {
			
			Throwable rootCause = getRootCause(e);
						
			System.out.println("\n\n\t ********* Teste Exception Interceptor  ********** \n\n");
			throw e;
		}
		
	}
	
}
