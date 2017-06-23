package br.com.andrelfreis.app3f.exception;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.enterprise.context.RequestScoped;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import br.com.andrelfreis.app3f.exception.handler.DefaultExceptionHandler;
import br.com.andrelfreis.app3f.exception.handler.ExceptionHandler;

@RequestScoped
public class DefaultExceptionHandlerMapper implements ExceptionHandlerMapper {
	
	private static final Logger logger = LoggerFactory.getLogger(DefaultExceptionHandlerMapper.class);
	private static Map<Class<? extends Exception>, Class<? extends ExceptionHandler>> exceptionsHandlersMap;
	
	/**
	 * @deprecated CDI eyes only
	 */
	public DefaultExceptionHandlerMapper() {
		DefaultExceptionHandlerMapper.exceptionsHandlersMap = loadExceptionHandlers();
	}
	
	public DefaultExceptionHandlerMapper(Map<Class<? extends Exception>, Class<? extends ExceptionHandler>> exceptionsHandlersMap) {
		DefaultExceptionHandlerMapper.exceptionsHandlersMap = exceptionsHandlersMap;
	}

	private static Map<Class<? extends Exception>, Class<? extends ExceptionHandler>> loadExceptionHandlers() {
		Map<Class<? extends Exception>, Class<? extends ExceptionHandler>> handlers = new LinkedHashMap<>();
		
		//TODO: Put your ExceptionHandlers here:
		//exceptionsHandlersMap.put(YourException.class, YourExceptionHandler.class);
		
		return handlers;
	}

	@Override
	public Class<? extends ExceptionHandler> findHandlerClassBy(Exception e) {
		
		logger.debug("finding ExceptionHandler Class by {}", e.getClass());
		
		for (Entry<Class<? extends Exception>, Class<? extends ExceptionHandler>> entry : exceptionsHandlersMap.entrySet()) {
			if (entry.getKey().isInstance(e)) {
				logger.debug("found ExceptionHandler Class: {} -> {}", entry.getKey(), entry.getValue());

				return entry.getValue();
			}
		}
		
		return hasExceptionCause(e) ? findHandlerClassBy((Exception) e.getCause()) : DefaultExceptionHandler.class;
	}

	private boolean hasExceptionCause(Exception e) {
		return e.getCause() != null && e.getCause() instanceof Exception;
	}


		

}
