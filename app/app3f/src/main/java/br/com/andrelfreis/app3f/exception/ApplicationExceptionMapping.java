package br.com.andrelfreis.app3f.exception;

import br.com.andrelfreis.app3f.exception.handler.ApplicationExceptionHandler;

public interface ApplicationExceptionMapping {
	
	ApplicationExceptionHandler findByException(Exception exception);
	
}
