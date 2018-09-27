import ceylon.language.meta.model {
	Type,
	Class
}
import herd.convertx.api {
	Context
}

import herd.convertx.api.flattening {
	Findable,
	Executable,
	Visitor
}
shared sealed interface Resolvance<in Source=Nothing, out Output=Anything, in OutputType=Nothing> satisfies Operation
		given OutputType satisfies Type<Output> {
	
	shared interface Matcher {
		shared formal Boolean match(Source input, OutputType outputType);
		shared formal Integer priority;
	}
	
	shared formal Class<Output> resolve(Context context, Source input, OutputType outputType);
	
	shared actual [Findable, Executable] flatten(Visitor visitor) => visitor.prepareResolverRegistration(this);
	
	
	
	shared default Matcher? matcher=>null ;
}