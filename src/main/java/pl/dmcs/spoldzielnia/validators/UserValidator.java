package pl.dmcs.spoldzielnia.validators;

import org.apache.commons.validator.routines.EmailValidator;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import pl.dmcs.spoldzielnia.domain.User;

public class UserValidator implements Validator {

	EmailValidator emailValidator = EmailValidator.getInstance();
	boolean isValid;

	@Override
	public boolean supports(Class clazz) {
		return User.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object arg0, Errors arg1) {
		// TODO Auto-generated method stub
	}

	public void validate(User user, Errors errors) {
		ValidationUtils.rejectIfEmpty(errors, "firstname", "error.field.required");
		ValidationUtils.rejectIfEmpty(errors, "lastname", "error.field.required");
		ValidationUtils.rejectIfEmpty(errors, "telephone", "error.field.required");
		ValidationUtils.rejectIfEmpty(errors, "email", "error.field.required");
		ValidationUtils.rejectIfEmpty(errors, "login", "error.field.required");
		ValidationUtils.rejectIfEmpty(errors, "password", "error.field.required");
		ValidationUtils.rejectIfEmpty(errors, "amountOfLocators", "error.field.required");
		if (errors.getErrorCount() == 0) {


			if (StringUtils.hasText(user.getAmountOfLocators())) {
				String amountOfLocators = user.getAmountOfLocators();
				String pattern = "[0-9]+";
				isValid = amountOfLocators.matches(pattern);

				if (isValid == false) {
					errors.rejectValue("amountOfLocators", "error.amountOfLocators.invalid");
				}
			}
		

			if (StringUtils.hasText(user.getEmail()) && emailValidator.isValid(user.getEmail()) == false) {
				errors.rejectValue("email", "error.email.invalid");
			}
			if (StringUtils.hasText(user.getTelephone())) {
				String telephone = user.getTelephone();
				String pattern = "\\d{3}-\\d{3}-\\d{3}";
				isValid = telephone.matches(pattern);

				if (isValid == false) {
					errors.rejectValue("telephone", "error.phone.invalid");
				}
			}
		}
	}

}
