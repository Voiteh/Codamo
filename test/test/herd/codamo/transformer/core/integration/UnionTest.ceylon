import ceylon.test {
	test
}
shared class UnionTest() extends CoreIntegration(){
	
	
	shared test 
	void shouldConvertToUnion(){
		if(is Exception result=codamo.convert("5", `Integer?`)){
			throw result;
		}
		assert(is Integer result=codamo.convert("5", `Integer?`));
		assert(result==5);
	}
	
	shared test 
	void shouldConvertToUnionWithMovedTypes(){
		assert(is Integer result=codamo.convert("5", `Null|Integer`));
		assert(result==5);
	}
	shared test
	void shouldConvertToFloatBecauseOfUnionTypeIndexes(){
		assert(is Float result=codamo.convert("5", `Float|Integer`));
		assert(result==5.0);
	}
	
	
}