package br.com.andrelfreis.app3f.exception;

import br.com.andrelfreis.app3f.exception.handler.ExceptionHandler;

public interface ExceptionHandlerMapper {
	
	Class<? extends ExceptionHandler> findHandlerClassBy(Exception e);
	
}
