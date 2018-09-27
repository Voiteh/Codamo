
import herd.convertx.api {
	Context,
	ConvertionException
}
import ceylon.language.meta.model {
	Class
}

import herd.convertx.api.flattening {
	Findable,
	Executable,
	Visitor
}

shared sealed interface Creation<in Args=Nothing,out Result=Anything, in Kind=Nothing> satisfies Operation given Kind satisfies Result {
	
	throws (`class ConvertionException`)
	shared formal Result create(Context context,Class<Kind> kind, Args arguments);
	
	shared actual [Findable, Executable] flatten(Visitor visitor) => visitor.prepareCreatorRegistration(this);
	
	shared interface Matcher {
		shared formal Boolean match(Class<Kind> kind, Args arguments);
		shared formal Integer priority;
	}
	
	shared default Matcher? matcher=>null;
}