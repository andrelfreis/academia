package br.com.andrelfreis.app3f.interceptor;


import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import br.com.andrelfreis.app3f.exception.ApplicationExceptionMapping;
import br.com.andrelfreis.app3f.exception.handler.ApplicationExceptionHandler;
import br.com.caelum.vraptor.AroundCall;
import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.interceptor.ExceptionHandlerInterceptor;
import br.com.caelum.vraptor.interceptor.SimpleInterceptorStack;

@Intercepts(before=ExceptionHandlerInterceptor.class)
@RequestScoped
public class ApplicationExceptionInterceptor {
	
	private static final Logger logger = LoggerFactory.getLogger(ApplicationExceptionInterceptor.class);
	private final ApplicationExceptionMapping exceptionHandlers;
	
	/** 
	 * @deprecated CDI eyes only
	 */
	protected ApplicationExceptionInterceptor() {
		this(null);
	}
	
	
	@Inject
	public ApplicationExceptionInterceptor(ApplicationExceptionMapping exceptionHandlers) {
		this.exceptionHandlers = exceptionHandlers;
	}




	@AroundCall
	public void intercept(SimpleInterceptorStack stack) {
		
		try {
			stack.next();
		} 
		catch (Exception e) {
			
			System.out.println("\n\n\t ********* Teste Exception Interceptor  ********** \n\n");
			
			logger.debug("catching exception {}", e.getClass(), e);
			
			ApplicationExceptionHandler exceptionHandler = exceptionHandlers.findByException(e);
			exceptionHandler.handleException(e);
			
			throw e;
		}
		
	}
	
}
