package br.com.andrelfreis.app3f.exception;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.enterprise.context.RequestScoped;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import br.com.andrelfreis.app3f.exception.handler.ApplicationExceptionHandler;
import br.com.andrelfreis.app3f.exception.handler.DefaultApplicationExceptionHandler;

@RequestScoped
public class DefaultApplicationExceptionMapping implements ApplicationExceptionMapping {
	
	private static final Logger logger = LoggerFactory.getLogger(DefaultApplicationExceptionMapping.class);
	private static final Map<Class<? extends Exception>, ApplicationExceptionHandler> exceptionsHandlersMap = mapHandlers();
	
	
	
	private static Map<Class<? extends Exception>, ApplicationExceptionHandler> mapHandlers() {
		Map<Class<? extends Exception>, ApplicationExceptionHandler> _exceptionsHandlersMap = new LinkedHashMap<>();
		
		//TODO adicionar aqui os Handlers específicos
		
		return _exceptionsHandlersMap;
	}


	@Override
	public ApplicationExceptionHandler findByException(Exception e) {
		
		logger.debug("find for exception {}", e.getClass());
		
		for (Entry<Class<? extends Exception>, ApplicationExceptionHandler> entry : exceptionsHandlersMap.entrySet()) {
			if (entry.getKey().isInstance(e)) {
				logger.debug("found exception mapping: {} -> {}", entry.getKey(), entry.getValue());

				return entry.getValue();
			}
		}
		
		return hasExceptionCause(e) ? findByException((Exception) e.getCause()) : new DefaultApplicationExceptionHandler();
	}

	private boolean hasExceptionCause(Exception e) {
		return e.getCause() != null && e.getCause() instanceof Exception;
	}
		

}
