import ceylon.language.meta.model {
	ClassOrInterface,
	Interface
}

import herd.codamo.api.core.transformer {
	Converter,
	Delegator,
	Matchable
}
import herd.codamo.api.core.util {
	runtimeCall
}
import herd.type.support {
	flat
}

"Converts one generic [[Iterable]] to another. Uses matcher for matching for finding if this converter is applicable."
by ("Wojciech Potiopa")
shared class IterableToIterableConverter() extends Converter<{Anything*},{Anything*},ClassOrInterface<{Anything*}>>() {
	shared actual {Anything*} convert(Delegator delegator, {Anything*} source, ClassOrInterface<{Anything*}> resultType) {
		assert (exists explictIterableType = flat.types(resultType)
				.narrow<Interface<>>()
				.find((Interface<> element) => element.declaration == `interface Iterable`));
		assert (exists elementType = explictIterableType.typeArgumentList.first);
		value args = source.collect((Anything element) => delegator.convert(element, elementType)).sequence();
		value narrowedArgs = runtimeCall.iterable.narrow(args, elementType);
		value resolvedType = delegator.resolve(args, resultType);
		return delegator.create(resolvedType, narrowedArgs);
	}
	
	matchable => object satisfies Matchable<{Anything*},ClassOrInterface<{Anything*}>> {
		shared actual Boolean predicate({Anything*} source, ClassOrInterface<{Anything*}> resultType) => true;
		
		shared actual Integer priority = 1;
	};
}
