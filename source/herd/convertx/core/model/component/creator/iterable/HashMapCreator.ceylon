import ceylon.collection {
	Hashtable,
	linked,
	HashMap
}
import herd.convertx.core.api.component {
	Creator,
	wired
}
import ceylon.language.meta.model {
	Class
}
import herd.convertx.core.api {
	Context
}
wired
shared class HashMapCreator() satisfies  Creator<Map<>,{Entry<Object,Anything>*}> {
	shared actual Map<> create(Context context,Class<Map<>,Nothing> kind, {Entry<Object,Anything>*} arguments) {
		return kind.apply(linked, Hashtable(), arguments);
	}
	matcher => object satisfies Creator<Map<>,{Entry<Object,Anything>*}>.Matcher {
		shared actual Boolean match(Class<Map<>,Nothing> kind, {Entry<Object,Anything>*} arguments) {
			return kind.declaration==`class HashMap`;
		}
		
		shared actual Integer priority => 1;
	};
}