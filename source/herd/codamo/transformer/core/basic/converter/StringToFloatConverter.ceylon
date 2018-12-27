
import ceylon.language.meta.model {
	Type
}

import herd.codamo.api.core.transformer {
	Converter,
	provided,
	ConvertionError,
	Delegator
}

"Converts [[String]] value into [[Float]]. 
 
 Given [[String]] x, [[Float y]], x=y.string then Float.parse(x) 

 Else given [[String]] x then [[ConvertionError]]
 "
tagged("Basic")
by("Wojciech Potiopa")
shared provided class StringToFloatConverter() satisfies Converter<String,Float> {
	shared actual Float convert(Delegator delegator, String source, Type<Float> resultType) {
		value parse = Float.parse(source);
		switch(parse)
		case (is Float) {
			return parse;
		}else{
			throw ConvertionError(source, resultType,parse);
		}
	}
	
}