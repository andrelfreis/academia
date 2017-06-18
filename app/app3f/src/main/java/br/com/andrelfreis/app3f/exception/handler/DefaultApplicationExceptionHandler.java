package br.com.andrelfreis.app3f.exception.handler;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DefaultApplicationExceptionHandler implements ApplicationExceptionHandler {

	private static final Logger logger = LoggerFactory.getLogger(DefaultApplicationExceptionHandler.class);
	
	@Override
	public void handleException(Exception exception) {
		
		logger.debug("No ApplicationExceptionHandler found, using Default");
		logger.info("handle exception: {}", exception);
		
	}

}
