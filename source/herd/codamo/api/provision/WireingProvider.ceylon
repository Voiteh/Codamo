import herd.codamo.api.configuration {
	Configuration
}
import ceylon.language.meta.declaration {
	Module,
	ClassDeclaration
}
import herd.codamo.api.operation {
	Operation,
	WiredAnnotation
}
import herd.codamo.api.meta {
	annotatedDeclaration,
	instantiate
}

"Extracts and instantiates [[Operation]]s from a [[module]]"
by("Wojciech Potiopa")
shared {Operation*} provideOperations(Module \imodule)=>annotatedDeclaration<WiredAnnotation>(\imodule)
		.map((ClassDeclaration declaration) => instantiate<Operation>(declaration));

"Provider which handles provisioning of [[WiredAnnotation]] annotated [[Operation]]s"
shared class WireingProvider(
	"[[Module]] for which provisioning is made"
	Module \imodule,
	"Configurations for module. This is expermiental feature, the API for it may change"
	shared actual default {Configuration*} configurations={}
	) satisfies Provider {
		"Operations which are provided for [[module]]"
		shared actual default {Operation*} operations =provideOperations(\imodule);
	}