/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.pidster.tomcat.websocket.jmx;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.websocket.StreamInbound;
import org.apache.catalina.websocket.WebSocketServlet;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class WebSocketJMXServlet extends WebSocketServlet {

	private static final Log log = LogFactory.getLog(WebSocketJMXServlet.class);

	private static final long serialVersionUID = 1L;
	
	private String path;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String requestURI = req.getRequestURI();
		log.info("request.requestURI: " + requestURI);
		
		requestURI = requestURI.replaceFirst(req.getContextPath(), "");
		String target = requestURI.replaceFirst(path, "");
		log.info("target: " + target);
		
		super.doGet(req, resp);
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		this.path = config.getInitParameter("path");
		super.init(config);
	}

	@Override
	public void init() throws ServletException {
		super.init();
	}

	@Override
	protected boolean verifyOrigin(String origin) {
		return super.verifyOrigin(origin);
	}

	@Override
	protected String selectSubProtocol(List<String> subProtocols) {
		return super.selectSubProtocol(subProtocols);
	}

	@Override
	protected StreamInbound createWebSocketInbound(String subProtocol) {
		return new WebSocketJMXMessageInbound();
	}

}
