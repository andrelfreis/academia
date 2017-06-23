package br.com.andrelfreis.app3f.exception;

public class UnexpectedException extends RuntimeException {


	private static final long serialVersionUID = 1L;


	public UnexpectedException(final String message) {
		super(message);
	}


	public UnexpectedException(String message, Throwable cause) {
		super(message, cause);
	}


}
