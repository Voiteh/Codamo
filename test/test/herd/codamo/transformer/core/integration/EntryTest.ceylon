import ceylon.test {
	test
}
shared class EntryTest() extends CoreIntegration(){
	
	
	shared test
	void shouldConvertEntryToEntry(){
		assert(is String->Integer result=codamo.convert(3->"4", `String->Integer`));
		assert(result.key=="3");
		assert(result.item==4);
		
	}
	
	
	
	
}