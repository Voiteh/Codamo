import herd.convertx.api {
	Convertx
}
import ceylon.logging {
	addLogWriter,
	writeSimpleLog,
	logger,
	info
}
import ceylon.test {
	beforeTestRun,
	TestListener,
	testExtension
}
import ceylon.test.event {
	TestStartedEvent
}
import herd.convertx.core.model {
	CoreProvider,
	DefaultContext
}
import herd.convertx.core.configuration {
	Logging
}
import herd.convertx.api.configuration {
	Configuration
}
import herd.convertx.api.provision {
	Provider
}

beforeTestRun
shared void setupLogger(){
	addLogWriter(writeSimpleLog);
}

class LoggingTestExtension() satisfies TestListener{
	value log =logger(`module`);
	shared actual void testStarted(TestStartedEvent event) {
		if (exists instance=event.instance) {
			log.info("----- TEST--STARTED ----- ``event.description`` -----");
		}
	}
}

testExtension(`class LoggingTestExtension`)
shared class BaseTest(shared Configuration[] configurations=[Logging(info,`module herd.convertx.core`)]) {
	
	shared default {Provider*} providers => [
		CoreProvider(configurations)
	];
	shared Convertx convertx => Convertx(
		DefaultContext{
			providers=providers;
		});
	
	
}