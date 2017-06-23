package br.com.andrelfreis.app3f.exception.handler;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DefaultExceptionHandler implements ExceptionHandler {

	private static final Logger logger = LoggerFactory.getLogger(DefaultExceptionHandler.class);
	
	@Override
	public void handleException(Exception exception) {
		
		logger.info("handle exception: {}", exception);
		
		
		
	}

}
