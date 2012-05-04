package org.pidster.tomcat.websocket.jmx;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class WebSocketJMXResourceFilter implements Filter {

	private static final Log log = LogFactory.getLog(WebSocketJMXResourceFilter.class);
	
	private String path;

	@Override
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {

		HttpServletRequest hreq = (HttpServletRequest) req;
		HttpServletResponse hres = (HttpServletResponse) res;

		String requestURI = hreq.getRequestURI();
		requestURI = requestURI.replaceFirst(hreq.getContextPath(), "");
		String target = requestURI.substring(requestURI.lastIndexOf("/") + 1);
		
		if (requestURI.startsWith(path) && !"connect".equalsIgnoreCase(target)) {
			log.debug("forwarding to: " + target);
			
			hreq.setAttribute("path", path);
			hreq.getRequestDispatcher(String.format("/websocket-jmx-%s", target))
				.forward(hreq, hres);
		}
		else {
			chain.doFilter(hreq, hres);
		}
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		this.path = config.getInitParameter("path");
	}

	@Override
	public void destroy() {
		// NO-OP
	}

}
