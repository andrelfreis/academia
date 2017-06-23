package br.com.andrelfreis.app3f.exception;

import static com.google.common.base.Throwables.getRootCause;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.text.MessageFormat;

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
		logger.debug("handle exception {} with rootCause {}", e, getRootCause(e));
		ExceptionHandler exceptionHandler = findExceptionHandlerBy(e);
		exceptionHandler.handleException(e);
	}
	
	
	private ExceptionHandler findExceptionHandlerBy(Exception e) {

		Class<? extends ExceptionHandler> handlerClass = exceptionHandlersMapper.findHandlerClassBy(e);

		Constructor<? extends ExceptionHandler> constructor = null;
		try {
			constructor = handlerClass.getConstructor(e.getClass());
		} 
		catch (NoSuchMethodException | SecurityException e2) {
			String patern = "Error getting constructor of the class {} with argument {}";
			String message = MessageFormat.format(patern, handlerClass, e.getClass());
			throw new UnexpectedException(message , e2);
		}
		
		ExceptionHandler exceptionHandler = null;
		try {
			exceptionHandler = constructor.newInstance(e);
		} 
		catch (InstantiationException | IllegalAccessException | IllegalArgumentException | InvocationTargetException e3) {
			String patern = "Error instantiating Handler of the constructor {} with argument {}";
			String message = MessageFormat.format(patern, constructor, e);
			throw new UnexpectedException(message , e3);
		}
		
		return exceptionHandler;
	}
	
	
}
