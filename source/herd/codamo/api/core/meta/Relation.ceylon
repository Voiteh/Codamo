import ceylon.language.meta.model {
	Class
}
"API for defining relations between [[Source]] data and [[Result]] class."
tagged("Generic")
by("Wojciech Potiopa")
shared interface Relation<out Source=Anything,out Result=Anything> {
	
	""
	shared formal Source source;
	shared formal Class<Result> resultClass;
	
}