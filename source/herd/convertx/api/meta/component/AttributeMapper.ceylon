import ceylon.language.meta.model {
	Class,
	Attribute
}
import herd.convertx.api {
	Context
}

import ceylon.collection {
	HashMap
}

import herd.convertx.api.meta {
	Relation,
	AttributePartialization
}
import herd.convertx.api.component {
	Creator
}

shared abstract class AttributeMapper<Source,Result>()
		 satisfies Creator<Relation<Source, Result>,AttributePartialization>
		given Source satisfies Object
		{
	shared formal {<Attribute<Source>->Attribute<Result>>*} relations;
	shared actual AttributePartialization create(Context context, Class<AttributePartialization,Nothing> kind, Relation<Source,Result> arguments) {
		value entries=relations.map((Attribute<Source,Anything,Nothing> sourceAttribute -> Attribute<Result,Anything,Nothing> destAttribute) {
			value sourcePartValue=sourceAttribute.bind(arguments.source).get();
			value resultPartValue=context.convert(sourcePartValue,destAttribute.type);
			return destAttribute->resultPartValue;
		});
		return AttributePartialization(HashMap<Attribute<>,Anything>{entries=entries;});
	}
	
}