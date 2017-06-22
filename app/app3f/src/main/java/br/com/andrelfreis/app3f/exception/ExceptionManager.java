package br.com.andrelfreis.app3f.exception;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import br.com.andrelfreis.app3f.exception.handler.ExceptionHandler;


public class ExceptionManager {
	
	private static final Logger logger = LoggerFactory.getLogger(ExceptionManager.class);
	
	private final ExceptionHandlerMapper exceptionHandlersMapper;
	
	/** 
	 * @deprecated CDI eyes only
	 */
	public ExceptionManager() {
		this(null);
	}

	@Inject
	public ExceptionManager(ExceptionHandlerMapper exceptionHandlersMapper) {
		this.exceptionHandlersMapper = exceptionHandlersMapper;
	}


	public void handleException(final Exception e) {
		
		Class<? extends ExceptionHandler> handlerClass = exceptionHandlersMapper.findHandlerClassBy(e);
		
		Constructor<? extends ExceptionHandler> constructor = null;
		
		try {
			constructor = handlerClass.getConstructor(e.getClass());
		} 
		catch (NoSuchMethodException | SecurityException e2) {
			
			logger.error("\n\n\t Erro ao pegar o construtor da classe {} com argumento {}", handlerClass, e.getClass());
			e.printStackTrace();
			e2.printStackTrace();
		}
		
		//TODO if constructor != null;
		
		try {
			constructor.newInstance(e);
		} 
		catch (InstantiationException | IllegalAccessException | IllegalArgumentException | InvocationTargetException e3) {
			
			logger.error("\n\n\t Erro ao instanciar o Handler do construtor {} com argumento {}", constructor, e);
			e.printStackTrace();
			e3.printStackTrace();
		}
		
		
	}
	
}
