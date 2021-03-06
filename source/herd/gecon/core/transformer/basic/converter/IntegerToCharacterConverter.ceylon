import ceylon.language.meta.model {
	Type
}


import herd.gecon.core.api.transformer {
	Converter,
	
	Delegator
}

"Converts [[Integer]] value into [[Character]]. The result will be the same as calling [[Integer.character]] "
tagged("Basic")
by("Wojciech Potiopa")
shared class IntegerToCharacterConverter() extends Converter<Integer,Character,Type<Character>>(){
	shared actual Character convert(Delegator delegator, Integer source, Type<Character> resultType) => source.character;
	
}