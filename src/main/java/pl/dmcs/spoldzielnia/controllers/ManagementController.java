package pl.dmcs.spoldzielnia.controllers;

import java.util.Locale;
import java.util.Set;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;


@Controller
@SessionAttributes
public class ManagementController {





	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		return "home";
	}

	@RequestMapping(value = "/welcome.htm")
	protected View welcome() {

		Set<String> roles = AuthorityUtils
				.authorityListToSet(SecurityContextHolder.getContext().getAuthentication().getAuthorities());
		if (roles.contains("ROLE_ADMIN")) {
			return new RedirectView("admin/management");
		}
		return new RedirectView("user/home");
	}

	
	
	
	
	@RequestMapping("/news")
	public String news() {

		return "news";
	}

	@RequestMapping("/about")
	public String about() {

		return "about";
	}

	@RequestMapping("/download")
	public String download() {

		return "download";
	}

	@RequestMapping("/locals")
	public String lokal() {

		return "locals";
	}

	@RequestMapping("/m3")
	public String m3() {

		return "m3";
	}

	@RequestMapping("/regulations")
	public String regulations() {

		return "regulations";
	}
	@RequestMapping("/charges")
	public String charges() {

		return "charges";
	}



}
