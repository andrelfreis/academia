package br.com.andrelfreis.app3f.interceptor;


import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import br.com.andrelfreis.app3f.exception.ExceptionManager;
import br.com.caelum.vraptor.AroundCall;
import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.interceptor.ExceptionHandlerInterceptor;
import br.com.caelum.vraptor.interceptor.SimpleInterceptorStack;

@Intercepts(before=ExceptionHandlerInterceptor.class)
@RequestScoped
public class ExceptionInterceptor {
	
	private static final Logger logger = LoggerFactory.getLogger(ExceptionInterceptor.class);
	private final ExceptionManager exceptionManager;
	
	/** 
	 * @deprecated CDI eyes only
	 */
	protected ExceptionInterceptor() {
		this(null);
	}
	
	
	@Inject
	public ExceptionInterceptor(ExceptionManager exceptionManager) {
		this.exceptionManager = exceptionManager;
	}




	@AroundCall
	public void intercept(SimpleInterceptorStack stack) {
		
		try {
			stack.next();
		} 
		catch (Exception e) {
			
			System.out.println("\n\n\t ********* Teste Exception Interceptor  ********** \n\n");
			
			logger.debug("catching exception {}", e.getClass(), e);
			
			exceptionManager.handleException(e);
			
			throw e;
		}
		
	}
	
}
