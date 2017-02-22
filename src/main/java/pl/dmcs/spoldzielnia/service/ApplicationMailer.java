package pl.dmcs.spoldzielnia.service;

public interface ApplicationMailer {
	  public void sendMail(String to, String subject, String body);
	   public void sendPreConfiguredMail(String message);
}
