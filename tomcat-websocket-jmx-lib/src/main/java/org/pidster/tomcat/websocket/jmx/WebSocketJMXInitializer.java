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

import java.util.EnumSet;
import java.util.Set;

import javax.servlet.DispatcherType;
import javax.servlet.FilterRegistration;
import javax.servlet.ServletContainerInitializer;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class WebSocketJMXInitializer implements ServletContainerInitializer {
	
	private static final Log log = LogFactory.getLog(WebSocketJMXInitializer.class);

	@Override
	public void onStartup(Set<Class<?>> c, ServletContext ctx)
			throws ServletException {

		// Allows the path of the Servlet & Filter to be configurable
		// relative to the web application's own path
		String path = System.getProperty("org.pidster.tomcat.websocket.jmx.path", "/jmx");
		
		log.info("Registering " + WebSocketJMXResourceFilter.class.getName() + ", with paths: " + path);
		FilterRegistration.Dynamic freg = ctx.addFilter(WebSocketJMXResourceFilter.class.getSimpleName(), WebSocketJMXResourceFilter.class);
		freg.addMappingForUrlPatterns(EnumSet.of(DispatcherType.REQUEST), true, path + "/*");
		freg.setInitParameter("path", path);

		String wspath = path + "/connect";
		
		log.info("Registering " + WebSocketJMXServlet.class.getName() + ", with path: " + wspath);
		ServletRegistration.Dynamic wreg = ctx.addServlet(WebSocketJMXServlet.class.getSimpleName(), WebSocketJMXServlet.class);
		wreg.addMapping(wspath);
		wreg.setInitParameter("path", path);

	}

}
