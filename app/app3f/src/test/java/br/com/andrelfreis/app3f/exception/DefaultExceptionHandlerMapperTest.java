package br.com.andrelfreis.app3f.exception;

import static org.junit.Assert.assertEquals;

import java.util.LinkedHashMap;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;

import br.com.andrelfreis.app3f.exception.handler.AnotherExceptionHandler;
import br.com.andrelfreis.app3f.exception.handler.DefaultExceptionHandler;
import br.com.andrelfreis.app3f.exception.handler.ExceptionHandler;
import br.com.andrelfreis.app3f.exception.handler.LessSpecificHandler;

public class DefaultExceptionHandlerMapperTest {

	private Map<Class<? extends Exception>, Class<? extends ExceptionHandler>> handlers;

	@Test
	public void sholudFindOneHandlerInMap() {
		
		handlers.put(Exception.class, ExceptionHandler.class);
		DefaultExceptionHandlerMapper mapper = new DefaultExceptionHandlerMapper(handlers);
		
		Class<? extends ExceptionHandler> handlerClass = mapper.findHandlerClassBy(new Exception());
		
		assertEquals(handlerClass, ExceptionHandler.class);
	}
	
	@Test
	public void shouldFindFirstOfTwoHandlersInMap() {
	
		handlers.put(UnexpectedException.class, DefaultExceptionHandler.class);
		handlers.put(Exception.class, ExceptionHandler.class);
		DefaultExceptionHandlerMapper mapper = new DefaultExceptionHandlerMapper(handlers);
		
		Class<? extends ExceptionHandler> handlerClass = mapper.findHandlerClassBy(new UnexpectedException("test"));
		
		assertEquals(handlerClass, DefaultExceptionHandler.class);
	}
	
	@Test
	public void shouldFindSecondOfTwoHandlersInMap() {
		
		handlers.put(NullPointerException.class, DefaultExceptionHandler.class);
		handlers.put(UnexpectedException.class, AnotherExceptionHandler.class);
		handlers.put(Exception.class, ExceptionHandler.class);
		DefaultExceptionHandlerMapper mapper = new DefaultExceptionHandlerMapper(handlers);
		
		Class<? extends ExceptionHandler> handlerClass = mapper.findHandlerClassBy(new UnexpectedException("test"));
		
		assertEquals(handlerClass, AnotherExceptionHandler.class);
	}
	
	@Test
	public void shouldFindTheLessSpecificHandlerInMap() {
		
		handlers.put(NullPointerException.class, DefaultExceptionHandler.class);
		handlers.put(UnexpectedException.class, AnotherExceptionHandler.class);
		handlers.put(Exception.class, LessSpecificHandler.class);
		DefaultExceptionHandlerMapper mapper = new DefaultExceptionHandlerMapper(handlers);
		
		Class<? extends ExceptionHandler> handlerClass = mapper.findHandlerClassBy(new IllegalArgumentException("test"));
		
		assertEquals(handlerClass, LessSpecificHandler.class);
	}
	
	@Before
	public void setup() {
		handlers = new LinkedHashMap<>();
	}
	
}
