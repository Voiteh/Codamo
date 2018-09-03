import ceylon.language.meta.model {
	Type
}
import herd.convertx.core.api {
	Context
}
import herd.convertx.core.api.component {
	Converter,
	wired
}
wired
shared class IntegerToByteConverter() satisfies Converter<Integer,Byte>{
	shared actual Byte convert(Context context, Integer source, Type<Byte> resultType) => source.byte;
	
}