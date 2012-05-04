package org.pidster.tomcat.websocket.jmx;

import java.io.IOException;
import java.lang.management.ManagementFactory;
import java.lang.management.MemoryMXBean;
import java.lang.management.ThreadMXBean;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.catalina.websocket.MessageInbound;
import org.apache.catalina.websocket.WsOutbound;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class WebSocketJMXMessageInbound extends MessageInbound {

	private static final Log log = LogFactory.getLog(WebSocketJMXMessageInbound.class);
	
	private ThreadMXBean threadMXBean = ManagementFactory.getThreadMXBean();
	
	private MemoryMXBean memoryMXBean = ManagementFactory.getMemoryMXBean();
	
	// private MBeanServer server = ManagementFactory.getPlatformMBeanServer();
	
	@Override
	protected void onBinaryMessage(ByteBuffer message) throws IOException {
		// NO-OP 
	}

	@Override
	protected void onTextMessage(CharBuffer message) throws IOException {
		log.info("Text Message received: " + message.toString());

		String command = message.toString();
		CharBuffer c;
		
		if ("collect".equals(command)) {
			c = collect();
		}
		else {
			c = message;
		}
		
		getWsOutbound().writeTextMessage(c);
		
	}

	@Override
	public void onUpgradeComplete() {
		log.info("Upgraded");
		super.onUpgradeComplete();
	}

	@Override
	protected void onOpen(WsOutbound outbound) {
		log.info("Opened");
		super.onOpen(outbound);
	}

	@Override
	protected void onClose(int status) {
		log.info("Closed");
		super.onClose(status);
	}
	
	private CharBuffer collect() {
		
		Map<String, Number> threadMap = new HashMap<String, Number>();
		Map<String, Number> memoryMap = new HashMap<String, Number>();
		
		
		int daemonThreadCount = threadMXBean.getDaemonThreadCount();
		int peakThreadCount = threadMXBean.getPeakThreadCount();
		int threadCount = threadMXBean.getThreadCount();
		
		long committedHeap = memoryMXBean.getHeapMemoryUsage().getCommitted();
		long initHeap = memoryMXBean.getHeapMemoryUsage().getInit();
		long maxHeap = memoryMXBean.getHeapMemoryUsage().getMax();
		long usedHeap = memoryMXBean.getHeapMemoryUsage().getUsed();

		long committedNonHeap = memoryMXBean.getNonHeapMemoryUsage().getCommitted();
		long initNonHeap = memoryMXBean.getNonHeapMemoryUsage().getInit();
		long maxNonHeap = memoryMXBean.getNonHeapMemoryUsage().getMax();
		long usedNonHeap = memoryMXBean.getNonHeapMemoryUsage().getUsed();

		threadMap.put("daemonThreadCount", daemonThreadCount);
		threadMap.put("peakThreadCount", peakThreadCount);
		threadMap.put("threadCount", threadCount);
		
		memoryMap.put("committedHeap", committedHeap);
		memoryMap.put("initHeap", initHeap);
		memoryMap.put("maxHeap", maxHeap);
		memoryMap.put("usedHeap", usedHeap);

		memoryMap.put("committedNonHeap", committedNonHeap);
		memoryMap.put("initNonHeap", initNonHeap);
		memoryMap.put("maxNonHeap", maxNonHeap);
		memoryMap.put("usedNonHeap", usedNonHeap);

		StringBuilder s = new StringBuilder();
		
		s.append("{\"threads\": {");
		Set<Entry<String, Number>> entrySet = threadMap.entrySet();
		int i=0;
		for (Entry<String, Number> e : entrySet) {
			i++;
			s.append("\"");
			s.append(e.getKey());
			s.append("\": ");
			s.append(e.getValue());
			if (i < entrySet.size()) {
				s.append(", ");
			}
		}
		s.append("}");
		s.append(", \"memory\": {");
		entrySet = memoryMap.entrySet();
		i=0;
		for (Entry<String, Number> e : entrySet) {
			i++;
			s.append("\"");
			s.append(e.getKey());
			s.append("\": ");
			s.append(e.getValue());
			if (i < entrySet.size()) {
				s.append(", ");
			}
		}
		s.append("}");
		
		s.append("}");

		return CharBuffer.wrap(s.toString());
	}

}
