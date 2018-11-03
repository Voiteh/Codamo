
import herd.codamo.json.meta {
	JsonMapping
}
import ceylon.language.meta.model {
	Attribute,
	Class
}

import herd.codamo.api.meta {
	Relation
}
import ceylon.json {
	Value,
	JsonObject
}
import herd.codamo.api.meta.component {
	ObjectToObjectMapper
}
import herd.codamo.api.operation {
	Creation,
	Delegator,
	wired
}

shared wired class ObjectToJsonObjectMapper() extends ObjectToObjectMapper<JsonMapping, {<String->Value>*}, JsonObject>(){
	shared actual JsonMapping createMapping({<String->Value>*} holder) => JsonMapping(holder);
	
	shared actual {<String->Value>*} mapAttributes(Delegator delegator,Object source, {Attribute<Nothing,Anything,Nothing>*} attributes) => attributes.map((Attribute<> element) {
		value val=element.bind(source).get();
		if(is Value val ){
			return element.declaration.name->val;
		}
		else{
			return element.declaration.name->delegator.convert(val, `Value`);
		}
	});
	
	shared actual Creation<Relation<Object,JsonObject>,JsonMapping,JsonMapping>.Matcher? matcher => object satisfies Creation<Relation<Object,JsonObject>,JsonMapping,JsonMapping>.Matcher{
		shared actual Boolean match(Class<JsonMapping,Nothing> kind, Relation<Object,JsonObject> arguments) => true;
		
		shared actual Integer priority => 2;
		
	};
		
}

