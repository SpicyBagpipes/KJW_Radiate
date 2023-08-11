#define MACRO_FACE_PROTECTION(CLASS,BASECLASS,VALUE,DEPENDENT) class CLASS : BASECLASS {\
	KJW_Radiate_ProtectionValue = VALUE ;\
	KJW_Radiate_BackpackDependent = DEPENDENT ;\
};
