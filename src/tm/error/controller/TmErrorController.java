package tm.error.controller;


import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/tm/error")
public class TmErrorController {
	private static final Logger logger = LoggerFactory.getLogger(TmErrorController.class);

	@RequestMapping(value = "/throwable")
	public String throwable(HttpServletRequest request, Model model) {
		logger.info("throwable");
		pageErrorLog(request);
		return "/error/errorpageException";
	}

	@RequestMapping(value = "/exception")
	public String exception(HttpServletRequest request, Model model) {
		logger.info("exception");
		pageErrorLog(request);
		return "/error/errorpageException";
	}
	//400에러 발생시
	@RequestMapping(value = "/400")
	public String pageError400(HttpServletRequest request, Model model) {
		logger.info("page error code 400");
		pageErrorLog(request);
		return "/error/errorpage400";
	}
	//403에러 발생시
	@RequestMapping(value = "/403")
	public String pageError403(HttpServletRequest request, Model model) {
		logger.info("page error code 403");
		pageErrorLog(request);
		return "/error/errorpage403";
	}
	//404에러 발생시
	@RequestMapping(value = "/404")
	public String pageError404(HttpServletRequest request, Model model) {
		logger.info("page error code 404");
		pageErrorLog(request);
		return "/error/errorpage404";
	}
	//405에러 발생시
	@RequestMapping(value = "/405")
	public String pageError405(HttpServletRequest request, Model model) {
		logger.info("page error code 405");
		pageErrorLog(request);
		return "/error/errorpage405";
	}
	//500에러 발생시
	@RequestMapping(value = "/500")
	public String pageError500(HttpServletRequest request, Model model) {
		logger.info("page error code 500");
		pageErrorLog(request);
		return "/error/errorpage500";
	}
	//503에러 발생시
	@RequestMapping(value = "/503")
	public String pageError503(HttpServletRequest request, Model model) {
		logger.info("page error code 503");
		pageErrorLog(request);
		return "/error/errorpage503";
	}

	private void pageErrorLog(HttpServletRequest request) {
		logger.info("status_code : " + request.getAttribute("javax.servlet.error.status_code"));
		logger.info("exception_type : " + request.getAttribute("javax.servlet.error.exception_type"));
		logger.info("message : " + request.getAttribute("javax.servlet.error.message"));
		logger.info("request_uri : " + request.getAttribute("javax.servlet.error.request_uri"));
		logger.info("exception : " + request.getAttribute("javax.servlet.error.exception"));
		logger.info("servlet_name : " + request.getAttribute("javax.servlet.error.servlet_name"));
	}

}
